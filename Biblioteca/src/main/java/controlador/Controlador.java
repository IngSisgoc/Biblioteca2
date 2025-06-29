package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Persona;
import modelo.PersonaDAO;
import modelo.Prestamo;
import modelo.PrestamoDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class Controlador extends HttpServlet {

    PersonaDAO dao = new PersonaDAO();
    Persona p = new Persona();
    int r;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String nom = request.getParameter("txtNom");
            String correo = request.getParameter("txtCorreo");
            p.setNom(nom);
            p.setCorreo(correo);
            r = dao.validar(p);
            if (r == 1) {
                request.getSession().setAttribute("nom", nom);
                request.getSession().setAttribute("correo", correo);
                request.getSession().setAttribute("rol", p.getRol());
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
            } else {
                System.out.println("No se encontró el usuario. Redirigiendo a index.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        if (accion == null || accion.equals("listar")) {
            // código para listar personas
        } else if (accion.equals("agregar")) {
            // código para agregar persona
        } else if (accion.equals("verAlertas")) {
            PrestamoDAO dao = new PrestamoDAO();
            List<Prestamo> alertas = dao.listarAlertasProximas();

            request.setAttribute("alertas", alertas);
            request.getRequestDispatcher("alertas.jsp").forward(request, response);
        } 
        //SE AGREGA USUARIO
        else if (accion.equals("listarUsuario")) {
            UsuarioDAO daoUsuario = new UsuarioDAO();
            List<Usuario> lista = daoUsuario.listar();
            request.setAttribute("usuarios", lista);
            request.getRequestDispatcher("vistas/listarUsuario.jsp").forward(request, response);

        } else if (accion.equals("agregarUsuario")) {
            String nom = request.getParameter("txtNom");
            String correo = request.getParameter("txtCorreo");
            String rol = request.getParameter("txtRol");

            Usuario u = new Usuario();
            u.setNom(nom);
            u.setCorreo(correo);
            u.setRol(rol);

            UsuarioDAO daoUsuario = new UsuarioDAO();
            daoUsuario.agregar(u);
            response.sendRedirect("Controlador?accion=listarUsuario");

        } else if (accion.equals("editarUsuario")) {
            int id = Integer.parseInt(request.getParameter("id"));
            UsuarioDAO daoUsuario = new UsuarioDAO();
            Usuario u = daoUsuario.listarPorId(id);
            request.setAttribute("usuario", u);
            request.getRequestDispatcher("vistas/formUsuario.jsp").forward(request, response);

        } else if (accion.equals("actualizarUsuario")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("txtNom");
            String correo = request.getParameter("txtCorreo");
            String rol = request.getParameter("txtRol");

            Usuario u = new Usuario();
            u.setId(id);
            u.setNom(nom);
            u.setCorreo(correo);
            u.setRol(rol);

            UsuarioDAO daoUsuario = new UsuarioDAO();
            daoUsuario.actualizar(u);
            response.sendRedirect("Controlador?accion=listarUsuario");

        } else if (accion.equals("eliminarUsuario")) {
            int id = Integer.parseInt(request.getParameter("id"));
            UsuarioDAO daoUsuario = new UsuarioDAO();
            daoUsuario.eliminar(id);
            response.sendRedirect("Controlador?accion=listarUsuario");
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

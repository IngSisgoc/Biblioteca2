package controlador;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import modelo.Conexion;

@WebServlet("/ActualizarRolServlet")
public class ActualizarRolServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String rol = request.getParameter("rol");

        try {
            Connection con = new Conexion().getConnection();
            String sql = "UPDATE persona SET rol = ? WHERE ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rol);
            ps.setInt(2, id);
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("gestionarPersonas.jsp");
    }
}

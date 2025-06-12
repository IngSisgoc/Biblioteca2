package controlador;

import modelo.Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/ReporteServlet")
public class ReporteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        int mes = Integer.parseInt(request.getParameter("mes"));
        int anio = Integer.parseInt(request.getParameter("anio"));

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"reporte_prestamos.csv\"");

        PrintWriter out = response.getWriter();
        out.println("ID,ID_persona,Libro,Fecha_Prestamo,Fecha_Vencimiento");

        try {
            Connection con = new Conexion().getConnection();
            String sql = "SELECT ID, ID_persona, libro, fecha_prestamo, fecha_vencimiento " +
                         "FROM prestamo WHERE MONTH(fecha_prestamo) = ? AND YEAR(fecha_prestamo) = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, mes);
            ps.setInt(2, anio);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                int idPersona = rs.getInt("ID_persona");
                String libro = rs.getString("libro");
                Date fechaPrestamo = rs.getDate("fecha_prestamo");
                Date fechaVencimiento = rs.getDate("fecha_vencimiento");

                out.printf("%d,%d,%s,%s,%s%n",
                    id, idPersona, libro,
                    fechaPrestamo.toString(), fechaVencimiento.toString()
                );
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        out.flush();
        out.close();
    }
}

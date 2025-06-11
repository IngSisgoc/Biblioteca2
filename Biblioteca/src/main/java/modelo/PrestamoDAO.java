
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PrestamoDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // Cambia esto con tu configuración real
    String url = "jdbc:mysql://localhost:3306/biblioteca";
    String user = "root";
    String pass = "";

    public List<Prestamo> listarAlertasProximas() {
        List<Prestamo> lista = new ArrayList<>();

        String sql = "SELECT p.id, per.Nombre AS usuario, p.libro, p.fecha_vencimiento " +
                     "FROM prestamo p JOIN persona per ON p.usuario_id = per.ID " +
                     "WHERE p.fecha_vencimiento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 DAY)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Prestamo p = new Prestamo(
                    rs.getInt("id"),
                    rs.getString("usuario"),
                    rs.getString("libro"),
                    rs.getDate("fecha_vencimiento")
                );
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}

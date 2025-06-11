package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private Connection con;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver actualizado
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/biblioteca2?serverTimezone=UTC", 
                "root", 
                "123456"
            );
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Mostrar el error en consola
        }
        return con;
    }
}


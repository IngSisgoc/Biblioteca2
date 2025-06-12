package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements Validar {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    
    @Override
    public int validar(Persona per) {
        int r=0;
        String sql = "Select * from persona where Nombre=? and Correo=?";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1,per.getNom());
            ps.setString(2,per.getCorreo());
            rs=ps.executeQuery();
            while (rs.next()) {
                r=r+1;
                per.setNom(rs.getString("Nombre"));
                per.setCorreo(rs.getString("Correo"));
                per.setRol(rs.getString("rol"));
            }
            if (r==1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
    }
    
    public List<Persona> listar() {
    List<Persona> lista = new ArrayList<>();
    String sql = "SELECT * FROM persona";

    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Persona p = new Persona();
            p.setId(rs.getInt("Id")); // Asegúrate de que exista la columna Id en tu tabla
            p.setNom(rs.getString("Nombre"));
            p.setCorreo(rs.getString("Correo"));
            p.setRol(rs.getString("rol"));
            lista.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return lista;
}
    

}

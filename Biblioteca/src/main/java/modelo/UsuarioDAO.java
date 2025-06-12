package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNom(rs.getString("nom"));
                u.setCorreo(rs.getString("correo"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }
        } catch (Exception e) {
            System.out.println("Error al listar usuarios: " + e.getMessage());
        }
        return lista;
    }

    public int agregar(Usuario u) {
        String sql = "INSERT INTO usuarios(nom, correo, rol) VALUES (?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNom());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getRol());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return 1;
    }

    public Usuario listarPorId(int id) {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuarios WHERE id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setNom(rs.getString("nom"));
                u.setCorreo(rs.getString("correo"));
                u.setRol(rs.getString("rol"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar usuario por ID: " + e.getMessage());
        }
        return u;
    }

    public int actualizar(Usuario u) {
        String sql = "UPDATE usuarios SET nom=?, correo=?, rol=? WHERE id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNom());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getRol());
            ps.setInt(4, u.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al actualizar usuario: " + e.getMessage());
        }
        return 1;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar usuario: " + e.getMessage());
        }
    }
}

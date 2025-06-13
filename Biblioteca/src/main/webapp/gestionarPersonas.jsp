<%@ page import="java.sql.*, modelo.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/HeaderMenu.jsp"/>
<%
    String rolSesion = (String) session.getAttribute("rol");
    if (rolSesion == null || !rolSesion.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = new Conexion().getConnection();
    String sql = "SELECT * FROM persona";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
%>
<%--
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestionar Personas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
--%>

<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-3"></div>
        <h2>Gestión de Roles de Usuarios</h2>
            <a href="Principal.jsp" class="btn btn-secondary mb-3">← Atrás</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th><th>Nombre</th><th>Correo</th><th>Rol</th><th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
            %>
                <tr>
                  
                    <form action="ActualizarRolServlet" method="post">
                    
                        <td><%= rs.getInt("ID") %></td>
                        <td><%= rs.getString("Nombre") %></td>
                        <td><%= rs.getString("Correo") %></td>
                        <td>
                            
                            <select name="rol" class="form-select">
                                <option value="persona" <%= "persona".equals(rs.getString("rol")) ? "selected" : "" %>>persona</option>
                                <option value="admin" <%= "admin".equals(rs.getString("rol")) ? "selected" : "" %>>admin</option>
                            </select>
                         
                        </td>
                        <td>
                            <input type="hidden" name="id" value="<%= rs.getInt("ID") %>"/>
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                        </td>
                      
                    </form>
                      
                </tr>
            <%
                }
                rs.close();
                ps.close();
                con.close();
            %>
            </tbody>
        </table>
    </div>
</body>
<jsp:include page="template/Footer.jsp"/>

<%--
</html>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, modelo.Persona" %>
<%@ page import="modelo.PersonaDAO" %>
<jsp:include page="template/HeaderMenu.jsp"/>

<div class="container mt-4">
    <h2>Lista de Usuarios</h2>
    <a href="Controlador?accion=addUsuario" class="btn btn-primary mb-3">Nuevo Usuario</a>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Rol</th>
                <th>Acciones</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                PersonaDAO dao = new PersonaDAO();
                List<Persona> lista = dao.listar(); 
                for (Persona p : lista) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNom() %></td>
                <td><%= p.getCorreo() %></td>
                <td><%= p.getRol()%></td>
                <%--  --%>
                <td>
                    <a href="gestionarPersonas.jsp" class="btn btn-warning btn-sm">Editar</a>
                    <a href="Controlador?accion=eliminarUsuario&id=<%= p.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Deseas eliminar este usuario?')">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<jsp:include page="template/Footer.jsp"/>

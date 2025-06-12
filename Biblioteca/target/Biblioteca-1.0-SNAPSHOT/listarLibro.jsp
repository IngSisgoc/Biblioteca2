<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="template/HeaderMenu.jsp"/>
<div class="container mt-5">
    <h1 class="text-center">Listado de Libros</h1>
    <a href="formLibro.jsp" class="btn btn-primary mb-3">Agregar Nuevo Libro</a>
    <table class="table table-dark table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>ISBN</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Editorial</th>
                <th>Año</th>
                <th>Categoría</th>
                <th>Cantidad</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                LibroDAO dao = new LibroDAO();
                List<Libro> lista = dao.listar();
                for (Libro l : lista) {
            %>
            <tr>
                <td><%= l.getId()%></td>
                <td><%= l.getIsbn()%></td>
                <td><%= l.getTitulo()%></td>
                <td><%= l.getAutor()%></td>
                <td><%= l.getEditorial()%></td>
                <td><%= l.getAnioPublicacion()%></td>
                <td><%= l.getCategoria()%></td>
                <td><%= l.getCantidad()%></td>
                <td>
                    <a href="ControladorLibro?accion=Editar&id_libro=${l.id}" class="btn btn-warning btn-sm">Editar</a>
                    <a href="ControladorLibro?accion=eliminar&id=${l.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Deseas eliminar este libro?')">Eliminar</a>
                </td>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>
<jsp:include page="template/Footer.jsp"/>
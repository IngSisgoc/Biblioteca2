<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Persona" %>
<jsp:include page="template/HeaderMenu.jsp"/>

<div class="container mt-4">
    <h2>${titulo != null ? titulo : "Nuevo Usuario"}</h2>
    <form action="Controlador" method="post">
        <input type="hidden" name="accion" value="${accion != null ? accion : 'guardarUsuario'}">
        <input type="hidden" name="id" value="${usuario != null ? usuario.id : ''}">
        <div class="mb-3">
            <label for="txtNom" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="txtNom" name="txtNom" value="${usuario != null ? usuario.nom : ''}" required>
        </div>
        <div class="mb-3">
            <label for="txtCorreo" class="form-label">Correo</label>
            <input type="email" class="form-control" id="txtCorreo" name="txtCorreo" value="${usuario != null ? usuario.correo : ''}" required>
        </div>
        <button type="submit" class="btn btn-success">Guardar</button>
        <a href="Controlador?accion=usuarios" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
<jsp:include page="template/Footer.jsp"/>

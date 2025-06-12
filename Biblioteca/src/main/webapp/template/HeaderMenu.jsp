<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%-- Este JSP solo contendrá la barra de navegación que se incluye en otros JSPs --%>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header - Biblio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark" style="color: white" >
            <a href="Principal.jsp" class="navbar-toggler text-white"><span class="navbar-toggler-icon"></span>Home</a>
            <a href="formUsuario.jsp" style="color: white">Mantenimiento</a>
            <!-- Menú desplegable de Vistas -->
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white" href="#" id="vistasDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Vistas
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listarUsuarios.jsp">Listar Usuarios</a></li>
                    <li><a class="dropdown-item" href="listarLibro.jsp">Listar Libros</a></li>
                </ul>
            </div>
            <%-- Reemplazamos el texto "Alertas" por un ícono de campana con badge --%>
            <a href="alertas.jsp" class="btn btn-dark position-relative">
                <i class="bi bi-bell-fill text-white fs-4"></i> <%-- Ícono de campana de Bootstrap Icons --%>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    3 <%-- Aquí se agregara dinámicamente el número de alertas --%>
                    <span class="visually-hidden">unread messages</span>
                </span>
            </a>

            <%-- 
                    <a class="text-white" href="alertas.jsp">Alertas</a> 
            --%>
            <div>
                <a href="#" class="nav-link dropdown-toggle text-white" data-bs-toggle="dropdown">Cerrar sesion</a>
                <div class="dropdown-menu dropdown-menu-end text-center">
                    <a><img src="img/UsuarioAdministrador.png" height="80" width="80"/></a><br>
                    <a>${nom}</a><br>
                    <a>${correo}</a>
                    <div class="dropdown-divider"></div>
                    <a href="Controlador?accion=Salir" class="dropdown-item">Salir</a>
                </div>
            </div>
        </nav>
    </body>
</html>

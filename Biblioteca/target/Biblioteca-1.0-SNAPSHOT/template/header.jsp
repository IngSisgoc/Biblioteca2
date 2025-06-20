<%-- 
    Document   : header
    Created on : 2 jun. 2025, 6:55:02 p. m.
    Author     : ssistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header - Biblio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a href="Principal.jsp" class="navbar-toggler text-white"><span class="navbar-toggler-icon"></span>Home</a>
            <a class="text-white" href="alertas.jsp">Alertas</a>
            <div>
                
            </div>
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
        <div class="container mt-4 bg-white">
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>

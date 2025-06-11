<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${param.pageTitle != null ? param.pageTitle : "Mi Aplicación Web"}</title> <%-- Permite un título dinámico --%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

    <%-- Puedes poner aquí scripts que deban cargarse temprano (raro, pero posible) --%>

</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <a href="Principal.jsp" class="navbar-toggler text-white"><span class="navbar-toggler-icon"></span>Home</a>
        <a class="text-white" href="alertas.jsp">Alertas</a>
        <div>
            <%-- Espacio para elementos adicionales si los necesitas --%>
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
    <%-- El resto del body se define en los JSPs individuales --%>

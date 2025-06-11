<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Página Principal</title>
    </head>
    <body>
        <%-- Incluimos el header si lo tienes en un archivo separado --%>
        <%@ include file="HeaderOk.jsp" %> 

        <div class="container mt-4 bg-white">
            <h1>Bienvenido al sistema...<strong>${nom}</strong> </h1>
            <%-- Aquí va el contenido principal de tu página --%>
            <p>Contenido principal de la página...</p>
            <p>Este es un ejemplo de texto para que el footer no se pegue al navbar.</p>
            <p>Asegúrate de que tu contenido tenga suficiente altura para que el footer no se superponga.</p>
            <p>Puedes usar CSS para asegurar que el footer siempre esté en la parte inferior de la ventana, independientemente del contenido.</p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        
        <%-- ¡Incluimos el pie de página aquí, justo antes del cierre del body! --%>
        <%@ include file="Footer.jsp" %>
    </body>
</html>
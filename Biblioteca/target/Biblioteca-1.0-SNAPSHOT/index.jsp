<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
<div class="container col-lg-3">
            <form action="Controlador">
                <div class="form-group mt-1 text-center">
                    <img src="img/usuario.png" height="80" width="80"/>
                    <p><strong>Bienvenidos a la biblioteca digital</strong></p>
                </div>
                <div class="form-group mt-1">
                    <label>Nombres:</label>
                    <input class="form-control mt-1" type="text" name="txtNom" placeholder="Ingrese Nombres">
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input class="form-control mt-1" type="email" name="txtCorreo" placeholder="example@gmail.com">
                </div>
                <input class="btn btn-danger w-100 mt-2" type="submit" name="accion" value="Ingresar">
            </form>           
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>
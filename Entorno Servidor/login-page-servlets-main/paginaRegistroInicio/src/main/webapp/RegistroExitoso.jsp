<%-- 
    Document   : RegistroExitoso
    Created on : 10 oct 2023, 9:13:01
    Author     : dawmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bienvenido</title>
        <!-- Bootstrap 4 CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h1>Registro Exitoso</h1>
        <p>Gracias por registrarte. A continuación, se muestra la información que has proporcionado:</p>

        <ul>
            <li><strong>Nombre:</strong> <%= session.getAttribute("nombre") %></li>
            <li><strong>Apellidos:</strong> <%= session.getAttribute("apellidos") %></li>
            <li><strong>Correo:</strong> <%= session.getAttribute("correo") %></li>
            <li><strong>Contraseña:</strong> <%= session.getAttribute("contraseña") %></li>
            <li><strong>Contraseña Confirmacion:</strong> <%= session.getAttribute("confirmarContraseña") %></li>
        </ul>

        <p><a href="Index.jsp">Ir a la página de inicio</a></p>
        <p><a href="Login.jsp">Iniciar Sesión</a></p>

    </body>
</html>

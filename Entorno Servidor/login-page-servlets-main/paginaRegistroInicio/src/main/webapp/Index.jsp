<%-- 
    Document   : Index
    Created on : 10 oct 2023, 9:11:33
    Author     : dawmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido</title>
    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
</head>
<body class="dark-mode">
    <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="card">
            <div class="card-header text-center">
                <h3>Bienvenido</h3>
            </div>
            <div class="card-body">
                <p>¡Gracias por visitar nuestra página! ¿Qué deseas hacer?</p>
                <div class="text-center">
                    <a href="Registro.jsp" class="btn btn-primary mx-2">Registrarse</a>
                    <a href="Login.jsp" class="btn btn-success mx-2">Iniciar Sesión</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
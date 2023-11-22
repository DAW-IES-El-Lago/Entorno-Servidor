<%-- 
    Document   : LoginExitoso
    Created on : 10 oct 2023, 9:12:40
    Author     : dawmi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Exitoso</title>
        <!-- Bootstrap 4 CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body class="dark-mode">
    <div class="container d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">
        <div class="text-center mb-4">
            <h1>Login Exitoso</h1>
        </div>
        <div class="text-center">
            <p>Bienvenido, <%= session.getAttribute("username") %>!</p>
        </div>
    </div>
</body>
</html>


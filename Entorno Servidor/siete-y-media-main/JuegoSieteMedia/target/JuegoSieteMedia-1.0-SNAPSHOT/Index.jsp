<%-- 
    Document   : Index
    Created on : 11 oct 2023, 8:48:59
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
    <body class="dark-mode">

        <div class="container d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">
            <h1>Hola, Bienvenido a las 7 y media</h1>
            <div class="card-body">
                <p>¿Como te llamas?</p>
                <div class="text-center">
                    <form action="LogicaJuego" method="get">
                        <input type="hidden" name="accion" value="comenzar_partida">
                        <input type="text" placeholder="Tu Nombre" name="username">
                        <button type="submit" class="btn btn-success mx-2">Jugar</button>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>

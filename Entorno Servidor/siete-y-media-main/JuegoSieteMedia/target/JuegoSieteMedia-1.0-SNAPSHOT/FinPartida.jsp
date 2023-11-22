<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="controlador.HistorialPuntuaciones" %>


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
        <div class="container d-flex flex-column justify-content-center align-items-center py-3 m-3" style="height: 100vh;">
            <div class="row">
                <div class="col-6 text-center">
                    <h1>Fin del Juego</h1>
                    <% 
                        double puntuacion = (double) session.getAttribute("valorMano");
                        String nombre = (String) session.getAttribute("username"); 
                    %>
                    <p>Bien jugado <%= nombre %> Tu puntuacion es de: <%= puntuacion %></p>
                    <form action="LogicaJuego" method="get">
                        <input type="hidden" name="accion" value="reiniciar_partida">
                        <input type="submit" value="Volver a Jugar">
                    </form>
                </div>
                <div class="col-6">

                    <% 
                        HistorialPuntuaciones historial = HistorialPuntuaciones.getInstancia();
                    %>
                    <h3>Record Puntos</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Puntuación</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                for (Map.Entry<String, Double> entry : historial.obtenerPuntuaciones().entrySet()) { 
                            %>
                            <tr>
                                <td><%= entry.getKey() %></td>
                                <td><%= entry.getValue() %></td>
                            </tr>
                            <% 
                                } 
                            %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>

</html>

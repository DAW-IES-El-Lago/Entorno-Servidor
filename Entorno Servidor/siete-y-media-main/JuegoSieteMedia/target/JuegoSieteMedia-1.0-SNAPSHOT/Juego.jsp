<%-- 
    Document   : Juego
    Created on : 11 oct 2023, 8:52:08
    Author     : dawmi
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="controlador.Carta" %>
<%@ page import="controlador.ManoJugador" %>
<%@ page import="java.util.List" %>



<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Juego de Cartas</title>
        <!-- Bootstrap 4 CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
    </head>

    <body class="dark-mode">
        <div class="container d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">

            <h1>Pagina de Juego</h1>

            <h2>Última carta obtenida:</h2>

            <div>
                <%
                    Carta ultimaCarta = (Carta) session.getAttribute("ultimaCarta");
                    if (ultimaCarta != null) {
                %>
                <p><strong>Carta </strong><%= ultimaCarta.toString() %></p>
                <%
                    } else {
                %>
                <p>No se ha obtenido ninguna carta</p>
                <%
                    }
                %>

                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Carta</th>
                                <th scope="col">Palo</th>
                                <th scope="col">Valor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                ManoJugador manoJugador = (ManoJugador) session.getAttribute("manoJugador");
                                if (manoJugador != null) {
                                    List<Carta> cartas = manoJugador.getCartas();
                                    for (Carta carta : cartas) {
                            %>
                            <tr>
                                <td><%= carta.toString() %></td>
                                <td><%= carta.getPalo() %></td>
                                <td><%= carta.getValor() %></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>

            </div>

            <form action="LogicaJuego" method="get">
                <input type="hidden" name="accion" value="pedir_carta">
                <input type="submit" value="Pedir Carta">
            </form>

            <form action="LogicaJuego" method="get">
                <input type="hidden" name="accion" value="finalizar_partida">
                <input type="submit" value="Finalizar Partida">
            </form>

        </div>
    </body>


</html>

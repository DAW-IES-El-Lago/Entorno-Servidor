/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author dawmi
 */
public class LogicaJuego extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //esta rama del post no seria necesario pero lo hacemos asi para que los datos del nombre en el formulario inicial pasen por el controlador
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreJugador = request.getParameter("username");
        HttpSession session = request.getSession();
        session.setAttribute("username", nombreJugador);

        if (nombreJugador == null) {
            nombreJugador = "Agaryo";
            session.setAttribute("username", nombreJugador);
        }

        String accion = request.getParameter("accion");
        if (accion.equals("comenzar_partida")) {
            response.sendRedirect("Juego.jsp");
        }
        response.sendRedirect("Error.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HistorialPuntuaciones historial = HistorialPuntuaciones.getInstancia();

        // Verifica si la baraja ya está en la sesión
        BarajaCartas baraja = (BarajaCartas) session.getAttribute("baraja");
        if (baraja == null) {
            baraja = new BarajaCartas();
            session.setAttribute("baraja", baraja);
        }

        // Verifica si la mano del jugador ya está en la sesión
        ManoJugador manoJugador = (ManoJugador) session.getAttribute("manoJugador");
        if (manoJugador == null) {
            manoJugador = new ManoJugador();
            session.setAttribute("manoJugador", manoJugador);
        }

        //Logica del juego
        String accion = request.getParameter("accion");
        crearBaraja(baraja);
        baraja.mezclarBaraja();

        if (accion != null) {
            if (accion.equals("pedir_carta")) {

                darCartaJugador(baraja, manoJugador);

                Carta ultimaCarta = manoJugador.obtenerUltimaCarta();
                mostrarCarta(ultimaCarta);

                // Guardar el estado de la mano del jugador y de la baraja en la sesión
                session.setAttribute("manoJugador", manoJugador);
                session.setAttribute("baraja", baraja);

                // Actualizar la UI con la carta nueva
                session.setAttribute("ultimaCarta", ultimaCarta);

                session.setAttribute("palo", ultimaCarta.getPalo());
                session.setAttribute("valor", ultimaCarta.getValor());

                // Guardar el valor de la mano en la sesion
                session.setAttribute("valorMano", manoJugador.calcularValorTotal());

            } else if (accion.equals("finalizar_partida")) {
                // Finalizar la partida: reiniciar la baraja y la mano del jugador
                baraja.reiniciarBaraja();
                manoJugador.reiniciarMano();
                //agregamos al historial de puntuaciones tambien
                historial.agregarPuntuacion((String) session.getAttribute("username"), manoJugador.calcularValorTotal());
                //Guardamos el historial de puntos en la session pero realmente no es necesario al ser una clase compartida
                session.setAttribute("historialJuego", historial.obtenerPuntuaciones());
                // Redirigir a otra página diferente
                response.sendRedirect("FinPartida.jsp");
                return; // Asegura que la respuesta se envíe y no se ejecute más código después de la redirección
            }
        }
        // Redirige de nuevo a la página de juego
        request.getRequestDispatcher("Juego.jsp").forward(request, response);

    }

    private void darCartaJugador(BarajaCartas baraja, ManoJugador manoJugador) {
        // Obtener la primera carta de la baraja
        Carta carta = baraja.obtenerPrimeraCarta();

        // Agregar la carta a la mano del jugador
        manoJugador.agregarCarta(carta);
    }

    private void mostrarCarta(Carta carta) {
        // Muestra la carta en la consola del servidor
        System.out.println("Carta: " + carta.toString());
    }

    private BarajaCartas crearBaraja(BarajaCartas baraja) {
        for (Carta.Palo palo : Carta.Palo.values()) {
            for (int i = 1; i <= 13; i++) {
                Carta carta = new Carta(palo, i);
                baraja.agregarCarta(carta);
            }
        }
        return baraja;
    }
}

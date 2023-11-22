/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author megab
 */
import java.util.HashMap;
import java.util.Map;

public class HistorialPuntuaciones {
    private static HistorialPuntuaciones instanciaUnica = null;
    private Map<String, Double> puntuaciones;

    //el constructor es privado para evitar mas instancias de esta clase (singleton)
    private HistorialPuntuaciones() {
        puntuaciones = new HashMap<>();
    }

    public static HistorialPuntuaciones getInstancia() {
        if (instanciaUnica == null) {
            instanciaUnica = new HistorialPuntuaciones();
        }
        return instanciaUnica;
    }

    public void agregarPuntuacion(String nombreUsuario, double puntuacionFinal) {
        puntuaciones.put(nombreUsuario, puntuacionFinal);
    }

    public Map<String, Double> obtenerPuntuaciones() {
        return puntuaciones;
    }
    
    
}

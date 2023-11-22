/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author dawmi
 */
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BarajaCartas {

    private List<Carta> ListaCartas;

    public BarajaCartas() {
        ListaCartas = new ArrayList<Carta>();
    }

    public List<Carta> getCartas() {
        return ListaCartas;
    }

    public void setCartas(List<Carta> cartas) {
        this.ListaCartas = cartas;
    }

    public void agregarCarta(Carta carta) {
        ListaCartas.add(carta);
    }

    public void quitarCarta(Carta carta) {
        ListaCartas.remove(carta);
    }

    public void reiniciarBaraja() {
        ListaCartas.clear();
    }

    public int getNumeroDeCartas() {
        return ListaCartas.size();
    }

    public void mezclarBaraja() {
        Collections.shuffle(ListaCartas);
    }

    public Carta obtenerPrimeraCarta() {
        if (ListaCartas != null && !ListaCartas.isEmpty()) {
            Carta primeraCarta = ListaCartas.get(0);
            ListaCartas.remove(0); // Elimina la primera carta de la lista
            return primeraCarta;
        } else {
            // Si la lista está vacía, puedes lanzar una excepción o manejar el caso de alguna otra manera
            throw new IllegalStateException("La baraja está vacía.");
        }

    }


    @Override
    public String toString() {
        return "Baraja de Cartas con " + ListaCartas.size() + " cartas";
    }
}

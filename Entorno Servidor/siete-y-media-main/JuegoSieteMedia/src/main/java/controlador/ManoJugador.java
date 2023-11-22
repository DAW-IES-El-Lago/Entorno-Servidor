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
import java.util.List;

public class ManoJugador {
    private List<Carta> cartas;
    private double valorTotal;

    public ManoJugador() {
        cartas = new ArrayList<Carta>();
        valorTotal = 0;
    }

    public void agregarCarta(Carta carta) {
        cartas.add(carta);
        valorTotal = calcularValorTotal();
    }

    public List<Carta> getCartas() {
        return cartas;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void reiniciarMano() {
        cartas.clear();
        valorTotal = 0;
    }

    public double calcularValorTotal() {
        int total = 0;

        for (Carta carta : cartas) {
            double valor = carta.getValor();
            if (valor >= 10) {
                total += 0.5;
            } else if (valor == 1) {
                total += 1;
            } else {
                total += valor;
            }
        }
        
        return total;
    }
    
    public Carta obtenerPrimeraCarta() {
        if (!cartas.isEmpty()) {
            return cartas.get(0);
        } else {
            return null; // o maneja el caso de una lista vacía de acuerdo a la lógica de tu aplicación
        }
    }

    public Carta obtenerUltimaCarta() {
        if (!cartas.isEmpty()) {
            return cartas.get(cartas.size() - 1);
        } else {
            return null; // o maneja el caso de una lista vacía de acuerdo a la lógica de tu aplicación
        }
    }
}

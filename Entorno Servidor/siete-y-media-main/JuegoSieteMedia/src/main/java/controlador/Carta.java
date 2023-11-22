/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author dawmi
 */
public class Carta {

    public enum Palo {
        ESPADAS, CORAZONES, DIAMANTES, TREBOLES
    }

    private Palo palo;
    private int valor;

    public Carta(Palo palo, int valor) {
        this.palo = palo;
        this.valor = valor;
    }

    public Palo getPalo() {
        return palo;
    }

    public void setPalo(Palo palo) {
        this.palo = palo;
    }

     public double getValor() {
        if (valor >= 1 && valor <= 10) {
            return valor;
        } else if (valor >= 11 && valor <= 13) {
            return 0.5;
        } else {
            return 0;
        }
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        String valorCarta;
        switch (valor) {
            case 1:
                valorCarta = "As";
                break;
            case 11:
                valorCarta = "Jota";
                break;
            case 12:
                valorCarta = "Reina";
                break;
            case 13:
                valorCarta = "Rey";
                break;
            default:
                valorCarta = String.valueOf(valor);
        }
        return valorCarta + " de " + palo;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controladores;

/**
 *
 * @author dawmi
 */
import java.util.HashMap;

public class UsuarioMapSingleton {
    private static UsuarioMapSingleton instance;
    private HashMap<String, String> usuarioMap;

    private UsuarioMapSingleton() {
        usuarioMap = new HashMap<>();
                // Agrega usuarios y contraseñas manualmente
        usuarioMap.put("carlos", "contraseña");
        usuarioMap.put("gary", "gary123");
        usuarioMap.put("admin", "root");
    }

    //Sy
    public static synchronized UsuarioMapSingleton getInstance() {
        if (instance == null) {
            instance = new UsuarioMapSingleton();
        }
        return instance;
    }

    public HashMap<String, String> getUsuarioMap() {
        return usuarioMap;
    }
}

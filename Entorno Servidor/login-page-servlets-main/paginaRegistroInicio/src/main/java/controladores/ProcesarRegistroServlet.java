/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;

/**
 *
 * @author megab
 */
@WebServlet("/ProcesarRegistroServlet")
public class ProcesarRegistroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibe los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");

        // Verifica si la contraseña y la confirmación de contraseña coinciden
        if (!password.equals(passwordConfirm)) {
            // Redirige al usuario a una página de error (contraseña no coincide)
            response.sendRedirect("ErrorRegistro.jsp");
            return; // Sale del método para evitar la ejecución posterior
        }

        // Asegúrate de que el HashMap de usuarios esté disponible
        UsuarioMapSingleton usuarioMapSingleton = UsuarioMapSingleton.getInstance();
        HashMap<String, String> usuarioMap = usuarioMapSingleton.getUsuarioMap();

        // Verifica si el correo (o nombre de usuario) ya existe en el HashMap
        if (usuarioMap.containsKey(nombre)) {
            // Redirige al usuario a una página de error (usuario duplicado)
            response.sendRedirect("ErrorRegistro.jsp");
            return; // Sale del método para evitar la ejecución posterior
        }

        // Si no hay duplicados, agrega el nuevo usuario al HashMap
        usuarioMap.put(nombre, password);

        // Almacena los datos del usuario en la sesión
        HttpSession session = request.getSession();
        session.setAttribute("nombre", nombre);
        session.setAttribute("apellidos", apellidos);
        session.setAttribute("correo", correo);
        session.setAttribute("contraseña", password);
        session.setAttribute("confirmarContraseña", passwordConfirm);

        // Redirige al usuario a la página de registro exitoso
        response.sendRedirect("RegistroExitoso.jsp");
    }
}

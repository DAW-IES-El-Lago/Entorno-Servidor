/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

/**
 *
 * @author megab
 */
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ProcesarLoginServlet")
public class ProcesarLoginServlet extends HttpServlet {

    private UsuarioMapSingleton usuarioMapSingleton = UsuarioMapSingleton.getInstance();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Verifica si las credenciales son válidas en el HashMap
        if (usuarioMapSingleton.getUsuarioMap().containsKey(username)) {
            String storedPassword = usuarioMapSingleton.getUsuarioMap().get(username);
            String providedPassword = request.getParameter("password"); // Obtén la contraseña proporcionada por el usuario

            if (storedPassword.equals(providedPassword)) {
                // Autenticación exitosa
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("LoginExitoso.jsp");
            } else {
                // Autenticación fallida
                String errorMessage = "Nombre de usuario o contraseña incorrectos.";
                request.setAttribute("error", errorMessage);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
    }
}
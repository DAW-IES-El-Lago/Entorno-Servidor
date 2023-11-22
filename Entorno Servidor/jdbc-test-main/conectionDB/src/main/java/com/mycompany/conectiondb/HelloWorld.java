package com.mycompany.conectiondb;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet(name = "HelloWorld", urlPatterns = {"/helloworld"})
public class HelloWorld extends HttpServlet {

    DBConnection db = null;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.db = new DBConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException("Error al inicializar la conexión a la base de datos", ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String deporte = request.getParameter("deporte");

        if (null == action) {
            // Acción predeterminada o no válida
            response.getWriter().write("Acción no válida.");
        } else switch (action) {
            case "insertar":
                if (deporte != null && !deporte.isBlank()) {
                    int result = db.insertSport(deporte);
                    if (result > 0) {
                        response.getWriter().write("Deporte insertado correctamente.");
                    } else {
                        response.getWriter().write("Error al insertar el deporte.");
                    }
                } else {
                    response.getWriter().write("Nombre del deporte no válido.");
                }   break;
            case "borrar":
                if (deporte != null && !deporte.isBlank()) {
                    int result = db.deleteSport(deporte);
                    if (result > 0) {
                        response.getWriter().write("Deporte borrado correctamente.");
                    } else {
                        response.getWriter().write("Error al borrar el deporte.");
                    }
                } else {
                    response.getWriter().write("Nombre del deporte no válido.");
                }   break;
            default:
                // Acción predeterminada o no válida
                response.getWriter().write("Acción no válida.");
                break;
        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HelloWorld de las once</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action=\"helloworld\">\n"
                    + "            Deporte:<input type=\"text\" name=\"deporte\">\n"
                    + "            <input type=\"submit\" value=\"Insertar\">\n"
                    + "        </form>");
            out.println("<form action=\"helloworld\">\n"
                    + "            Deporte a borrar:<input type=\"text\" name=\"deporte\">\n"
                    + "            <input type=\"hidden\" name=\"action\" value=\"borrar\">\n"
                    + "            <input type=\"submit\" value=\"Borrar\">\n"
                    + "        </form>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

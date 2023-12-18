/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.melakugb.deportesapp;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Juanjo
 */
@WebServlet(name = "HelloWorld", urlPatterns = {"/helloworld"})
public class HelloWorld extends HttpServlet {

    DBConnection db = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        String run = request.getParameter("run");
        String deporte = request.getParameter("deporte");
        String aficionado = request.getParameter("aficionado");
        String task = request.getParameter("task");
        String newDeporte = request.getParameter("deporteNuevo");
        String oldDeporte = request.getParameter("deporteViejo");
        String nombre_tabla = request.getParameter("nombre_tabla");
        String deleteWordParameter = request.getParameter("delete_word");
        

        if (run == null) {  // not first run

            switch (task) {
                case "insert":
                    if (deporte != null && !deporte.isBlank()) {
                        db.insertSport(deporte);
                    } else {
                        // Manejo del caso en que 'deporte' es nulo o en blanco
                        throw new IllegalArgumentException("No se puede insertar un valor nulo o en blanco.");
                    }
                    response.sendRedirect("form.jsp");
                    break;

                case "delete":
                    if (deporte != null && !deporte.isBlank()) {
                        db.deleteSport(deporte);
                    } else {
                        // Manejo del caso en que 'deporte' es nulo o en blanco
                        throw new IllegalArgumentException("No se puede eliminar un valor nulo o en blanco.");
                    }
                    response.sendRedirect("form.jsp");
                    break;

                case "update":

                    if (deporte != null && !deporte.isBlank() && newDeporte != null && !newDeporte.isBlank()) {
                        // Assuming 'deporte' is the old name and 'newDeporte' is the new name
                        int rowsAffected = db.updateSport(oldDeporte, newDeporte);

                        if (rowsAffected > 0) {
                            // The update was successful
                            System.out.println("Sport updated successfully!");
                        } else {
                            // The update failed or no matching records were found
                            System.out.println("Failed to update sport or no matching records found.");
                        }
                    } else {
                        // Handling the case where 'deporte' or 'newDeporte' is null or blank
                        throw new IllegalArgumentException("No se puede actualizar con valores nulos o en blanco.");
                    }
                    response.sendRedirect("form.jsp");
                    break;
                case "list":
                    ArrayList<Deporte> listSports = null;
                    //obtenemos de la base de datos la lista de deportes:
                    listSports = db.listSports();
                    //para poder escribir en HTML la lista hay que hacerla
                    //llegar a la página JSP.
                    //Para ello, hay que guardarla en el objeto Session
                    //y recuperarla de este objeto en la página JSP:

                    ses.setAttribute("listSports", listSports);
                    response.sendRedirect("listAndForm.jsp");
//                    listSportsAndShowForm(listSports, response);
                    break;
                case "numero_registros":
                    int total = db.totalRegistros(nombre_tabla);
                    ses.setAttribute("total_registros", total);

                case "buscar_patron":
                    if (deporte.isBlank()) {
                    } else {
                        ArrayList<Deporte> listSports1 = null;
                        listSports1 = db.listLike(deporte);
                        HttpSession s1 = request.getSession();
                        s1.setAttribute("listSports", listSports1);
                        response.sendRedirect("listAndForm.jsp");
                    }
                    break;

                case "insert_aficionado":
                    if (aficionado != null && !aficionado.isBlank()) {
                        db.insertAficionado(aficionado);
                    } else {
                        // Manejo del caso en que 'deporte' es nulo o en blanco
                        throw new IllegalArgumentException("No se puede insertar un valor nulo o en blanco.");
                    }
                    response.sendRedirect("form.jsp");
                    break;

                case "delete_on_cascade":
                    int deleteWord = Integer.parseInt(deleteWordParameter);
                    if (deleteWord >= 0) {
                        db.deleteOnCascade(deleteWord);
                    } else {
                        // Manejo del caso en que 'deporte' es nulo o en blanco
                        throw new IllegalArgumentException("No se puede borrar un valor nulo o en blanco.");
                    }
                    response.sendRedirect("form.jsp");
                    break;
                default:
                    break;
            }
        } else if (run.equalsIgnoreCase("start")) { // first run from this client
            this.db = new DBConnection();
            response.sendRedirect("form.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

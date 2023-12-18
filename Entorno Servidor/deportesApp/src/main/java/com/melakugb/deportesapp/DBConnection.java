/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.melakugb.deportesapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Juanjo
 */
public class DBConnection {

    private Connection c;

    public DBConnection() {

        try {   // cargar el driver de conexión con la base de datos adecuada
            // y obtener la conexión a través de la IP, nombre de base de datos,
            // usuario y contraseña
            Class.forName("org.mariadb.jdbc.Driver");
            this.c = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3307/deportes",
                    "root", ""
            );
        } catch (SQLException | ClassNotFoundException ex) {
            this.c = null;
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("conn: " + c);  // para la verificación en consola
    }

    public int insertSport(String deporte) {
        String sqlSentence = "insert into deporte (nombre) values ('" + deporte + "');";
        System.out.println("Sentence: " + sqlSentence);  // verificación en consola
        Statement st;
        int n = -1;
        try {
            st = this.c.createStatement();
            n = st.executeUpdate(sqlSentence);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteSport(String deporte) {
        String sqlSentence = "delete from deporte where nombre like '" + deporte + "';";
        System.out.println("Sentence: " + sqlSentence);  // verificación en consola
        Statement st;
        int n = -1;
        try {
            st = this.c.createStatement();
            n = st.executeUpdate(sqlSentence);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    ArrayList<Deporte> listSports() {
        ArrayList<Deporte> lista = new ArrayList<>();
        try {
            Statement s = this.c.createStatement();
            String sql = "select * from deporte";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                Deporte d = new Deporte(rs.getString(2));
                lista.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public int updateSport(String oldName, String newName) {
        String sqlSentence = "update deporte set nombre = '" + newName + "' where nombre like '" + oldName + "';";
        System.out.println("Sentence: " + sqlSentence);  // verification in the console
        Statement st;
        int n = -1;
        try {
            st = this.c.createStatement();
            n = st.executeUpdate(sqlSentence);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Deporte> listLike(String searchString) {
        ArrayList<Deporte> lista = new ArrayList<>();
        try {
            Statement s = this.c.createStatement();
            String sql = "select * from deporte where nombre like '%" + searchString + "%';";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                Deporte d = new Deporte(rs.getString(2));
                lista.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public int insertAficionado(String aficionado) {
        int idNombre = 8; //siempre insertamos en el mismo deporte
        int idAficionado = 0; //el valor del id del deporte es autoincremental ponemos 0 siempre
        String sqlSentence = "INSERT INTO deporte_aficionado (idAficionado, idNombre, aficionado) VALUES ('" + idAficionado + "', '" + idNombre + "', '" + aficionado + "');";

        System.out.println("Sentence: " + sqlSentence);  // verificación en consola
        Statement st;
        int n = -1;
        try {
            st = this.c.createStatement();
            n = st.executeUpdate(sqlSentence);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int totalRegistros(String nombre_tabla) {
        int total = 0;

        String sqlSentence = "SELECT COUNT(*) FROM " + nombre_tabla;
        System.out.println("Sentence: " + sqlSentence);  // verificación en consola
        try {
            Statement st = this.c.createStatement();
            ResultSet resultSet = st.executeQuery(sqlSentence);

            if (resultSet.next()) {
                total = resultSet.getInt(1);
            }

            this.c.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return total;
    }

    //borramos todos los registros de todas las tablas con esta clave primaria o foranea asociada
    public int deleteOnCascade(int id_deporte) {
        int n = -1;

        // Borrar registros de la tabla deporte_aficionado asociados al id_deporte
        String deleteAficionadoQuery = "DELETE FROM deporte_aficionado WHERE idNombre = ?";
        try (PreparedStatement preparedStatement = this.c.prepareStatement(deleteAficionadoQuery)) {
            preparedStatement.setInt(1, id_deporte);
            n = preparedStatement.executeUpdate();
            System.out.println("Borrados " + n + " registros de deporte_aficionado asociados al id_deporte: " + id_deporte);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Borrar registros de la tabla deporte asociados al id_deporte
        String deleteDeporteQuery = "DELETE FROM deporte WHERE idNombre = ?";
        try (PreparedStatement preparedStatement = this.c.prepareStatement(deleteDeporteQuery)) {
            preparedStatement.setInt(1, id_deporte);
            n = preparedStatement.executeUpdate();
            System.out.println("Borrados " + n + " registros de deporte asociados al id_deporte: " + id_deporte);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

}

package com.mycompany.conectiondb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;


public class DBConnection {

    private Connection c;

    public DBConnection() throws SQLException, ClassNotFoundException {
        System.out.println("Constructor de DBConnection llamado.");
        try {
            // Cargar el controlador JDBC
            Class.forName("org.mariadb.jdbc.Driver");

            // Establecer la conexión
            this.c = DriverManager.getConnection(
                    "jdbc:mariadb://192.168.1.37:3306/deportes",
                    "root",
                    ""
            );
        } catch (SQLException | ClassNotFoundException ex) {
            this.c = null;
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            throw ex; // Relanzar la excepción ClassNotFoundException
        }
        System.out.println("Valor de this.c antes de llamar a insertSport: " + this.c);
    }

    public int insertSport(String s) {
        String sqlSentence = "insert into deporte values ('" + s + "');";
        System.out.println("Sentence: " + sqlSentence);
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

    public int deleteSport(String s) {
        String sqlSentence = "DELETE FROM deporte WHERE nombre = ?";
        int n = -1;

        try (PreparedStatement ps = this.c.prepareStatement(sqlSentence)) {
            ps.setString(1, s);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}

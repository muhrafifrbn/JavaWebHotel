/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package koneksi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class Koneksi {
      private static final String URL = "jdbc:mysql://localhost:3306/hotel_jwp";
    private static final String USER = "root";
  
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Koneksi Berhasil");
            return conn;
            } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Koneksi Gaagal Karena" + e.getMessage());
            return null;
        }
    }
}

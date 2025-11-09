/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package crud;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import koneksi.Koneksi;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "Tampil", urlPatterns = {"/Tampil"})
public class Tampil extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Tampil</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Tampil at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
          List<Pemesanan> listPemesanan = new ArrayList<>();
            String search = request.getParameter("search"); 

        try (Connection conn = Koneksi.getConnection()) {
            String sql = "SELECT * FROM pemesanan_hotel";

            if (search != null && !search.trim().isEmpty()) {
                sql += " WHERE LOWER(nama_lengkap) LIKE ? OR LOWER(email) LIKE ? OR LOWER(nomor_telepon) LIKE ?";
            }

            sql += " ORDER BY tanggal_pemesanan DESC";

            PreparedStatement ps = conn.prepareStatement(sql);

            if (search != null && !search.trim().isEmpty()) {
                String keyword = "%" + search.toLowerCase() + "%";
                ps.setString(1, keyword);
                ps.setString(2, keyword);
                ps.setString(3, keyword);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Pemesanan p = new Pemesanan();
                p.setId(rs.getInt("id_pemesanan"));
                p.setNamaLengkap(rs.getString("nama_lengkap"));
                p.setTanggalCheckin(rs.getString("tanggal_checkin"));
                p.setTanggalCheckout(rs.getString("tanggal_checkout"));
                p.setJenisKamar(rs.getString("jenis_kamar"));
                p.setJumlahTamu(rs.getInt("jumlah_tamu"));
                p.setFasilitas(rs.getString("fasilitas"));
                p.setMetodePembayaran(rs.getString("metode_pembayaran"));
                p.setEmail(rs.getString("email"));
                p.setNomorTelepon(rs.getString("nomor_telepon"));
                listPemesanan.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // kirim data ke JSP
        request.setAttribute("dataPemesanan", listPemesanan);
        request.getRequestDispatcher("tampil.jsp").forward(request, response);
    

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

/*
 * File: Hapus.java
 * Dibuat untuk menangani penghapusan data pemesanan
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
import koneksi.Koneksi; // Menggunakan koneksi yang sama

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "Hapus", urlPatterns = {"/Hapus"})
public class Hapus extends HttpServlet {

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
        // Meneruskan request GET ke doPost agar bisa ditangani
        // Ini memungkinkan kita memanggil servlet ini dari link <a> (GET)
        doPost(request, response);
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
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); // Untuk debugging jika perlu
        String idStr = request.getParameter("id");
        
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("Tampil?status=gagal_hapus_id_kosong");
            return;
        }

        int idHapus = 0;
        try {
            idHapus = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("Tampil?status=gagal_hapus_id_invalid");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Koneksi.getConnection();
            if (conn == null) {
                response.sendRedirect("Tampil?status=gagal_koneksi");
                return;
            }
            String sql = "DELETE FROM pemesanan_hotel WHERE id_pemesanan = ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, idHapus);
            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("Tampil?status=sukses_hapus");
            } else {
                response.sendRedirect("Tampil?status=gagal_hapus_id_tidak_ditemukan");
            }

        } catch (Exception e) {
            e.printStackTrace(out);
            response.sendRedirect("Tampil?status=gagal_hapus_exception");
        } finally {
            // 6. Tutup semua resource
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet untuk menghapus data pemesanan hotel";
    }// </editor-fold>

}
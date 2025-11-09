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
 * @author astse
 */
@WebServlet(name = "Edit", urlPatterns = {"/Edit"})
public class Edit extends HttpServlet {

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
            out.println("<title>Servlet Edit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Edit at " + request.getContextPath() + "</h1>");
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
        
        Pemesanan detailPesanan = null;
        int id = Integer.parseInt(request.getParameter("id"));
        
        try (Connection conn = Koneksi.getConnection()) {
            
            String sql = "SELECT * FROM pemesanan_hotel WHERE id_pemesanan=?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                detailPesanan = new Pemesanan();
                detailPesanan.setId(rs.getInt("id_pemesanan"));
                detailPesanan.setNamaLengkap(rs.getString("nama_lengkap"));
                detailPesanan.setTanggalCheckin(rs.getString("tanggal_checkin"));
                detailPesanan.setTanggalCheckout(rs.getString("tanggal_checkout"));
                detailPesanan.setJenisKamar(rs.getString("jenis_kamar"));
                detailPesanan.setJumlahTamu(rs.getInt("jumlah_tamu"));
                detailPesanan.setFasilitas(rs.getString("fasilitas"));
                detailPesanan.setMetodePembayaran(rs.getString("metode_pembayaran"));
                detailPesanan.setEmail(rs.getString("email"));
                detailPesanan.setNomorTelepon(rs.getString("nomor_telepon"));
            }
                
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("dataDetail", detailPesanan);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
        
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
        PrintWriter out = response.getWriter();
    
        String idStr = request.getParameter("id_pemesanan");
        String namaLengkap = request.getParameter("nama_lengkap");
        String tanggalCheckin = request.getParameter("tanggal_checkin");
        String tanggalCheckout = request.getParameter("tanggal_checkout");
        String jenisKamar = request.getParameter("jenis_kamar");
        String jumlahTamuStr = request.getParameter("jumlah_tamu");
        String[] fasilitasArr = request.getParameterValues("fasilitas[]");
        String fasilitas = (fasilitasArr != null) ? String.join(", ", fasilitasArr) : "";
        String metodePembayaran = request.getParameter("metode_pembayaran");
        String email = request.getParameter("email");
        String nomorTelepon = request.getParameter("nomor_telepon");
        
        
        
         Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Koneksi.getConnection();
            if (conn == null) {
                out.println("<h3 style='color:red;'>❌ Gagal koneksi ke database!</h3>");
                return;
            }
            
            int id = Integer.parseInt(idStr);
            int jumlahTamu = Integer.parseInt(jumlahTamuStr);

            String sql = "UPDATE pemesanan_hotel SET "
                   + "nama_lengkap = ?, "
                   + "tanggal_checkin = ?, "
                   + "tanggal_checkout = ?, "
                   + "jenis_kamar = ?, "
                   + "jumlah_tamu = ?, "
                   + "fasilitas = ?, "
                   + "metode_pembayaran = ?, "
                   + "email = ?, "
                   + "nomor_telepon = ? "
                   + "WHERE id_pemesanan = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, namaLengkap);
            ps.setString(2, tanggalCheckin);
            ps.setString(3, tanggalCheckout);
            ps.setString(4, jenisKamar);
            ps.setInt(5, jumlahTamu);
            ps.setString(6, fasilitas);
            ps.setString(7, metodePembayaran);
            ps.setString(8, email);
            ps.setString(9, nomorTelepon);
            ps.setInt(10, id);

            int result = ps.executeUpdate();

            if (result > 0) {
               
                 response.sendRedirect("Tampil?status=sukses_edit");
            } else {
                 response.sendRedirect("Tampil?status=gagal");
            }

        } catch (Exception e) {
            e.printStackTrace(out);
            response.sendRedirect("Tampil.jsp?status=gagal");
        } finally {
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
        return "Short description";
    }// </editor-fold>

}

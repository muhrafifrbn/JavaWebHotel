/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud;

/**
 *
 * @author Lenovo
 */

public class Pemesanan {
    private int id;
    private String namaLengkap;
    private String tanggalCheckin;
    private String tanggalCheckout;
    private String jenisKamar;
    private int jumlahTamu;
    private String fasilitas;
    private String metodePembayaran;
    private String email;
    private String nomorTelepon;

    // Getter dan Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNamaLengkap() { return namaLengkap; }
    public void setNamaLengkap(String namaLengkap) { this.namaLengkap = namaLengkap; }

    public String getTanggalCheckin() { return tanggalCheckin; }
    public void setTanggalCheckin(String tanggalCheckin) { this.tanggalCheckin = tanggalCheckin; }

    public String getTanggalCheckout() { return tanggalCheckout; }
    public void setTanggalCheckout(String tanggalCheckout) { this.tanggalCheckout = tanggalCheckout; }

    public String getJenisKamar() { return jenisKamar; }
    public void setJenisKamar(String jenisKamar) { this.jenisKamar = jenisKamar; }

    public int getJumlahTamu() { return jumlahTamu; }
    public void setJumlahTamu(int jumlahTamu) { this.jumlahTamu = jumlahTamu; }

    public String getFasilitas() { return fasilitas; }
    public void setFasilitas(String fasilitas) { this.fasilitas = fasilitas; }

    public String getMetodePembayaran() { return metodePembayaran; }
    public void setMetodePembayaran(String metodePembayaran) { this.metodePembayaran = metodePembayaran; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getNomorTelepon() { return nomorTelepon; }
    public void setNomorTelepon(String nomorTelepon) { this.nomorTelepon = nomorTelepon; }
}
<%-- 
    Document   : tampil
    Created on : 9 Nov 2025, 11.21.05
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Pemesanan Hotel</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }
  </style>
</head>
<body class="min-h-screen flex flex-col items-center justify-center p-6">

  <div class="bg-white p-8 rounded-2xl shadow-2xl w-full max-w-[90%] fade-in">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-8 flex items-center justify-center">
      <i class="fas fa-table text-blue-500 mr-3"></i>
      Data Pemesanan Hotel
    </h2>

  
    <form action="<%= request.getContextPath() %>/Tampil" method="GET" class="flex flex-col sm:flex-row items-center justify-between gap-4 mb-6">
      <div class="relative w-full sm:w-2/3">
        <input 
          type="text" 
          name="search" 
          placeholder="Cari nama tamu atau email..." 
          class="w-full border border-gray-300 rounded-lg py-2 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
        <i class="fas fa-search absolute left-3 top-2.5 text-gray-400"></i>
      </div>
      <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-semibold transition duration-300 shadow-md">
        <i class="fas fa-search mr-2"></i>Cari
      </button>
    </form>

 
    <div class="overflow-x-auto">
      <table class="min-w-full bg-white border border-gray-300 rounded-lg text-sm">
        <thead class="bg-gradient-to-r from-blue-500 to-purple-600 text-white">
          <tr>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-user mr-2"></i>Nama Lengkap</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-calendar-check mr-2"></i>Check-in</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-calendar-times mr-2"></i>Check-out</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-bed mr-2"></i>Jenis Kamar</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-users mr-2"></i>Jumlah Tamu</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-concierge-bell mr-2"></i>Fasilitas</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-credit-card mr-2"></i>Pembayaran</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-envelope mr-2"></i>Email</th>
            <th class="py-3 px-4 text-left font-semibold"><i class="fas fa-phone mr-2"></i>Telepon</th>
            <th class="py-3 px-4 text-center font-semibold"><i class="fas fa-cogs mr-2"></i>Aksi</th>
          </tr>
        </thead>
        <tbody class="text-gray-700">
          <!-- Contoh Data -->
          <tbody class="text-gray-700">
                <%
                    java.util.List<crud.Pemesanan> dataPemesanan = 
                        (java.util.List<crud.Pemesanan>) request.getAttribute("dataPemesanan");
                    if (dataPemesanan != null && !dataPemesanan.isEmpty()) {
                        for (crud.Pemesanan p : dataPemesanan) {
                %>
                    <tr class="border-b border-gray-200 hover:bg-gray-50 transition duration-300">
                        <td class="py-3 px-4"><%= p.getNamaLengkap() %></td>
                        <td class="py-3 px-4"><%= p.getTanggalCheckin() %></td>
                        <td class="py-3 px-4"><%= p.getTanggalCheckout() %></td>
                        <td class="py-3 px-4"><%= p.getJenisKamar() %></td>
                        <td class="py-3 px-4"><%= p.getJumlahTamu() %></td>
                        <td class="py-3 px-4"><%= p.getFasilitas() %></td>
                        <td class="py-3 px-4"><%= p.getMetodePembayaran() %></td>
                        <td class="py-3 px-4"><%= p.getEmail() %></td>
                        <td class="py-3 px-4"><%= p.getNomorTelepon() %></td>
                        <td class="py-3 px-4 text-center flex ">
               
                            <a href="Edit?id=<%= p.getId() %>" class=" text-blue-600 hover:text-blue-800 font-semibold mr-3">
                                <i class="fas fa-edit mr-1"></i>Edit
                            </a>
                            <a href="Hapus?id=<%= p.getId() %>" class="link-hapus text-red-600 hover:text-red-800 font-semibold">
                                <i class="fas fa-trash-alt mr-1"></i>Hapus
                            </a>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="10" class="text-center py-4 text-gray-500">Belum ada data pemesanan.</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
        </tbody>
      </table>
    </div>

   
    <div class="mt-6 text-center">
      <a href="tambah.jsp" class="bg-gradient-to-r from-blue-500 to-purple-600 text-white py-2 px-5 rounded-lg font-semibold hover:from-blue-600 hover:to-purple-700 transform hover:scale-105 transition duration-300 shadow-lg inline-block">
        <i class="fas fa-arrow-left mr-2"></i>Kembali ke Form
      </a>
    </div>
  </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get('status');

    if (status === 'sukses_tambah') {
        Swal.fire({
            icon: 'success',
            title: 'Berhasil!',
            text: 'Data berhasil ditambahkan.',
            timer: 2000,
            showConfirmButton: false
        });
    } else if (status === 'sukses_hapus') {
        Swal.fire({
            icon: 'success',
            title: 'Berhasil Dihapus!',
            text: 'Data telah berhasil dihapus.',
            timer: 2000,
            showConfirmButton: false
        });
    }else if (status === 'sukses_edit') {
            Swal.fire({
                icon: 'success',
                title: 'Berhasil!',
                text: 'Data berhasil diedit.',
                timer: 2000,
                showConfirmButton: false
        });
          } else if (status === 'gagal') {
        Swal.fire({
            icon: 'error',
            title: 'Gagal!',
            text: 'Terjadi kesalahan saat memproses data.',
        });

    } 
        

    if (status) {
        window.history.replaceState({}, document.title, window.location.pathname);
    }
</script>
    <script>
    const linkHapus = document.querySelectorAll('.link-hapus');
    linkHapus.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            const hrefTujuan = this.href;
            Swal.fire({
                title: 'Apakah Anda yakin?',
                text: "Data yang dihapus tidak dapat dikembalikan!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, hapus!',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = hrefTujuan;
                }
            });
        });
    });
</script>
</body>
</html>



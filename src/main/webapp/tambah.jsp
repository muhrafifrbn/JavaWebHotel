<%-- 
    Document   : tambah.jsp
    Created on : 9 Nov 2025, 11.06.44
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Pemesanan Hotel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
    <div class="bg-white p-8 rounded-2xl shadow-2xl w-full max-w-2xl fade-in">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-8 flex items-center justify-center">
            <i class="fas fa-hotel text-blue-500 mr-3"></i>
            Form Pemesanan Hotel
        </h2>
        <form action="Simpan" method="post" class="space-y-6">
            <div>
                <label for="nama-lengkap"  class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                    <i class="fas fa-user text-blue-500 mr-2"></i>
                    Nama Lengkap
                </label>
                <input type="text" id="nama-lengkap" name="nama_lengkap" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="tanggal-checkin" class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <i class="fas fa-calendar-check text-blue-500 mr-2"></i>
                        Tanggal Check-in
                    </label>
                    <input type="date" id="tanggal-checkin" name="tanggal_checkin" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
                </div>
                <div>
                    <label for="tanggal-checkout" class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <i class="fas fa-calendar-times text-blue-500 mr-2"></i>
                        Tanggal Check-out
                    </label>
                    <input type="date" id="tanggal-checkout" name="tanggal_checkout" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="jenis-kamar" class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <i class="fas fa-bed text-blue-500 mr-2"></i>
                        Jenis Kamar
                    </label>
                    <select id="jenis-kamar" name="jenis_kamar" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
                        <option value="">Pilih Jenis Kamar</option>
                        <option value="single">Single</option>
                        <option value="double">Double</option>
                        <option value="suite">Suite</option>
                    </select>
                </div>
                <div>
                    <label for="jumlah-tamu" class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <i class="fas fa-users text-blue-500 mr-2"></i>
                        Jumlah Tamu
                    </label>
                    <input type="number" id="jumlah-tamu" name="jumlah_tamu" min="1" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                    <i class="fas fa-concierge-bell text-blue-500 mr-2"></i>
                    Fasilitas yang Digunakan
                </label>
                <div class="flex flex-wrap gap-4">
                    <div class="flex items-center">
                        <input type="checkbox" id="wifi" name="fasilitas[]" value="wifi" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                        <label for="wifi" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer hover:text-blue-600 transition duration-300 flex items-center">
                            <i class="fas fa-wifi text-blue-500 mr-1"></i>
                            WiFi
                        </label>
                    </div>
                    <div class="flex items-center">
                        <input type="checkbox" id="breakfast" name="fasilitas[]" value="breakfast" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                        <label for="breakfast" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer hover:text-blue-600 transition duration-300 flex items-center">
                            <i class="fas fa-coffee text-blue-500 mr-1"></i>
                            Sarapan
                        </label>
                    </div>
                    <div class="flex items-center">
                        <input type="checkbox" id="pool" name="fasilitas[]" value="pool" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                        <label for="pool" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer hover:text-blue-600 transition duration-300 flex items-center">
                            <i class="fas fa-swimming-pool text-blue-500 mr-1"></i>
                            Kolam Renang
                        </label>
                    </div>
                    <div class="flex items-center">
                        <input type="checkbox" id="gym" name="fasilitas[]" value="gym" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                        <label for="gym" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer hover:text-blue-600 transition duration-300 flex items-center">
                            <i class="fas fa-dumbbell text-blue-500 mr-1"></i>
                            Gym
                        </label>
                    </div>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                    <i class="fas fa-credit-card text-blue-500 mr-2"></i>
                    Metode Pembayaran
                </label>
                <div class="flex flex-wrap gap-4">
                    <div class="flex items-center">
                        <input type="radio" id="cash" name="metode_pembayaran" value="cash" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500">
                        <label for="cash" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer hover:text-blue-600 transition duration-300 flex items-center">
                            <i class="fas fa-money-bill-wave text-blue-500 mr-1"></i>
                            Tunai
                        </label>
                    </div>
                    <div class="flex items-center">
                        <input type="radio" id="transfer" name="metode_pembayaran" value="transfer" class="w-5 h-5 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500">
                        <label for="transfer" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer hover:text-blue-600 transition duration-300 flex items-center">
                            <i class="fas fa-university text-blue-500 mr-1"></i>
                            Transfer Bank
                        </label>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <i class="fas fa-envelope text-blue-500 mr-2"></i>
                        Email
                    </label>
                    <input type="email" id="email" name="email" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
                </div>
                <div>
                    <label for="nomor-telepon" class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <i class="fas fa-phone text-blue-500 mr-2"></i>
                        Nomor Telepon
                    </label>
                    <input type="tel" id="nomor-telepon" name="nomor_telepon" class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition duration-300" required>
                </div>
            </div>

            <button type="submit" class="w-full bg-gradient-to-r from-blue-500 to-purple-600 text-white py-3 px-4 rounded-lg font-semibold text-lg hover:from-blue-600 hover:to-purple-700 transform hover:scale-105 transition duration-300 shadow-lg flex items-center justify-center">
                <i class="fas fa-paper-plane mr-2"></i>
                Kirim Pemesanan
            </button>
            
        </form>
         <a href="index.jsp" class="mt-2 w-full bg-gradient-to-r from-red-500 to-pink-600 text-white py-3 px-4 rounded-lg font-semibold text-lg hover:from-red-600 hover:to-pink-700 transform hover:scale-105 transition duration-300 shadow-lg flex items-center justify-center">
           <i class="fas fa-arrow-left mr-2"></i>
            Kembali
          </a>
    </div>
</body>
</html>
<%-- 
    Document   : index.jsp
    Created on : 9 Nov 2025, 10.58.03
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manajemen Pemesanan Hotel</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      font-family: 'Poppins', sans-serif;
    }
    .fade-in {
      animation: fadeIn 0.8s ease-in-out;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>

<body class="min-h-screen flex items-center justify-center p-6">
  <div class="bg-white p-10 rounded-3xl shadow-2xl w-full max-w-3xl fade-in text-center">

    <h1 class="text-4xl font-bold text-gray-800 mb-4">
      🏨 Sistem Pemesanan Hotel
    </h1>
    <p class="text-gray-500 mb-8 text-lg">Kelola data pemesanan </p>

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-8">
      
   
      <a href="tambah.jsp"
         class="bg-gradient-to-r from-green-400 to-green-600 text-white font-semibold py-4 px-6 rounded-xl
                shadow-lg hover:from-green-500 hover:to-green-700 hover:scale-105 transform transition duration-300
                flex flex-col items-center justify-center">
        <i class="fas fa-plus-circle text-3xl mb-2"></i>
        <span>Tambah Pemesanan</span>
      </a>

     
      <a href="/myweb/Tampil"
         class="bg-gradient-to-r from-blue-500 to-purple-600 text-white font-semibold py-4 px-6 rounded-xl
                shadow-lg hover:from-blue-600 hover:to-purple-700 hover:scale-105 transform transition duration-300
                flex flex-col items-center justify-center">
        <i class="fas fa-table text-3xl mb-2"></i>
        <span>Lihat Data Pemesanan</span>
      </a>
    </div>

  
    <p class="text-gray-400 text-sm mt-10">
      Hotel Management System
    </p>
  </div>
</body>
</html>


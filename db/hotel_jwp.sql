-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2025 at 05:54 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_jwp`
--

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_hotel`
--

CREATE TABLE `pemesanan_hotel` (
  `id_pemesanan` int NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `jenis_kamar` varchar(50) NOT NULL,
  `jumlah_tamu` int NOT NULL,
  `fasilitas` text,
  `metode_pembayaran` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `tanggal_pemesanan` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemesanan_hotel`
--

INSERT INTO `pemesanan_hotel` (`id_pemesanan`, `nama_lengkap`, `tanggal_checkin`, `tanggal_checkout`, `jenis_kamar`, `jumlah_tamu`, `fasilitas`, `metode_pembayaran`, `email`, `nomor_telepon`, `tanggal_pemesanan`) VALUES
(1, 'Rafif Rabbani', '2025-11-09', '2025-11-10', 'single', 2, 'wifi, pool', 'cash', '2311500777@student.budiluhur.ac.id', '111', '2025-11-09 04:48:30'),
(6, 'Rafif Rabbani', '2025-11-09', '2025-11-10', 'single', 2, 'wifi, breakfast', 'cash', '2311500777@student.budiluhur.ac.id', '2212', '2025-11-09 05:24:56'),
(7, 'Rafif Rabbani', '2025-11-09', '2025-11-10', 'single', 20, 'wifi, pool', 'cash', '2311500777@student.budiluhur.ac.id', '2212', '2025-11-09 05:26:11'),
(8, 'Rafif Rabbani', '2025-11-09', '2025-11-10', 'single', 1, 'wifi, breakfast', 'transfer', '2311500777@student.budiluhur.ac.id', '2212', '2025-11-09 05:28:34'),
(9, 'rehan', '2025-11-09', '2025-11-12', 'single', 12, 'wifi, pool', 'transfer', '2311500777@student.budiluhur.ac.id', '2212', '2025-11-09 05:46:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemesanan_hotel`
--
ALTER TABLE `pemesanan_hotel`
  ADD PRIMARY KEY (`id_pemesanan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemesanan_hotel`
--
ALTER TABLE `pemesanan_hotel`
  MODIFY `id_pemesanan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

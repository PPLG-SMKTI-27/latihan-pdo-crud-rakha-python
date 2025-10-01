-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2025 at 08:27 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_kategori` int DEFAULT NULL,
  `stok` int DEFAULT '0',
  `harga` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama`, `id_kategori`, `stok`, `harga`) VALUES
(1, 'raka ganteng', 5, 20, '200987.00'),
(2, 'handgrip', 2, 20, '80000.00'),
(3, 'knalpot', 3, 5, '675000.00'),
(4, 'pulley', 4, 50, '87000.00'),
(5, 'vanbelt', 5, 12, '120000.00'),
(6, 'Raka lol', 5, 892, '6567657.00'),
(7, 'baju kepin', 5, 8, '200000.00'),
(8, 'baju kepin', 5, 8, '200000.00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi`) VALUES
(1, 'elektronik', 'peralatan elektronik rumah tangga'),
(2, 'CVT', 'part variasi cvt untuk motor'),
(3, 'biled', 'part untuk penerangan lampu motor'),
(4, 'handgrip', 'variasi handgrip motor'),
(5, 'velg', 'variasi velg motor');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `alamat`, `telepon`, `email`) VALUES
(1, 'CV.Sumber abadi makmur', 'jl.aws', '08999409', 'sam@gmail.com'),
(2, 'PT.bms motoshop', 'jl.lembuswana', '081298760', 'bms@gmail.com'),
(3, 'PT.jatim motoshop', 'jl.basukirahmat', '0827863567', 'jatim@gmail.com'),
(4, 'PT.maersk', 'jl.pelabuhan', '08123427689', 'maersk@gmail.com'),
(5, 'PT.lionGroup', 'jl.apt pranoto', '09872637463', 'LionGroup@gmail.com'),
(6, 'CV.Sumber abadi makmur', 'jl.aws 10, Surabaya', '08999409', 'sam@gmail.com'),
(7, 'PT.bms motoshop', 'jl.lembuswana 20, Jakarta', '081298760', 'bms@gmail.com'),
(8, 'PT.jatim motoshop', 'jl.basukirahmat 15, Surabaya', '0827863567', 'jatim@gmail.com'),
(9, 'PT.maersk', 'jl.pelabuhan 5, Bandung', '08123427689', 'maersk@gmail.com'),
(10, 'PT.lionGroup', 'jl.apt pranoto 7, Medan', '09872637463', 'LionGroup@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `id_barang` int DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `jenis` enum('masuk','keluar') DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_barang`, `tgl_transaksi`, `jenis`, `jumlah`, `keterangan`) VALUES
(1, 1, '2025-01-02', 'masuk', 10, 'pengiriman awal roller'),
(2, 2, '2025-01-10', 'keluar', 5, 'penjualan handgrip motor'),
(3, 3, '2025-02-03', 'masuk', 20, 'stok knalpot baru'),
(4, 4, '2025-02-06', 'keluar', 15, 'pengiriman stok pulley'),
(5, 5, '2025-02-10', 'masuk', 30, 'stok vanbelt baru');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2019 at 06:37 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 5.6.40-8+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankdarah`
--

-- --------------------------------------------------------

--
-- Table structure for table `darah`
--

CREATE TABLE `darah` (
  `id_darah` int(15) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `ukuran` varchar(25) NOT NULL,
  `stok` int(10) NOT NULL,
  `jenis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `darah`
--

INSERT INTO `darah` (`id_darah`, `golongan`, `ukuran`, `stok`, `jenis`) VALUES
(1, 'A (PRC)', '2.5', 12, 'PRC'),
(2, 'A (WB)', '3.5', 22, 'WB'),
(3, 'AB (PRC)', '2.5', 10, 'PRC'),
(4, 'AB (WB)', '3.5', 10, 'WB'),
(5, 'O (PRC)', '2.5', 11, 'PRC'),
(6, 'O (WB)', '3.5', 3, 'WB'),
(7, 'B (PRC)', '2.5', 11, 'PRC'),
(8, 'B (WB)', '3.5', 6, 'WB');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `pasien` varchar(150) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_darah` int(11) NOT NULL,
  `golongan` varchar(150) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status` enum('waiting','confirm','cancel','cancel_perawat') NOT NULL DEFAULT 'waiting',
  `note` text,
  `data` text,
  `reaksi_darah` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `pasien`, `id_user`, `nama_user`, `id_darah`, `golongan`, `jumlah`, `status`, `note`, `data`, `reaksi_darah`, `created_at`, `updated_at`) VALUES
(4, 'Yanto alinah', 8, 'Siti Maesaroh', 2, 'A (WB)', 2, 'confirm', 'Oke...darah sedang di ambil..ready 15 menit lagi', '{"bagian":"Irene 4","kamar":"312","dokter":"Dokter Bambang","diagnosa":"Kekurangan Darah","hb":"8","nama_pasien":"Yanto alinah","nomor_register":"9988832322","jenis_kelamin":"laki-laki","umur":"45","alamat":"jalan pelajar pejuang no 4","darah":"2","jumlah":"2"}', 'reaksi darah bagus', '2019-07-04 03:12:06', '2019-07-04 03:12:06'),
(5, 'Albert Mechine', 4, 'Yohanes', 8, 'B (WB)', 3, 'confirm', 'darah sedang di ambil', '{"bagian":"st corolus 2","kamar":"33 c","dokter":"Dokter Ari ","diagnosa":"Sakit Jantung","hb":"9","nama_pasien":"Albert Mechine","nomor_register":"443332","jenis_kelamin":"laki-laki","umur":"55","alamat":"jalan pelajar pejuang 45","darah":"8","jumlah":"3"}', 'stabil', '2019-07-08 03:19:09', '2019-07-08 03:19:09'),
(6, 'Dadang Damirudin', 4, 'Yohanes', 8, 'B (WB)', 4, 'cancel', 'dfsf', '{"bagian":"st corolus","kamar":"54 C","dokter":"Dokter Ari ","diagnosa":"Ginjal","hb":"9","nama_pasien":"Dadang Damirudin","nomor_register":"23773","jenis_kelamin":"laki-laki","umur":"75","alamat":"jalan pelajar pejuang 45","darah":"8","jumlah":"4"}', 'Normal', '2019-07-08 03:20:23', '2019-07-08 03:20:23'),
(7, 'tn. wiria', 4, 'Yohanes', 7, 'B (PRC)', 3, 'cancel', 'kasainget', '{"bagian":"icu","kamar":"12","dokter":"dr. dewi","diagnosa":"anemia","hb":"6.0","nama_pasien":"tn. wiria","nomor_register":"123456","jenis_kelamin":"laki-laki","umur":"78 thn","alamat":"jln borromeus 1 no 12","darah":"7","jumlah":"3"}', NULL, '2019-07-08 05:36:37', '2019-07-08 05:36:37'),
(8, 'by. mikayla', 4, 'Yohanes', 1, 'A (PRC)', 8, 'cancel', '', '{"bagian":"perina 2 ","kamar":"12","dokter":"dr. sandjaja","diagnosa":"anemia","hb":"6.0","nama_pasien":"by. mikayla","nomor_register":"12345","jenis_kelamin":"perempuan","umur":"1 bulan","alamat":"jln borromeus","darah":"1","jumlah":"8"}', NULL, '2019-07-08 06:25:16', '2019-07-08 06:25:16'),
(9, 'zulkarnain', 4, 'Yohanes', 8, 'B (WB)', 5, 'cancel', 'reaksi negativ', '{"bagian":"Irene 4","kamar":"32","dokter":"agustin","diagnosa":"anemina","hb":"5","nama_pasien":"zulkarnain","nomor_register":"988832","jenis_kelamin":"laki-laki","umur":"65","alamat":"Jl pajajaran 87","darah":"8","jumlah":"5"}', NULL, '2019-07-09 09:48:05', '2019-07-09 09:48:05'),
(10, 'yandi suyandi', 4, 'Yohanes', 2, 'A (WB)', 2, 'cancel', 'batal', '{"bagian":"Irene 4","kamar":"312","dokter":"Dokter Bambang","diagnosa":"Kekurangan Darah","hb":"7","nama_pasien":"yandi suyandi","nomor_register":"993232222","jenis_kelamin":"laki-laki","umur":"54","alamat":"","darah":"2","jumlah":"2"}', NULL, '2019-07-12 04:10:43', '2019-07-12 04:10:43'),
(11, 'Sucipto', 4, 'Yohanes', 6, 'O (WB)', 4, 'cancel', 'cancel', '{"bagian":"Irene 4","kamar":"54","dokter":"Dokter Kumaladi","diagnosa":"anemina","hb":"5","nama_pasien":"Sucipto","nomor_register":"2334332","jenis_kelamin":"laki-laki","umur":"45","alamat":"","darah":"6","jumlah":"4"}', 'Bagus', '2019-07-12 04:23:44', '2019-07-12 04:23:44'),
(12, 'Sucipto sudiro', 4, 'Yohanes', 8, 'B (WB)', 3, 'cancel', 'ujicoba cancel', '{"bagian":"Irene 4","kamar":"312","dokter":"Dokter Bambang","diagnosa":"anemina","hb":"8","nama_pasien":"Sucipto sudiro","nomor_register":"988832","jenis_kelamin":"laki-laki","umur":"45","alamat":"","darah":"8","jumlah":"3"}', NULL, '2019-07-12 04:26:05', '2019-07-12 04:26:05'),
(13, 'Albert Mechine', 4, 'Yohanes', 4, 'AB (WB)', 3, 'cancel', '', '{"bagian":"st corolus","kamar":"31","dokter":"Dokter Ari ","diagnosa":"Ginjal","hb":"9","nama_pasien":"Albert Mechine","nomor_register":"884884","jenis_kelamin":"laki-laki","umur":"75","alamat":"jalan pelajar pejuang 45","darah":"4","jumlah":"3"}', 'test bagus', '2019-07-13 03:43:18', '2019-07-13 03:43:18'),
(14, 'udin', 4, 'Yohanes', 2, 'A (WB)', 2, 'cancel', 'twsadas', '{"bagian":"Test 002","kamar":"test","dokter":"test","diagnosa":"mungkin penyakit rindu","hb":"2","nama_pasien":"udin","nomor_register":"009","jenis_kelamin":"laki-laki","umur":"75","alamat":"jalan pelajar pejuang 45","darah":"2","jumlah":"2"}', NULL, '2019-07-13 03:49:52', '2019-07-13 03:49:52'),
(15, 'ibu rokhaya', 4, 'Yohanes', 3, 'AB (PRC)', 4, 'cancel', 'ada donor keluarga', '{"bagian":"maria ","kamar":"12","dokter":"dr dian","diagnosa":"anemia","hb":"7.0","nama_pasien":"ibu rokhaya","nomor_register":"13","jenis_kelamin":"perempuan","umur":"52","alamat":"bandung","darah":"3","jumlah":"4"}', NULL, '2019-07-14 13:41:52', '2019-07-14 13:41:52'),
(16, 'tn rafi', 4, 'Yohanes', 3, 'AB (PRC)', 5, 'cancel', 'Pasien Meninggal', '{"bagian":"maria ","kamar":"01","dokter":"dr dian","diagnosa":"anemia","hb":"6.0","nama_pasien":"tn rafi","nomor_register":"14","jenis_kelamin":"laki-laki","umur":"32","alamat":"bandung","darah":"3","jumlah":"5"}', NULL, '2019-07-14 13:43:30', '2019-07-14 13:43:30'),
(17, 'adi rosadi', 4, 'Yohanes', 2, 'A (WB)', 7, 'cancel', '', '{"bagian":"st corolus","kamar":"31","dokter":"Dokter Ari ","diagnosa":"Ginjal","hb":"9","nama_pasien":"adi rosadi","nomor_register":"8848844","jenis_kelamin":"laki-laki","umur":"75","alamat":"jalan pelajar pejuang 45","darah":"2","jumlah":"7"}', NULL, '2019-07-14 14:24:46', '2019-07-14 14:24:46'),
(18, 'tn. sucipto', 4, 'Yohanes', 2, 'A (WB)', 2, 'cancel', 'Pasien meninggal', '{"bagian":"st maria","kamar":"34","dokter":"dr. Ridwan","diagnosa":"jantung","hb":"8","nama_pasien":"tn. sucipto","nomor_register":"99883882","jenis_kelamin":"laki-laki","umur":"87","alamat":"dago 56","darah":"2","jumlah":"2"}', NULL, '2019-07-19 03:51:01', '2019-07-19 03:51:01'),
(19, 'tn.ari manurung', 4, 'Yohanes', 1, 'A (PRC)', 5, 'cancel', 'dibatalkan Pasien Meninggal', '{"bagian":"st maria","kamar":"31","dokter":"dr. suyanto","diagnosa":"Ginjal","hb":"9","nama_pasien":"tn.ari manurung","nomor_register":"554432","jenis_kelamin":"laki-laki","umur":"34","alamat":"jalan pelajar pejuang 45","darah":"1","jumlah":"5"}', NULL, '2019-07-19 07:09:29', '2019-07-19 07:09:29'),
(20, 'tn. Jodi Sudiwo', 4, 'Yohanes', 1, 'A (PRC)', 5, 'cancel', '', '{"bagian":"st corolus","kamar":"31","dokter":"dokter boyke","diagnosa":"Ginjal","hb":"9","nama_pasien":"tn. Jodi Sudiwo","nomor_register":"884884","jenis_kelamin":"laki-laki","umur":"34","alamat":"jalan pelajar pejuang 45","darah":"1","jumlah":"5"}', NULL, '2019-07-19 07:13:27', '2019-07-19 07:13:27'),
(21, 'ny merry', 4, 'Yohanes', 1, 'A (PRC)', 3, 'confirm', 'sedang croshmatch', '{"bagian":"maria","kamar":"12","dokter":"dr. handoko","diagnosa":"anemia","hb":"7.0","nama_pasien":"ny merry","nomor_register":"123","jenis_kelamin":"perempuan","umur":"52 tahun","alamat":"cimahi","darah":"1","jumlah":"3"}', 'pasien gatal seluruh tubuh dan demam', '2019-07-21 03:01:16', '2019-07-21 03:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(150) NOT NULL,
  `nik` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nik`, `password`, `nama_user`, `role`, `no_hp`, `created_at`, `updated_at`) VALUES
(1, '00001', '21232f297a57a5a743894a0e4a801fc3', 'Delvi', 'admin', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '00002', 'ee11cbb19052e40b07aac0ca060c23ee', 'Yohanes', 'user', '085550553104', '2019-06-23 08:00:44', '2019-06-23 08:00:44'),
(5, '00003', '202cb962ac59075b964b07152d234b70', '08123123', 'user', NULL, '2019-06-28 18:33:41', '2019-06-28 18:33:41'),
(6, '0004', '202cb962ac59075b964b07152d234b70', 'TESTER123', 'admin', '1231232', '2019-06-28 18:35:21', '2019-06-28 18:35:21'),
(7, 'admin', 'a61d31eebabb9247ff6abdd62c8361aa', 'Enung Laksita', 'admin', '085657377283', '2019-07-04 10:09:17', '2019-07-04 10:09:17'),
(8, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'Siti Maesaroh', 'user', '085657377283', '2019-07-04 10:09:58', '2019-07-04 10:09:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `darah`
--
ALTER TABLE `darah`
  ADD PRIMARY KEY (`id_darah`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `darah`
--
ALTER TABLE `darah`
  MODIFY `id_darah` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

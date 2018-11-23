-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2018 at 01:53 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` int(5) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `Mobile` varchar(14) NOT NULL,
  `UpdateBy` int(5) NOT NULL,
  `UpdateOn` date NOT NULL,
  `CreatedBy` int(5) NOT NULL,
  `CreatedOn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `Name`, `Email`, `Address`, `Mobile`, `UpdateBy`, `UpdateOn`, `CreatedBy`, `CreatedOn`) VALUES
(1, 'makmur', 'makmur@gmail.com', 'jombang', '081554477423', 1, '2018-11-23', 1, '2018-11-23'),
(2, 'sule', 'sule@gmail.com', 'jombang', '081554477422', 1, '2018-11-23', 1, '2018-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `detailbarang`
--

CREATE TABLE `detailbarang` (
  `NoUrut` int(11) NOT NULL,
  `Gambar` varchar(254) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `IdBarang` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `detailmutasibrg`
--

CREATE TABLE `detailmutasibrg` (
  `NoUrut` int(11) NOT NULL,
  `JumlahItem` int(11) DEFAULT '0',
  `IsVerified` smallint(6) DEFAULT '0',
  `Keterangan` varchar(100) DEFAULT NULL,
  `IdMutasiBrg` varchar(16) NOT NULL,
  `IdBarang` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `NoUrut` int(11) NOT NULL DEFAULT '1',
  `IdPenjualan` varchar(16) NOT NULL,
  `JumlahItem` int(11) NOT NULL DEFAULT '1',
  `HargaSatuan` int(11) NOT NULL DEFAULT '0',
  `Keterangan` varchar(100) DEFAULT NULL,
  `IdPromosi` varchar(15) NOT NULL,
  `KodePerson` varchar(16) NOT NULL,
  `IdBarang` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `IdKategori` varchar(8) NOT NULL,
  `NamaKat` varchar(45) DEFAULT NULL,
  `Gambar` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`IdKategori`, `NamaKat`, `Gambar`) VALUES
('1', 'Pakaian', '/images/apps.cn.com.winrar.svg'),
('2', 'Elektronik', '/images/apps.cn.emoney.svg'),
('3', 'Perabotan', '/images/apps.com.163.mail.dashi.pc.svg'),
('4', 'Otomotif', '/images/apps.com.2048.svg');

-- --------------------------------------------------------

--
-- Table structure for table `mstbarang`
--

CREATE TABLE `mstbarang` (
  `IdBarang` varchar(15) NOT NULL,
  `NamaBarang` varchar(45) DEFAULT NULL,
  `Harga` int(11) NOT NULL DEFAULT '0',
  `Gambar` varchar(254) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `IdKategori` varchar(8) NOT NULL,
  `IdSubKat` varchar(8) NOT NULL,
  `IdSubSubKat` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mutasibarang`
--

CREATE TABLE `mutasibarang` (
  `IdMutasiBrg` varchar(16) NOT NULL,
  `Tanggal` datetime NOT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `Debet` int(11) DEFAULT '0',
  `Kredit` int(11) DEFAULT '0',
  `JenisMutasi` enum('supply','retur') NOT NULL,
  `IsVerified` smallint(6) DEFAULT '0',
  `KodePerson` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mutasidana`
--

CREATE TABLE `mutasidana` (
  `IdMutasi` varchar(16) NOT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `Debet` int(11) DEFAULT '0',
  `Kredit` int(11) DEFAULT '0',
  `IsVerified` smallint(6) DEFAULT '0',
  `Keterangan` varchar(45) DEFAULT NULL,
  `KodePerson` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `IdPenjualan` varchar(16) NOT NULL,
  `Tanggal` datetime NOT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `IsVerified` smallint(6) NOT NULL DEFAULT '0',
  `IsBayar` smallint(6) NOT NULL DEFAULT '0',
  `TotalTagihan` int(11) NOT NULL DEFAULT '0',
  `KodePerson` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `KodePerson` varchar(16) NOT NULL,
  `NamaDepan` varchar(45) DEFAULT NULL,
  `NamaBelakang` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Userpass` varchar(45) NOT NULL,
  `JenisKelamin` enum('L','P') NOT NULL,
  `StatusPerson` enum('penjual','pembeli') NOT NULL,
  `Token` varchar(254) DEFAULT NULL,
  `Gambar` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `promosi`
--

CREATE TABLE `promosi` (
  `IdPromosi` varchar(15) NOT NULL,
  `NamaPromosi` varchar(45) NOT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `TanggalMulai` datetime NOT NULL,
  `TanggalSelesai` datetime NOT NULL,
  `Diskon` int(11) DEFAULT NULL,
  `Gambar` varchar(254) DEFAULT NULL,
  `IdBarang` varchar(15) NOT NULL,
  `KodePerson` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `IdStok` varchar(15) NOT NULL,
  `NamaStok` varchar(45) DEFAULT NULL,
  `Tanggal` datetime NOT NULL,
  `Debet` int(11) DEFAULT '0',
  `Kredit` int(11) DEFAULT '0',
  `IsVerified` smallint(6) NOT NULL DEFAULT '0',
  `IdBarang` varchar(15) NOT NULL,
  `KodePerson` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subkategori`
--

CREATE TABLE `subkategori` (
  `IdSubKat` varchar(8) NOT NULL,
  `NamaSubKat` varchar(45) DEFAULT NULL,
  `Gambar` varchar(254) DEFAULT NULL,
  `IdKategori` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subsubkategori`
--

CREATE TABLE `subsubkategori` (
  `IdSubSubKat` varchar(8) NOT NULL,
  `NamaSubSubKat` varchar(45) DEFAULT NULL,
  `Gambar` varchar(254) DEFAULT NULL,
  `IdSubKat` varchar(8) NOT NULL,
  `IdKategori` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_api`
--

CREATE TABLE `users_api` (
  `id` int(5) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  `CreateOn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_api`
--

INSERT INTO `users_api` (`id`, `Name`, `Email`, `Password`, `Active`, `CreateOn`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123', 1, '2018-11-21'),
(2, 'syahrul', 'ahmadsyahrullft9@gmail.com', 'counter45', 0, '2018-11-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `detailbarang`
--
ALTER TABLE `detailbarang`
  ADD PRIMARY KEY (`NoUrut`,`IdBarang`),
  ADD KEY `fk_detailbarang_mstbarang1_idx` (`IdBarang`);

--
-- Indexes for table `detailmutasibrg`
--
ALTER TABLE `detailmutasibrg`
  ADD PRIMARY KEY (`NoUrut`,`IdMutasiBrg`),
  ADD KEY `fk_detailmutasibrg_mutasibarang1_idx` (`IdMutasiBrg`),
  ADD KEY `fk_detailmutasibrg_mstbarang1_idx` (`IdBarang`);

--
-- Indexes for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`NoUrut`,`IdPenjualan`),
  ADD KEY `fk_detailpenjualan_Penjualan1_idx` (`IdPenjualan`),
  ADD KEY `fk_detailpenjualan_Promosi1_idx` (`IdPromosi`),
  ADD KEY `fk_detailpenjualan_person1_idx` (`KodePerson`),
  ADD KEY `fk_detailpenjualan_mstbarang1_idx` (`IdBarang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`IdKategori`);

--
-- Indexes for table `mstbarang`
--
ALTER TABLE `mstbarang`
  ADD PRIMARY KEY (`IdBarang`),
  ADD KEY `fk_mstbarang_kategori1_idx` (`IdKategori`),
  ADD KEY `fk_mstbarang_subkategori1_idx` (`IdSubKat`),
  ADD KEY `fk_mstbarang_subsubkategori1_idx` (`IdSubSubKat`);

--
-- Indexes for table `mutasibarang`
--
ALTER TABLE `mutasibarang`
  ADD PRIMARY KEY (`IdMutasiBrg`),
  ADD KEY `fk_mutasibarang_person1_idx` (`KodePerson`);

--
-- Indexes for table `mutasidana`
--
ALTER TABLE `mutasidana`
  ADD PRIMARY KEY (`IdMutasi`),
  ADD KEY `fk_mutasidana_person1_idx` (`KodePerson`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`IdPenjualan`),
  ADD KEY `fk_Penjualan_person1_idx` (`KodePerson`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`KodePerson`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);

--
-- Indexes for table `promosi`
--
ALTER TABLE `promosi`
  ADD PRIMARY KEY (`IdPromosi`),
  ADD KEY `fk_Promosi_mstbarang1_idx` (`IdBarang`),
  ADD KEY `fk_Promosi_person1_idx` (`KodePerson`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`IdStok`),
  ADD KEY `fk_stok_mstbarang1_idx` (`IdBarang`),
  ADD KEY `fk_stok_person1_idx` (`KodePerson`);

--
-- Indexes for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD PRIMARY KEY (`IdSubKat`),
  ADD KEY `fk_subkategori_kategori_idx` (`IdKategori`);

--
-- Indexes for table `subsubkategori`
--
ALTER TABLE `subsubkategori`
  ADD PRIMARY KEY (`IdSubSubKat`),
  ADD KEY `fk_subsubkategori_subkategori1_idx` (`IdSubKat`),
  ADD KEY `fk_subsubkategori_kategori1_idx` (`IdKategori`);

--
-- Indexes for table `users_api`
--
ALTER TABLE `users_api`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_api`
--
ALTER TABLE `users_api`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailbarang`
--
ALTER TABLE `detailbarang`
  ADD CONSTRAINT `fk_detailbarang_mstbarang1` FOREIGN KEY (`IdBarang`) REFERENCES `mstbarang` (`IdBarang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detailmutasibrg`
--
ALTER TABLE `detailmutasibrg`
  ADD CONSTRAINT `fk_detailmutasibrg_mstbarang1` FOREIGN KEY (`IdBarang`) REFERENCES `mstbarang` (`IdBarang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailmutasibrg_mutasibarang1` FOREIGN KEY (`IdMutasiBrg`) REFERENCES `mutasibarang` (`IdMutasiBrg`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD CONSTRAINT `fk_detailpenjualan_Penjualan1` FOREIGN KEY (`IdPenjualan`) REFERENCES `penjualan` (`IdPenjualan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailpenjualan_Promosi1` FOREIGN KEY (`IdPromosi`) REFERENCES `promosi` (`IdPromosi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailpenjualan_mstbarang1` FOREIGN KEY (`IdBarang`) REFERENCES `mstbarang` (`IdBarang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailpenjualan_person1` FOREIGN KEY (`KodePerson`) REFERENCES `person` (`KodePerson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mstbarang`
--
ALTER TABLE `mstbarang`
  ADD CONSTRAINT `fk_mstbarang_kategori1` FOREIGN KEY (`IdKategori`) REFERENCES `kategori` (`IdKategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mstbarang_subkategori1` FOREIGN KEY (`IdSubKat`) REFERENCES `subkategori` (`IdSubKat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mstbarang_subsubkategori1` FOREIGN KEY (`IdSubSubKat`) REFERENCES `subsubkategori` (`IdSubSubKat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mutasibarang`
--
ALTER TABLE `mutasibarang`
  ADD CONSTRAINT `fk_mutasibarang_person1` FOREIGN KEY (`KodePerson`) REFERENCES `person` (`KodePerson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mutasidana`
--
ALTER TABLE `mutasidana`
  ADD CONSTRAINT `fk_mutasidana_person1` FOREIGN KEY (`KodePerson`) REFERENCES `person` (`KodePerson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_Penjualan_person1` FOREIGN KEY (`KodePerson`) REFERENCES `person` (`KodePerson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `promosi`
--
ALTER TABLE `promosi`
  ADD CONSTRAINT `fk_Promosi_mstbarang1` FOREIGN KEY (`IdBarang`) REFERENCES `mstbarang` (`IdBarang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Promosi_person1` FOREIGN KEY (`KodePerson`) REFERENCES `person` (`KodePerson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `fk_stok_mstbarang1` FOREIGN KEY (`IdBarang`) REFERENCES `mstbarang` (`IdBarang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stok_person1` FOREIGN KEY (`KodePerson`) REFERENCES `person` (`KodePerson`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD CONSTRAINT `fk_subkategori_kategori` FOREIGN KEY (`IdKategori`) REFERENCES `kategori` (`IdKategori`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subsubkategori`
--
ALTER TABLE `subsubkategori`
  ADD CONSTRAINT `fk_subsubkategori_kategori1` FOREIGN KEY (`IdKategori`) REFERENCES `kategori` (`IdKategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_subsubkategori_subkategori1` FOREIGN KEY (`IdSubKat`) REFERENCES `subkategori` (`IdSubKat`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

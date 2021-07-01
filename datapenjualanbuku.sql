-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2021 pada 14.54
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datapenjualanbuku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `idbuku` varchar(10) NOT NULL,
  `iddistributor` varchar(10) NOT NULL,
  `judul` varchar(90) DEFAULT NULL,
  `noisbn` varchar(15) DEFAULT NULL,
  `penulis` varchar(65) DEFAULT NULL,
  `penerbit` varchar(65) DEFAULT NULL,
  `tahun` datetime DEFAULT NULL,
  `stok` tinyint(4) DEFAULT NULL,
  `harga_pokok` int(3) DEFAULT NULL,
  `harga_jual` int(3) DEFAULT NULL,
  `ppn` decimal(3,1) DEFAULT '0.0',
  `diskon` decimal(3,1) DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`idbuku`, `iddistributor`, `judul`, `noisbn`, `penulis`, `penerbit`, `tahun`, `stok`, `harga_pokok`, `harga_jual`, `ppn`, `diskon`) VALUES
('A1BAABB3AD', 'AA1ACBBDDC', 'Matahari', '44', 'Lulu', 'Aulia', '2021-07-01 14:45:24', 127, 100000, 120000, '3.0', '5.0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `distributor`
--

CREATE TABLE `distributor` (
  `iddistributor` varchar(10) NOT NULL,
  `namadistributor` varchar(65) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `distributor`
--

INSERT INTO `distributor` (`iddistributor`, `namadistributor`, `alamat`, `telepon`) VALUES
('AA1ACBBDDC', 'Marfiari Asabella', 'Jl. Permata No. 9 Cimahi', '089876506676'),
('AAAB1213B2', 'Muhammad Ramdhani', 'Jl. Riau No. 11 Bandung', '08138709789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `nama` varchar(65) DEFAULT NULL,
  `username` varchar(65) NOT NULL,
  `password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`nama`, `username`, `password`) VALUES
('Admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasok`
--

CREATE TABLE `pasok` (
  `idpasok` int(11) NOT NULL,
  `idbuku` varchar(10) DEFAULT NULL,
  `iddistributor` varchar(10) DEFAULT NULL,
  `jumlah` tinyint(4) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pasok`
--

INSERT INTO `pasok` (`idpasok`, `idbuku`, `iddistributor`, `jumlah`, `tanggal`) VALUES
(43, 'A1BAABB3AD', 'AA1ACBBDDC', 76, '2021-07-01 14:45:24');

--
-- Trigger `pasok`
--
DELIMITER $$
CREATE TRIGGER `after_insert_pasok` AFTER INSERT ON `pasok` FOR EACH ROW UPDATE buku SET
buku.stok = buku.stok + new.jumlah
WHERE buku.idbuku = new.idbuku
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `idpenjualan` int(11) NOT NULL,
  `idbuku` varchar(10) DEFAULT NULL,
  `idkasir` varchar(65) DEFAULT NULL,
  `jumlah` tinyint(4) DEFAULT NULL,
  `total` int(3) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Trigger `penjualan`
--
DELIMITER $$
CREATE TRIGGER `after_insert_penjualan` AFTER INSERT ON `penjualan` FOR EACH ROW UPDATE buku SET
buku.stok =  buku.stok - new.jumlah
WHERE buku.idbuku = new.idbuku
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `v_pasok`
--

CREATE TABLE `v_pasok` (
  `idpasok` int(11) DEFAULT NULL,
  `idbuku` varchar(10) DEFAULT NULL,
  `iddistributor` varchar(10) DEFAULT NULL,
  `jumlah` tinyint(4) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `stok` tinyint(4) DEFAULT NULL,
  `diskon` decimal(3,1) DEFAULT NULL,
  `ppn` decimal(3,1) DEFAULT NULL,
  `harga_pokok` int(3) DEFAULT NULL,
  `harga_jual` int(3) DEFAULT NULL,
  `judul` varchar(90) DEFAULT NULL,
  `namadistributor` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `v_penjualan`
--

CREATE TABLE `v_penjualan` (
  `idpenjualan` int(11) DEFAULT NULL,
  `idbuku` varchar(10) DEFAULT NULL,
  `idkasir` varchar(65) DEFAULT NULL,
  `jumlah` tinyint(4) DEFAULT NULL,
  `total` int(3) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `judul` varchar(90) DEFAULT NULL,
  `nama` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`idbuku`),
  ADD KEY `iddistributor` (`iddistributor`);

--
-- Indeks untuk tabel `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`iddistributor`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pasok`
--
ALTER TABLE `pasok`
  ADD PRIMARY KEY (`idpasok`),
  ADD KEY `fk_pasok_distributor_idx` (`iddistributor`),
  ADD KEY `fk_pasok_buku1_idx` (`idbuku`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`idpenjualan`),
  ADD KEY `fk_penjualan_kasir1_idx` (`idkasir`),
  ADD KEY `fk_penjualan_buku1_idx` (`idbuku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pasok`
--
ALTER TABLE `pasok`
  MODIFY `idpasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `idpenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`iddistributor`) REFERENCES `distributor` (`iddistributor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pasok`
--
ALTER TABLE `pasok`
  ADD CONSTRAINT `fk_pasok_buku1` FOREIGN KEY (`idbuku`) REFERENCES `buku` (`idbuku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pasok_distributor` FOREIGN KEY (`iddistributor`) REFERENCES `distributor` (`iddistributor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_penjualan_buku1` FOREIGN KEY (`idbuku`) REFERENCES `buku` (`idbuku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penjualan_kasir1` FOREIGN KEY (`idkasir`) REFERENCES `kasir` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

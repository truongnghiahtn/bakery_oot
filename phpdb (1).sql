-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2020 at 02:44 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ctdonhang`
--

CREATE TABLE `ctdonhang` (
  `maDH` int(11) NOT NULL,
  `maSP` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `thanhTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ctdonhang`
--

INSERT INTO `ctdonhang` (`maDH`, `maSP`, `soLuong`, `thanhTien`) VALUES
(1, 1, 20, 40000),
(1, 2, 30, 6000);

--
-- Triggers `ctdonhang`
--
DELIMITER $$
CREATE TRIGGER `add_sl` AFTER INSERT ON `ctdonhang` FOR EACH ROW UPDATE sanpham
SET sanpham.soLuong=sanpham.soLuong+new.soLuong
WHERE sanpham.maSP=new.maSP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `maDanhMuc` int(11) NOT NULL,
  `tenDanhMuc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `hinhAnh` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`maDanhMuc`, `tenDanhMuc`, `moTa`, `hinhAnh`) VALUES
(1, 'banh kem', 'banh kem', '123'),
(2, 'banh bao', 'banh bao', '123');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `maDH` int(11) NOT NULL,
  `maKH` int(11) NOT NULL,
  `diaChi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ngayDH` date NOT NULL,
  `trangThai` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`maDH`, `maKH`, `diaChi`, `ngayDH`, `trangThai`) VALUES
(1, 1, '123', '2020-05-19', 'co me no');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `maKH` int(11) NOT NULL,
  `taiKhoan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `matKhau` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hoTen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dienThoai` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`maKH`, `taiKhoan`, `matKhau`, `hoTen`, `dienThoai`, `email`) VALUES
(1, 'phidz', 'admin', 'phi', '01646251700', 'phidz@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `maSP` int(11) NOT NULL,
  `tenSP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `maDanhMuc` int(11) NOT NULL,
  `hinhAnh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `giaSP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`maSP`, `tenSP`, `moTa`, `maDanhMuc`, `hinhAnh`, `giaSP`, `soLuong`) VALUES
(1, 'kem oc que', '123', 1, '123', '2000', 20),
(2, 'banh bao', 'banh bao ngon', 2, 'dá', '3000', 31);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ctdonhang`
--
ALTER TABLE `ctdonhang`
  ADD PRIMARY KEY (`maDH`,`maSP`),
  ADD KEY `maSP` (`maSP`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`maDanhMuc`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`maDH`,`maKH`),
  ADD KEY `maKH` (`maKH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`maKH`),
  ADD UNIQUE KEY `taiKhoan` (`taiKhoan`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`maSP`),
  ADD KEY `maDanhMuc` (`maDanhMuc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `maDanhMuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `maDH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `maKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `maSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ctdonhang`
--
ALTER TABLE `ctdonhang`
  ADD CONSTRAINT `ctdonhang_ibfk_1` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`),
  ADD CONSTRAINT `ctdonhang_ibfk_2` FOREIGN KEY (`maDH`) REFERENCES `donhang` (`maDH`);

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`maKH`) REFERENCES `khachhang` (`maKH`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`maDanhMuc`) REFERENCES `danhmuc` (`maDanhMuc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 07:30 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luonvuituoi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `idBill` int(11) NOT NULL COMMENT 'Hóa đơn',
  `idUser` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `total` float NOT NULL COMMENT 'Tổng tiền',
  `date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày nhập'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`idBill`, `idUser`, `total`, `date`) VALUES
(5, 1, 300000, '2020-12-02 00:40:54'),
(6, 1, 1324120, '2020-12-02 00:40:54'),
(7, 1, 300000, '2020-12-02 00:40:56'),
(8, 1, 1324120, '2020-12-02 00:40:56'),
(9, 1, 300000, '2020-12-02 00:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `idBillDetails` int(11) NOT NULL COMMENT 'Mã chi tiết hóa đơn',
  `idBill` int(11) NOT NULL COMMENT 'Mã hóa đơn',
  `idProductDetail` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `unitPrice` float NOT NULL COMMENT 'Đơn giá',
  `quantity` int(11) NOT NULL COMMENT 'Số lượng',
  `discount` int(11) NOT NULL COMMENT '% giảm giá',
  `subtotal` float NOT NULL COMMENT 'Thành tiền'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `idThuongHieu` int(11) NOT NULL COMMENT 'Mã thương hiệu',
  `nameBrand` varchar(50) NOT NULL COMMENT 'Tên thương hiệu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`idThuongHieu`, `nameBrand`) VALUES
(1, 'Louis Vuitton'),
(2, 'Gucci'),
(3, 'Champion'),
(4, 'Zara'),
(5, 'Saint Laurent'),
(6, 'Burberry');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL COMMENT 'Mã loại sản phẩm',
  `nameCategory` varchar(50) NOT NULL COMMENT 'Tên loại sản phẩm ( shirt, sweater,…)',
  `idGroupProduct` int(11) NOT NULL COMMENT 'Nhóm sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idCategory`, `nameCategory`, `idGroupProduct`) VALUES
(1, 'T-shirt', 1),
(2, 'Jacket', 1),
(3, 'Sweater', 1),
(4, 'Jeans', 2),
(5, 'Baggy', 2),
(7, 'Sneakers', 3),
(8, 'Lazy shoes', 3),
(9, 'Belts', 4),
(10, 'Tech Accessories', 4),
(11, 'Sunglasses', 4),
(12, 'Analog Watches', 5),
(13, 'Digital Watches', 5),
(14, 'Hybrid Watches', 5),
(15, 'Pants', 2),
(16, 'Necklace', 4),
(17, 'Ring', 4);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL COMMENT 'id comment',
  `idUser` int(11) NOT NULL COMMENT 'id user',
  `content` varchar(100) NOT NULL COMMENT 'content',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '(Default: 0- unapproved, 1-approved) ',
  `idProduct` int(11) NOT NULL COMMENT 'id Product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`idComment`, `idUser`, `content`, `status`, `idProduct`) VALUES
(1, 1, 'asdasd', 1, 24),
(2, 1, '23123123123', 1, 24),
(3, 1, '1231231edsafsadfasdfasdf', 1, 24);

-- --------------------------------------------------------

--
-- Table structure for table `groupproduct`
--

CREATE TABLE `groupproduct` (
  `idGroupProduct` int(11) NOT NULL COMMENT 'Mã nhóm sản phẩm',
  `nameGroupProduct` varchar(50) NOT NULL COMMENT 'Tên nhóm sản phẩm ( áo, quần,…)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groupproduct`
--

INSERT INTO `groupproduct` (`idGroupProduct`, `nameGroupProduct`) VALUES
(1, 'Top'),
(2, 'Bottom'),
(3, 'Shoes'),
(4, 'Accessories'),
(5, 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `idProductDetail` int(11) NOT NULL COMMENT 'id Product Detail',
  `idProduct` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `color` varchar(50) DEFAULT NULL COMMENT 'Màu sản phẩm',
  `size` varchar(10) DEFAULT NULL COMMENT 'Size',
  `price` int(30) NOT NULL COMMENT 'Giá',
  `oldPrice` int(50) NOT NULL COMMENT 'Old price',
  `imgUrl` text DEFAULT NULL COMMENT 'Ảnh sản phẩm',
  `quantity` int(50) NOT NULL COMMENT 'Số lượng chi tiết sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`idProductDetail`, `idProduct`, `color`, `size`, `price`, `oldPrice`, `imgUrl`, `quantity`) VALUES
(76, 26, 'Yellow', 'S', 200000, 200000, '72846167_2529855303915258_216114057025945600_n.png', 3),
(77, 32, 'Yellow', 'XXL', 200000, 200000, 'download (1).jfif', 2),
(78, 18, 'Yellow', 'Free size', 200000, 200000, '16830900_761989063956412_1706517993511544718_n.jpg', 13);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `nameProduct` varchar(50) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `idCategory` int(11) NOT NULL COMMENT 'Loại sản phẩm',
  `idBrand` int(11) NOT NULL COMMENT 'Thương hiệu',
  `imgUrl` varchar(50) NOT NULL COMMENT 'Ảnh đại diện',
  `flashSale` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'flash sale',
  `note` int(10) NOT NULL COMMENT '% discount',
  `date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày ra mắt',
  `description` varchar(300) NOT NULL COMMENT 'Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`idProduct`, `nameProduct`, `idCategory`, `idBrand`, `imgUrl`, `flashSale`, `note`, `date`, `description`) VALUES
(18, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:05:17', ''),
(24, 'Đập đá', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:13:48', ''),
(25, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:14:43', ''),
(26, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:15:51', ''),
(27, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:16:38', ''),
(28, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:17:09', ''),
(29, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:18:17', ''),
(30, '', 1, 1, '72846167_2529855303915258_216114057025945600_n.png', 0, 0, '2020-12-02 10:18:48', ''),
(32, 'Đinh Ân Đại', 1, 1, '16830900_761989063956412_1706517993511544718_n.jpg', 0, 123, '2020-12-02 10:30:53', '');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `idRating` int(11) NOT NULL COMMENT 'id rating',
  `points` tinyint(4) NOT NULL COMMENT 'points rating',
  `idProduct` int(11) NOT NULL COMMENT 'id Product',
  `idUser` int(11) NOT NULL COMMENT 'id user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `idReport` int(11) NOT NULL COMMENT 'Mã report',
  `date` datetime NOT NULL COMMENT 'Ngày xuất report',
  `link` varchar(150) NOT NULL COMMENT 'link report'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL COMMENT 'id role',
  `level` varchar(20) NOT NULL COMMENT 'Chức vụ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`idRole`, `level`) VALUES
(1, 'admin'),
(2, 'Giữ xe'),
(3, 'Lao công');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `fullName` varchar(50) DEFAULT NULL COMMENT 'Tên khách hàng',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email',
  `address` varchar(100) DEFAULT NULL COMMENT 'Địa chỉ',
  `phoneNumber` varchar(15) DEFAULT NULL COMMENT 'Số điện thoại',
  `dateOfBirth` date NOT NULL COMMENT 'Ngày sinh',
  `username` varchar(50) NOT NULL COMMENT 'tài khoản',
  `password` varchar(30) NOT NULL COMMENT 'mật khẩu',
  `idRole` int(11) NOT NULL COMMENT 'id Role'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `fullName`, `email`, `address`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idRole`) VALUES
(1, 'Nguyễn Trà Thanh Huy', 'huytra264@gmail.com', 'Việt Nam', '0704633073', '2001-04-26', 'thanhhuy264', '778899', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`idBill`),
  ADD KEY `FK_bill_user` (`idUser`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`idBillDetails`),
  ADD KEY `FK_billdetail_bill` (`idBill`),
  ADD KEY `FK_billdetail_productdetail` (`idProductDetail`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`idThuongHieu`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`),
  ADD KEY `FK_category_groupproduct` (`idGroupProduct`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `FK_comment_products` (`idProduct`),
  ADD KEY `FK_comment_user` (`idUser`);

--
-- Indexes for table `groupproduct`
--
ALTER TABLE `groupproduct`
  ADD PRIMARY KEY (`idGroupProduct`);

--
-- Indexes for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`idProductDetail`),
  ADD KEY `FK_productdetail_products` (`idProduct`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `FK_products_category` (`idCategory`),
  ADD KEY `FK_products_brand` (`idBrand`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`idRating`),
  ADD KEY `FK_rating_user` (`idUser`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`idReport`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `FK_user_role` (`idRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `idBill` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hóa đơn', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `idBillDetails` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã chi tiết hóa đơn', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `idThuongHieu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã thương hiệu', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã loại sản phẩm', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id comment', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groupproduct`
--
ALTER TABLE `groupproduct`
  MODIFY `idGroupProduct` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã nhóm sản phẩm', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `idProductDetail` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id Product Detail', AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `idRating` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id rating', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `idReport` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã report';

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `idRole` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id role', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã khách hàng', AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `FK_billdetail_bill` FOREIGN KEY (`idBill`) REFERENCES `bill` (`idBill`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_billdetail_productdetail` FOREIGN KEY (`idProductDetail`) REFERENCES `productdetail` (`idProductDetail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_category_groupproduct` FOREIGN KEY (`idGroupProduct`) REFERENCES `groupproduct` (`idGroupProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`),
  ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD CONSTRAINT `FK_productdetail_products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_brand` FOREIGN KEY (`idBrand`) REFERENCES `brand` (`idThuongHieu`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_rating_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

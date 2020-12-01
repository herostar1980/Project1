-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 01, 2020 lúc 04:33 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `luonvuituoi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `idBill` int(11) NOT NULL COMMENT 'Hóa đơn',
  `idUser` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `total` float NOT NULL COMMENT 'Tổng tiền',
  `date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày nhập'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
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
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `idThuongHieu` int(11) NOT NULL COMMENT 'Mã thương hiệu',
  `nameBrand` varchar(50) NOT NULL COMMENT 'Tên thương hiệu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `brand`
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
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL COMMENT 'Mã loại sản phẩm',
  `nameCategory` varchar(50) NOT NULL COMMENT 'Tên loại sản phẩm ( shirt, sweater,…)',
  `idGroupProduct` int(11) NOT NULL COMMENT 'Nhóm sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
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
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL COMMENT 'id comment',
  `idUser` int(11) NOT NULL COMMENT 'id user',
  `content` varchar(100) NOT NULL COMMENT 'content',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '(Default: 0- unapproved, 1-approved) ',
  `idProduct` int(11) NOT NULL COMMENT 'id Product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groupproduct`
--

CREATE TABLE `groupproduct` (
  `idGroupProduct` int(11) NOT NULL COMMENT 'Mã nhóm sản phẩm',
  `nameGroupProduct` varchar(50) NOT NULL COMMENT 'Tên nhóm sản phẩm ( áo, quần,…)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `groupproduct`
--

INSERT INTO `groupproduct` (`idGroupProduct`, `nameGroupProduct`) VALUES
(1, 'Top'),
(2, 'Bottom'),
(3, 'Shoes'),
(4, 'Accessories'),
(5, 'Watch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdetail`
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
-- Đang đổ dữ liệu cho bảng `productdetail`
--

INSERT INTO `productdetail` (`idProductDetail`, `idProduct`, `color`, `size`, `price`, `oldPrice`, `imgUrl`, `quantity`) VALUES
(1, 1, 'blue', 'S', 457, 535, NULL, 9),
(2, 1, 'violet', 'L', 457, 535, NULL, 16),
(3, 2, 'black', 'Freesize', 885, 999, NULL, 12),
(4, 3, 'gray', '29', 1350, 1700, NULL, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `nameProduct` varchar(50) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `idCategory` int(11) NOT NULL COMMENT 'Loại sản phẩm',
  `idBrand` int(11) NOT NULL COMMENT 'Thương hiệu',
  `imgUrl` varchar(200) NOT NULL COMMENT 'Ảnh đại diện',
  `flashSale` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'flash sale',
  `note` int(10) NOT NULL COMMENT '% discount',
  `date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày ra mắt',
  `description` varchar(300) NOT NULL COMMENT 'Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`idProduct`, `nameProduct`, `idCategory`, `idBrand`, `imgUrl`, `flashSale`, `note`, `date`, `description`) VALUES
(1, 'CLOUD PRINT T-SHIRT', 1, 1, '../view/assets/img/gallery/louis-vuitton-cloud-print-t-shirt-ready-to-wear--HJY79WNPG617_PM2_Frontview.webp', 1, 35, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroide'),
(2, 'SCULPTURAL JACKET', 2, 1, '../view/assets/img/gallery/louis-vuitton-sculptural-jacket-ready-to-wear--HJJ75WTCX900_PM2_Front view.webp', 1, 15, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroide'),
(3, 'EMBOSSED CLOUDS 90S SLIM PANTS', 1, 1, '../view/assets/img/gallery/louis-vuitton-embossed-clouds-90s-slim-pants-ready-to-wear--HJP70WYFD600_PM2_Frontview.webp', 1, 22, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroidered yarn, creating a sculptural effect. The back i'),
(4, 'Yellow gold ring with Interlocking G', 17, 2, '', 0, 0, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroidered yarn, creating a sculptural effect. The back i'),
(5, 'Yellow gold necklace with Interlocking G', 16, 2, '', 0, 0, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroidered yarn, creating a sculptural effect. The back i'),
(6, 'Round-frame sunglasses', 11, 2, '', 0, 0, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroidered yarn, creating a sculptural effect. The back i'),
(7, 'G-Timeless watch, 40mm', 12, 2, '', 0, 0, '2020-11-20 14:02:53', 'This exceptional piece channels the collection\'s reengineering of corporate dress codes, with a deconstructed version of the traditional suit jacket. Tailored from wool twill in a regular fit, it is broken up into pieces and reassembled with embroidered yarn, creating a sculptural effect. The back i');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating`
--

CREATE TABLE `rating` (
  `idRating` int(11) NOT NULL COMMENT 'id rating',
  `points` tinyint(4) NOT NULL COMMENT 'points rating',
  `idProduct` int(11) NOT NULL COMMENT 'id Product',
  `idUser` int(11) NOT NULL COMMENT 'id user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report`
--

CREATE TABLE `report` (
  `idReport` int(11) NOT NULL COMMENT 'Mã report',
  `date` datetime NOT NULL COMMENT 'Ngày xuất report',
  `link` varchar(150) NOT NULL COMMENT 'link report'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL COMMENT 'id role',
  `level` varchar(20) NOT NULL COMMENT 'Chức vụ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`idRole`, `level`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `fullName` varchar(50) DEFAULT NULL COMMENT 'Tên khách hàng',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email',
  `degree` varchar(100) DEFAULT NULL COMMENT 'Địa chỉ',
  `phoneNumber` varchar(15) DEFAULT NULL COMMENT 'Số điện thoại',
  `dateOfBirth` date NOT NULL COMMENT 'Ngày sinh',
  `username` varchar(50) NOT NULL COMMENT 'tài khoản',
  `password` varchar(30) NOT NULL COMMENT 'mật khẩu',
  `idRole` int(11) NOT NULL COMMENT 'id Role'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`idUser`, `fullName`, `email`, `degree`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idRole`) VALUES
(1, 'Nguyễn Trà Thanh Huy', 'huytra264@gmail.com', 'Việt Nam', '0704633073', '2001-04-26', 'thanhhuy264', '778899', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`idBill`),
  ADD KEY `FK_bill_user` (`idUser`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`idBillDetails`),
  ADD KEY `FK_billdetail_bill` (`idBill`),
  ADD KEY `FK_billdetail_productdetail` (`idProductDetail`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`idThuongHieu`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`),
  ADD KEY `FK_category_groupproduct` (`idGroupProduct`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `FK_comment_products` (`idProduct`);

--
-- Chỉ mục cho bảng `groupproduct`
--
ALTER TABLE `groupproduct`
  ADD PRIMARY KEY (`idGroupProduct`);

--
-- Chỉ mục cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`idProductDetail`),
  ADD KEY `FK_productdetail_products` (`idProduct`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `FK_products_category` (`idCategory`),
  ADD KEY `FK_products_brand` (`idBrand`);

--
-- Chỉ mục cho bảng `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`idRating`),
  ADD KEY `FK_rating_user` (`idUser`);

--
-- Chỉ mục cho bảng `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`idReport`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `FK_user_role` (`idRole`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `idBill` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hóa đơn';

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `idBillDetails` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã chi tiết hóa đơn';

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `idThuongHieu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã thương hiệu', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã loại sản phẩm', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id comment';

--
-- AUTO_INCREMENT cho bảng `groupproduct`
--
ALTER TABLE `groupproduct`
  MODIFY `idGroupProduct` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã nhóm sản phẩm', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `idProductDetail` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id Product Detail', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `rating`
--
ALTER TABLE `rating`
  MODIFY `idRating` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id rating';

--
-- AUTO_INCREMENT cho bảng `report`
--
ALTER TABLE `report`
  MODIFY `idReport` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã report';

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `idRole` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id role', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã khách hàng', AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `FK_billdetail_bill` FOREIGN KEY (`idBill`) REFERENCES `bill` (`idBill`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_billdetail_productdetail` FOREIGN KEY (`idProductDetail`) REFERENCES `productdetail` (`idProductDetail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_category_groupproduct` FOREIGN KEY (`idGroupProduct`) REFERENCES `groupproduct` (`idGroupProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`),
  ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`idComment`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  ADD CONSTRAINT `FK_productdetail_products` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_brand` FOREIGN KEY (`idBrand`) REFERENCES `brand` (`idThuongHieu`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_rating_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

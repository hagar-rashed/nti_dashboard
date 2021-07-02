-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2021 at 11:22 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nti_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default_brand.png',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=>not active , 1=>active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Samsung', 'default_brand.png', 1, '2021-06-23 07:56:18', '2021-06-23 07:56:18'),
(2, 'Apple', 'default_brand.png', 1, '2021-06-23 07:56:18', '2021-06-23 07:56:18'),
(3, 'Canon', 'default_brand.png', 1, '2021-06-23 07:56:18', '2021-06-23 07:56:18'),
(4, 'Sony', 'default_brand.png', 1, '2021-06-23 07:56:18', '2021-06-23 07:56:18'),
(5, 'LG', 'default_brand.png', 1, '2021-06-23 07:56:35', '2021-06-23 07:56:35'),
(6, 'Lenovo', 'default_brand.png', 1, '2021-06-23 08:00:41', '2021-06-23 08:00:41'),
(7, 'DELL', 'default_brand.png', 1, '2021-06-23 08:00:41', '2021-06-23 08:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default_categories.png',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active , 0=>not active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'default_categories.png', 1, '2021-06-23 07:04:35', '2021-06-23 07:04:35'),
(2, 'Health & Beauty', 'default_categories.png', 1, '2021-06-23 07:04:35', '2021-06-23 07:04:35'),
(3, 'Sports', 'default_categories.png', 1, '2021-06-23 07:04:35', '2021-06-23 07:04:35'),
(4, 'Supermarket', 'default_categories.png', 1, '2021-06-23 07:45:05', '2021-06-23 07:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0->available , 1->un_available',
  `price` decimal(8,2) UNSIGNED NOT NULL,
  `quantity` int(5) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `code`, `status`, `price`, `quantity`, `brand_id`, `subcategory_id`, `created_at`, `updated_at`) VALUES
(1, 'LG TV ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\n', '12345', 1, '15000.00', 10, 5, 1, '2021-06-23 07:57:28', '2021-06-23 07:58:20'),
(2, 'Samsung TV', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\n', '45235', 1, '16000.00', 5, 1, 1, '2021-06-23 07:57:28', '2021-06-23 07:58:25'),
(3, 'Sony TV', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text eve\r\n\r\n', '12385', 1, '11000.00', 4, 4, 1, '2021-06-23 08:01:12', '2021-06-23 08:01:12'),
(4, 'Camera Cannon', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown prinLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\n\r\n\r\n', '23176', 1, '10000.00', 2, 3, 3, '2021-06-23 08:01:12', '2021-06-23 08:01:12'),
(5, 'Samsung Camera', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\n', '99657', 1, '13000.00', 10, 1, 3, '2021-06-23 08:01:12', '2021-06-23 08:01:12'),
(6, 'Lenovo PC', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\n', '23152', 1, '5600.00', 2, 6, 2, '2021-06-23 08:04:28', '2021-06-23 08:18:24'),
(7, 'Dell PC', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\n', '', 1, '16600.00', 3, 7, 2, '2021-06-23 08:04:28', '2021-06-23 08:18:27'),
(8, 'shampo', 'mation\r\nPrivacy Policy\r\nTerms & Conditions\r\nCustomer Service\r\nReturn Policy\r\nQuick Links\r\nSupport Center\r\nTerm & Conditions\r\nShipping\r\nPrivacy Policy\r\nHelp\r\nFAQS\r\nContact Us\r\n', '21152', 1, '250.00', 6, NULL, 4, '2021-06-23 08:06:25', '2021-06-23 08:18:30'),
(9, 'Balsm', 'mation\r\nPrivacy Policy\r\nTerms & Conditions\r\nCustomer Service\r\nReturn Policy\r\nQuick Links\r\nSupport Center\r\nTerm & Conditions\r\nShipping\r\nPrivacy Policy\r\nHelp\r\nFAQS\r\nContact Us\r\nmation\r\nPrivacy Policy\r\nTerms & Conditions\r\nCustomer Service\r\nReturn Policy\r\nQuick Links\r\nSupport Center\r\nTerm & Conditions\r\nShipping\r\nPrivacy Policy\r\nHelp\r\nFAQS\r\nContact Us\r\n', '75325', 1, '60.00', 2, NULL, 4, '2021-06-23 08:06:25', '2021-06-23 08:18:35'),
(10, 'Tshirt', 'Tishrt Details', '51511', 1, '150.00', 55, NULL, 6, '2021-06-23 12:29:29', '2021-06-23 12:29:40'),
(17, 'Galal husseny', 'sdasdasd', '64395', 0, '250.00', 2, 7, 6, '2021-06-27 13:09:33', '2021-06-27 13:09:33'),
(18, 'test', 'hh', '33857', 1, '3445.00', 2, 2, 3, '2021-06-27 13:13:49', '2021-06-27 13:13:49'),
(19, 'test test Rs', 'ff', '12457', 1, '250.00', 2, 2, 3, '2021-06-27 13:14:22', '2021-06-27 13:14:22'),
(21, 'last id', 'ffff', '13222', 0, '250.00', 2, 2, 3, '2021-06-27 13:27:44', '2021-06-27 13:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `image` varchar(255) NOT NULL DEFAULT 'image_default.png',
  `primary_image` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>sec,1=>primary',
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`image`, `primary_image`, `product_id`) VALUES
('1.png', 1, 1),
('10.png', 0, 1),
('11.png', 0, 2),
('12.png', 0, 3),
('13.png', 0, 4),
('14.png', 0, 1),
('15.png', 0, 1),
('1624800464.png', 1, 21),
('2.png', 1, 2),
('3.png', 1, 3),
('4.png', 1, 4),
('5.png', 1, 5),
('6.png', 1, 6),
('7.png', 1, 7),
('8.png', 1, 8),
('9.png', 1, 9),
('9.png', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default_sub.png',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1=>active ,0=>not active',
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `image`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'TV', 'default_sub.png', 1, 1, '2021-06-23 07:16:02', '2021-06-23 07:16:02'),
(2, 'PC', 'default_sub.png', 1, 1, '2021-06-23 07:16:02', '2021-06-23 07:16:02'),
(3, 'Camera', 'default_sub.png', 1, 1, '2021-06-23 07:16:02', '2021-06-23 07:16:02'),
(4, 'Hair Care', 'default_sub.png', 1, 2, '2021-06-23 07:16:02', '2021-06-23 07:16:02'),
(5, 'Skin Care', 'default_sub.png', 1, 2, '2021-06-23 07:16:02', '2021-06-23 07:16:02'),
(6, 'Men\'s SportsWear', 'default_sub.png', 1, 3, '2021-06-23 07:16:02', '2021-06-23 07:16:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`,`code`),
  ADD KEY `brands_FK` (`brand_id`),
  ADD KEY `subcategories_FK` (`subcategory_id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`image`,`product_id`),
  ADD KEY `products_images_FK` (`product_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_FK` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brands_products_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subcats_products_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `products_images_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `sub_categories_cate_id_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

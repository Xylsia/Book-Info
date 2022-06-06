-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 04:40 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book-info`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(36) NOT NULL,
  `last_name` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Joanne Kathleen', 'Rowling'),
(2, 'Haruki', 'Murakami'),
(3, 'Matthew', 'Skelton'),
(4, 'Callie', 'Bates'),
(5, 'Tsugumi', 'Ohba'),
(6, 'Hiromu', 'Arakawa'),
(7, 'John Ronald Reuel', 'Tolkien');

-- --------------------------------------------------------

--
-- Table structure for table `author_book`
--

CREATE TABLE `author_book` (
  `author_book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author_book`
--

INSERT INTO `author_book` (`author_book_id`, `author_id`, `book_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 5, 10),
(11, 6, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 4, 15),
(16, 3, 16),
(17, 7, 17),
(18, 7, 18),
(19, 7, 19);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `isbn` varchar(36) NOT NULL,
  `publication_year` year(4) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `content`, `isbn`, `publication_year`, `publisher_id`, `url`) VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '123-456-789', 1997, 3, '../img/book.jpg'),
(2, 'Harry Potter and the Chamber of Secrets', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '987-654-321', 1998, 3, '../img/book.jpg'),
(3, 'Harry Potter and the Prisoner of Azkaban', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '123-123-123', 1999, 3, '../img/book.jpg'),
(4, 'Harry Potter and the Goblet of Fire', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '456-456-456', 2000, 3, '../img/book.jpg'),
(5, 'Harry Potter and the Order of the Phoenix', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '789-789-789', 2003, 3, '../img/book.jpg'),
(6, 'Harry Potter and the Half-Blood Prince', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '135-135-135', 2005, 3, '../img/book.jpg'),
(7, 'Harry Potter and the Deathly Hallows', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '357-357-357', 2007, 3, '../img/book.jpg'),
(8, 'Fantastic Beasts and Where to find Them', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '129-129-129', 2016, 8, '../img/book.jpg'),
(9, 'Fantastic Beasts and the Crimes of Grinderlwald', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '325-325-325', 2018, 8, '../img/book.jpg'),
(10, 'Death Note', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '111-111-111', 2009, 2, '../img/book.jpg'),
(11, 'Fullmetal Alchemist', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '222-222-222', 2003, 2, '../img/book.jpg'),
(12, 'Kafka on the Shore', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '333-333-333', 1997, 1, '../img/book.jpg'),
(13, 'Norwegian Wood', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '444-444-444', 2000, 1, '../img/book.jpg'),
(14, 'After The Quake', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '555-555-555', 2005, 1, '../img/book.jpg'),
(15, 'The Waking Land', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '777-777-77', 2010, 4, '../img/book.jpg'),
(16, 'Endymion Spring', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '888-888-888', 2002, 6, '../img/book.jpg'),
(17, 'Lord of the Rings: The Fellowship of the Ring', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '997-997-997', 1956, 5, '../img/book.jpg'),
(18, 'Lord of the Rings: The Two Towers', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '154-154-154', 1958, 5, '../img/book.jpg'),
(19, 'Lord of the Rings: The Return of the King', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus vitae enim eu tempus. Etiam feugiat vestibulum arcu. Nullam augue nisi, egestas et nulla vel, scelerisque accumsan tortor. Fusce euismod id nibh in lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lorem ligula, facilisis quis eleifend vitae, aliquam ornare ex. Phasellus pellentesque justo et tortor mattis, id condimentum ligula blandit. Integer ac suscipit mauris. Vestibulum tellus mi, ultrices at libero id, accumsan mattis dui. Sed lobortis pretium justo sed consectetur. Sed et viverra tortor. ', '656-543-234', 1960, 5, '../img/book.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` enum('fantasy','abstract','thriller','modern','manga','education','biography','historical','fiction','superpower','mecha','scifi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'fantasy'),
(2, 'abstract'),
(3, 'thriller'),
(4, 'modern'),
(5, 'manga'),
(6, 'education'),
(7, 'biography'),
(8, 'historical'),
(9, 'fiction'),
(10, 'superpower'),
(11, 'mecha'),
(12, 'scifi');

-- --------------------------------------------------------

--
-- Table structure for table `category_book`
--

CREATE TABLE `category_book` (
  `category_book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_book`
--

INSERT INTO `category_book` (`category_book_id`, `category_id`, `book_id`) VALUES
(1, 1, 1),
(2, 9, 1),
(3, 10, 1),
(4, 1, 2),
(5, 9, 2),
(6, 10, 2),
(7, 2, 3),
(8, 3, 3),
(9, 4, 4),
(10, 5, 4),
(11, 6, 4),
(12, 7, 5),
(13, 8, 5),
(14, 9, 5),
(15, 10, 6),
(16, 11, 6),
(17, 12, 7),
(18, 1, 7),
(19, 2, 8),
(20, 3, 8),
(21, 3, 9),
(22, 4, 9),
(23, 5, 9),
(24, 9, 10),
(25, 12, 10),
(26, 1, 11),
(27, 2, 11),
(28, 3, 12),
(29, 4, 12),
(30, 5, 13),
(31, 6, 13),
(32, 7, 14),
(33, 8, 14),
(34, 9, 15),
(35, 10, 15),
(36, 11, 16),
(37, 12, 16),
(38, 3, 17),
(39, 5, 17),
(40, 8, 18),
(41, 10, 18),
(42, 11, 18),
(43, 12, 19),
(44, 6, 19),
(45, 7, 19);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorites_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorites_id`, `user_id`, `book_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(23, 2, 10),
(11, 2, 11),
(12, 2, 17),
(13, 2, 18),
(14, 2, 19);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `publisher_id` int(11) NOT NULL,
  `name` enum('vintage','viz media','bloomsbury','hodder','vulkan','laguna','delphi','little brown') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `name`) VALUES
(1, 'vintage'),
(2, 'viz media'),
(3, 'bloomsbury'),
(4, 'hodder'),
(5, 'vulkan'),
(6, 'laguna'),
(7, 'delphi'),
(8, 'little brown');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `email` varchar(36) NOT NULL,
  `user_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `user_type_id`) VALUES
(1, 'johndoe', 'johndoe', 'johndoe@mail.com', 1),
(2, 'janedoe', 'janedoe', 'janedoe@mail.com', 1),
(3, 'admin', 'admin', 'admin@mail.com', 2),
(4, 'superadmin', 'superadmin', 'superadmin@mail.com', 3),
(5, 'developer', 'developer', 'developer@mail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int(11) NOT NULL,
  `type` enum('user','admin','superadmin','developer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `type`) VALUES
(1, 'user'),
(2, 'admin'),
(3, 'superadmin'),
(4, 'developer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`author_book_id`),
  ADD KEY `fk_author_book_book` (`book_id`),
  ADD KEY `fk_author_book_author` (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_book_publisher` (`publisher_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_book`
--
ALTER TABLE `category_book`
  ADD PRIMARY KEY (`category_book_id`),
  ADD KEY `fk_category_book_category` (`category_id`),
  ADD KEY `fk_category_book_book` (`book_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorites_id`),
  ADD UNIQUE KEY `uq_favorites` (`user_id`,`book_id`),
  ADD KEY `fk_favorite_book` (`book_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_user_type` (`user_type_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `author_book`
--
ALTER TABLE `author_book`
  MODIFY `author_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_book`
--
ALTER TABLE `category_book`
  MODIFY `category_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorites_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author_book`
--
ALTER TABLE `author_book`
  ADD CONSTRAINT `fk_author_book_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_author_book_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_book_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_book`
--
ALTER TABLE `category_book`
  ADD CONSTRAINT `fk_category_book_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_book_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `fk_favorite_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_favorite_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

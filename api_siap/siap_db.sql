-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2020 at 06:01 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siap_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nama` varchar(75) COLLATE latin1_general_ci NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tahun_ajaran` char(4) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id_matkul`, `nama_matkul`, `tahun_ajaran`) VALUES
(1, 'Analisis dan Desain Sistem Informasi', ''),
(2, 'Pemrograman I', '');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `npm` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `id_nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`npm`, `id_matkul`, `nilai`, `id_nilai`) VALUES
(1164059, 1, 93, 178),
(1174020, 1, 84, 179),
(1174021, 1, 76, 180),
(1174022, 1, 89, 181),
(1174023, 1, 77, 182),
(1174024, 1, 92, 183),
(1174025, 1, 72, 184),
(1174026, 1, 72, 185),
(1174027, 1, 85, 186),
(1174035, 1, 81, 187),
(1174040, 1, 88, 188),
(1174045, 1, 83, 189),
(1174050, 1, 96, 190),
(1194001, 1, 71, 191),
(1194002, 1, 87, 192),
(1194003, 1, 92, 193),
(1194004, 1, 72, 194),
(1194005, 1, 88, 195),
(1194006, 1, 75, 196),
(1194007, 1, 94, 197),
(1194008, 1, 73, 198),
(1194010, 1, 96, 199),
(1194011, 1, 99, 200),
(1194012, 1, 83, 201),
(1194013, 1, 71, 202),
(1194014, 1, 88, 203),
(1194015, 1, 81, 204),
(1194016, 1, 84, 205),
(1194017, 1, 89, 206),
(1194018, 1, 72, 207),
(1194019, 1, 90, 208),
(1194020, 1, 82, 209),
(1194021, 1, 82, 210),
(1194023, 1, 82, 211),
(1194024, 1, 71, 212),
(1194025, 1, 77, 213),
(1194026, 1, 74, 214),
(1194027, 1, 81, 215),
(1194028, 1, 79, 216),
(1194029, 1, 80, 217),
(1194030, 1, 71, 218),
(1194031, 1, 99, 219),
(1194034, 1, 80, 220),
(1194036, 1, 89, 221),
(1194038, 1, 83, 222),
(1194039, 1, 79, 223),
(1194040, 1, 79, 224),
(1194041, 1, 75, 225),
(1194042, 1, 91, 226),
(1194044, 1, 98, 227),
(1194045, 1, 89, 228),
(1194046, 1, 87, 229),
(1194047, 1, 88, 230),
(1194048, 1, 81, 231),
(1194049, 1, 86, 232),
(1194050, 1, 95, 233),
(1194052, 1, 79, 234),
(1194053, 1, 82, 235),
(1194054, 1, 71, 236),
(1194055, 1, 81, 237),
(1194056, 1, 89, 238),
(1194057, 1, 96, 239),
(1194058, 1, 72, 240),
(1194059, 1, 84, 241),
(1194060, 1, 77, 242),
(1194061, 1, 79, 243),
(1194062, 1, 88, 244),
(1194063, 1, 74, 245),
(1194064, 1, 76, 246),
(1194065, 1, 90, 247),
(1194066, 1, 80, 248),
(1194068, 1, 87, 249),
(1194069, 1, 71, 250),
(1194070, 1, 92, 251),
(1234567, 1, 84, 252),
(7654321, 1, 77, 253),
(1164059, 2, 92, 254),
(1174020, 2, 73, 255),
(1174021, 2, 89, 256),
(1174022, 2, 76, 257),
(1174023, 2, 84, 258),
(1174024, 2, 78, 259),
(1174025, 2, 90, 260),
(1174026, 2, 80, 261),
(1174027, 2, 87, 262),
(1174035, 2, 74, 263),
(1174040, 2, 90, 264),
(1174045, 2, 77, 265),
(1174050, 2, 92, 266),
(1194001, 2, 98, 267),
(1194002, 2, 73, 268),
(1194003, 2, 84, 269),
(1194004, 2, 99, 270),
(1194005, 2, 76, 271),
(1194006, 2, 78, 272),
(1194007, 2, 79, 273),
(1194008, 2, 89, 274),
(1194010, 2, 86, 275),
(1194011, 2, 78, 276),
(1194012, 2, 84, 277),
(1194013, 2, 92, 278),
(1194014, 2, 95, 279),
(1194015, 2, 79, 280),
(1194016, 2, 82, 281),
(1194017, 2, 70, 282),
(1194018, 2, 81, 283),
(1194019, 2, 78, 284),
(1194020, 2, 73, 285),
(1194021, 2, 92, 286),
(1194023, 2, 95, 287),
(1194024, 2, 90, 288),
(1194025, 2, 75, 289),
(1194026, 2, 74, 290),
(1194027, 2, 85, 291),
(1194028, 2, 71, 292),
(1194029, 2, 88, 293),
(1194030, 2, 83, 294),
(1194031, 2, 90, 295),
(1194034, 2, 92, 296),
(1194036, 2, 72, 297),
(1194038, 2, 97, 298),
(1194039, 2, 95, 299),
(1194040, 2, 70, 300),
(1194041, 2, 95, 301),
(1194042, 2, 70, 302),
(1194044, 2, 91, 303),
(1194045, 2, 73, 304),
(1194046, 2, 90, 305),
(1194047, 2, 71, 306),
(1194048, 2, 91, 307),
(1194049, 2, 84, 308),
(1194050, 2, 93, 309),
(1194052, 2, 78, 310),
(1194053, 2, 77, 311),
(1194054, 2, 85, 312),
(1194055, 2, 80, 313),
(1194056, 2, 74, 314),
(1194057, 2, 98, 315),
(1194058, 2, 86, 316),
(1194059, 2, 91, 317),
(1194060, 2, 70, 318),
(1194061, 2, 85, 319),
(1194062, 2, 88, 320),
(1194063, 2, 97, 321),
(1194064, 2, 78, 322),
(1194065, 2, 90, 323),
(1194066, 2, 92, 324),
(1194068, 2, 93, 325),
(1194069, 2, 99, 326),
(1194070, 2, 92, 327),
(1234567, 2, 73, 328),
(7654321, 2, 96, 329);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

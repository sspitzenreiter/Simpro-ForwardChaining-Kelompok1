-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jun 2020 pada 02.51
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpro`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `nidn` char(16) NOT NULL,
  `nama` varchar(90) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `prodi` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`nidn`, `nama`, `jenis_kelamin`, `no_telp`, `prodi`) VALUES
('3217061702990009', 'Luthfi Admin', 'L', '087738406127', '14'),
('3217061702990010', 'Luthfi D3', 'L', '087738406127', '13');

--
-- Trigger `admin`
--
DELIMITER $$
CREATE TRIGGER `user_add_admin` AFTER INSERT ON `admin` FOR EACH ROW BEGIN
INSERT INTO app_simpro.user VALUES(new.nidn, new.nidn, 'A');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_delete_admin` AFTER DELETE ON `admin` FOR EACH ROW BEGIN
DELETE FROM app_simpro.user WHERE id_user = old.nidn;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_key`
--

CREATE TABLE `auth_key` (
  `token` varchar(190) NOT NULL DEFAULT '',
  `id_user` varchar(30) DEFAULT '',
  `type` varchar(15) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbingan`
--

CREATE TABLE `bimbingan` (
  `id_bimbingan` int(24) NOT NULL,
  `tgl_bimbingan` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `id_proyek` int(16) NOT NULL,
  `nilai_bimbingan` int(100) NOT NULL DEFAULT 0,
  `id_kegiatan_progress` int(11) DEFAULT NULL,
  `file_laporan_partial` varchar(250) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bimbingan`
--

INSERT INTO `bimbingan` (`id_bimbingan`, `tgl_bimbingan`, `keterangan`, `catatan`, `id_proyek`, `nilai_bimbingan`, `id_kegiatan_progress`, `file_laporan_partial`, `created_date`, `last_update`) VALUES
(22, '2020-04-02', NULL, 'setrip|Gak jadi deh, pasaa|S|SA|Gud', 40, 70, 15, '1234567_bimbingan_4015_1|1234567_bimbingan_4015_2|1234567_bimbingan_4015_3|1234567_bimbingan_4015_4|1234567_bimbingan_4015_5', '2020-04-02 13:02:21', '2020-05-23 03:43:21'),
(23, '2020-04-04', NULL, 'silahkan lanjutkan ke bab berikutnya', 42, 90, 13, '1194059_bimbingan_4213_1|1194059_bimbingan_4213_2|1194059_bimbingan_4213_3', '2020-04-04 07:27:52', '2020-05-23 03:43:21'),
(24, '2020-04-05', NULL, '', 49, 0, 13, '1194030_bimbingan_4913_1', '2020-04-05 07:21:42', '2020-05-23 03:43:21'),
(25, '2020-04-06', NULL, 'pada paragraf ketiga tolong di ganti kata warga pada kalimat \"membuat warga perguruan tinggi\" kurang cocok, dan silahkan lanjutkan pada bab berikutnya.', 27, 95, 13, '1194055_bimbingan_2713_1|1194055_bimbingan_2713_2', '2020-04-06 08:41:39', '2020-05-23 03:43:21'),
(26, '2020-04-06', NULL, 'deskripsi aplikasinya belum lengkap, coba cari contoh paparan aplikasi serupa di internet sebagai referensinya', 39, 85, 13, '1194040_bimbingan_3913_1', '2020-04-06 10:16:39', '2020-05-23 03:43:21'),
(27, '2020-04-06', NULL, 'penjelasan belum lengkap, lengkapi ! cari contoh di internet', 38, 80, 13, '1194041_bimbingan_3813_1', '2020-04-06 10:21:11', '2020-05-23 03:43:21'),
(28, '2020-04-06', NULL, 'latar belakang kurang detail, cari contoh di internet', 39, 80, 14, '1194040_bimbingan_3914_1', '2020-04-06 10:24:58', '2020-05-23 03:43:21'),
(29, '2020-04-06', NULL, 'tema judul\r\n', 31, 85, 13, '1194026_bimbingan_3113_1', '2020-04-06 10:41:17', '2020-05-23 03:43:21'),
(30, '2020-04-06', NULL, 'harusnya ttg judul', 37, 85, 13, '1194061_bimbingan_3713_1', '2020-04-06 11:41:51', '2020-05-23 03:43:21'),
(31, '2020-04-06', NULL, '', 45, 0, 13, '1194062_bimbingan_4513_1', '2020-04-06 12:28:55', '2020-05-23 03:43:21'),
(32, '2020-04-06', NULL, 'abstrak dan uraian permasalahan perbaiki', 25, 85, 14, '1194021_bimbingan_2514_11194021_bimbingan_2514_1|1194021_bimbingan_2514_2|', '2020-04-06 14:37:06', '2020-05-23 03:43:21'),
(33, '2020-04-06', NULL, 'rumusan masalah perbaiki :\nfokus pada kegiatan \'menganalisis\'', 25, 85, 14, '1194003_bimbingan_2514_11194021_bimbingan_2514_11194003_bimbingan_2514_11194021_bimbingan_2514_1|1194003_bimbingan_2514_2', '2020-04-06 14:37:14', '2020-05-23 03:43:21'),
(35, '2020-04-06', NULL, '', 31, 85, 14, '1194026_bimbingan_3114_1', '2020-04-06 15:14:15', '2020-05-23 03:43:21'),
(36, '2020-04-07', NULL, 'laporan tidak ditemukan', 35, 50, 13, '1194057_bimbingan_3513_11194057_bimbingan_3513_11194057_bimbingan_3513_1|', '2020-04-07 05:27:38', '2020-05-23 03:43:21'),
(37, '2020-04-07', NULL, '', 31, 80, 15, '1194026_bimbingan_3115_1', '2020-04-07 06:27:25', '2020-05-23 03:43:21'),
(38, '2020-04-07', NULL, 'Supaya tidak menakutkan dan kesannya terlalu formal maka saya meminta ijin kepada anda menggunakan Bahasa non formal tetapi berbobot salaam bimbingan dengan saya.\n\nDeskripsi aplikasinya oke sudah saya baca, mudah mudahan saja loh bisa bertanggung jawab apa yang loh jelaskan disitu gaees, gue pantau dan kalau gak sesuai kedepannya apa yang loh tulis sekarang hubungan kita berakhir sebagai pembimbing, disaat loh mengajukan sidang lho and gue ..goodbye, jadi sebagai tim project pertanggung jawabkan setiap kalimat yang loh tulis disini dan gw akan memantaunya\n\nLanjutkan ke bab selanjutnya dan perlu diingatkan lagi, laporan harus rapi, rata kanan, rata kiri, margin font dan seterusnya jangan seenak mu dalam upload laporan, hari ini gw maafin, kalua besok masih sama, jangankan maaf, nilai lho langsung 0 dan tidak akan guea baca.\n\nDalam menulis laporan ya gaes, baca lagi pedomannya, misalnya di bab 1 itu apa saja point-pointnya atau kerangka tulisannya begitu juga bab 2, 3 dan seterusnya, jangan merubah format laporan selain yang tertera di panduan laporan, gw gak mau banyak bacot intinya laporan loh saya terima dan segera perbaiki dan lengkapi lagi sampai bab 2.\n', 30, 100, 13, '1194031_bimbingan_3013_1', '2020-04-07 06:46:58', '2020-05-23 03:43:21'),
(39, '2020-04-07', NULL, 'Supaya tidak menakutkan dan kesannya terlalu formal maka saya meminta ijin kepada anda menggunakan Bahasa non formal tetapi berbobot salaam bimbingan dengan saya.\n\nDeskripsi aplikasinya oke sudah saya baca, mudah mudahan saja loh bisa bertanggung jawab apa yang loh jelaskan disitu gaees, gue pantau dan kalau gak sesuai kedepannya apa yang loh tulis sekarang hubungan kita berakhir sebagai pembimbing, disaat loh mengajukan sidang lho and gue ..goodbye, jadi sebagai tim project pertanggung jawabkan setiap kalimat yang loh tulis disini dan gw akan memantaunya\n\nLanjutkan ke bab selanjutnya dan perlu diingatkan lagi, laporan harus rapi, rata kanan, rata kiri, margin font dan seterusnya jangan seenak mu dalam upload laporan, hari ini gw maafin, kalua besok masih sama, jangankan maaf, nilai lho langsung 0 dan tidak akan guea baca.\n\nDalam menulis laporan ya gaes, baca lagi pedomannya, misalnya di bab 1 itu apa saja point-pointnya atau kerangka tulisannya begitu juga bab 2, 3 dan seterusnya, jangan merubah format laporan selain yang tertera di panduan laporan, gw gak mau banyak bacot intinya laporan loh saya terima dan segera perbaiki dan lengkapi lagi sampai bab 2.\n\nkelompok kalian gaes laporannya lumayan rapi dan gak bikin sakit mata saya, curiga kamu ini sudah banyak bergaul dengan para senior atau alumni dalam membuat laporan, gw suka gaya loh, lanjutkan', 29, 100, 13, '1194014_bimbingan_2913_1', '2020-04-07 07:26:23', '2020-05-23 03:43:21'),
(40, '2020-04-08', NULL, '', 47, 0, 13, '1194028_bimbingan_4713_1', '2020-04-08 03:49:25', '2020-05-23 03:43:21'),
(41, '2020-04-08', NULL, '80', 31, 80, 16, '1194026_bimbingan_3116_1', '2020-04-08 05:26:21', '2020-05-23 03:43:21'),
(42, '2020-04-08', NULL, 'Cukup', 34, 98, 13, '1194006_bimbingan_3413_1', '2020-04-08 06:54:41', '2020-05-23 03:43:21'),
(43, '2020-04-08', NULL, 'Didetailkan dan dijawab pada tujuan', 34, 98, 14, '1194006_bimbingan_3414_1', '2020-04-08 06:58:49', '2020-05-23 03:43:21'),
(44, '2020-04-08', NULL, 'Idem Identifikasi ', 34, 98, 15, '1194006_bimbingan_3415_1', '2020-04-08 07:01:27', '2020-05-23 03:43:21'),
(45, '2020-04-08', NULL, 'Cukup', 34, 98, 16, '1194006_bimbingan_3416_1', '2020-04-08 07:05:22', '2020-05-23 03:43:21'),
(46, '2020-04-08', NULL, 'Perlu tambahan referensi', 34, 98, 17, '1194006_bimbingan_3417_1', '2020-04-08 07:06:37', '2020-05-23 03:43:21'),
(47, '2020-04-08', NULL, 'lanjutkan', 48, 75, 13, '1194018_bimbingan_4813_1|1194017_bimbingan_4813_2', '2020-04-08 09:48:23', '2020-05-23 03:43:21'),
(48, '2020-04-08', NULL, 'identifikai nasalahnya, anda harusnya yg menganalisa, bukan kesimpulan akhir', 37, 75, 14, '1194061_bimbingan_3714_1|', '2020-04-08 10:19:54', '2020-05-23 03:43:21'),
(49, '2020-04-08', NULL, 'text justify', 37, 75, 15, '1194061_bimbingan_3715_1|', '2020-04-08 10:20:27', '2020-05-23 03:43:21'),
(50, '2020-04-08', NULL, 'batasan yg akan dianalisa?', 37, 75, 16, '1194061_bimbingan_3716_1|', '2020-04-08 10:21:20', '2020-05-23 03:43:21'),
(51, '2020-04-08', NULL, 'format tulisan ikuti panduan', 37, 75, 17, '1194061_bimbingan_3717_1|', '2020-04-08 10:22:20', '2020-05-23 03:43:21'),
(54, '2020-04-08', NULL, 'lanjutkan', 25, 85, 13, '1194021_bimbingan_2513_1', '2020-04-08 12:48:46', '2020-05-23 03:43:21'),
(55, '2020-04-08', NULL, 'project 1 difokuskan agar mahasiswa dapat menganalisis codingan dari aplikasi yang sudah jadi. \n\nberikan gambaran bahwa anda akan menganalisis source code dari aplikasi apa dan diambil dari mana, \n\ntolong perbaiki kembali, lalu bimbingan selanjutnya coba mulai menganalisis dari source code nya. \nmulai dari CRUD', 36, 85, 13, '1194052_bimbingan_3613_1', '2020-04-08 13:31:52', '2020-05-23 03:43:21'),
(56, '2020-04-08', NULL, 'project 1 anda diminta untuk menganalisis dari suatu aplikasi yang sudah jadi, \ntentukan anda akan menganalisis apa, diambil dari mana, source code nya seperti apa\nambil source code nya dan analisis\n\ntips : cari di toko buku, buku yang memberikan tahapan-tahapan pemrograman, nnt share jika sudah dapat\n', 33, 85, 13, '1194070_bimbingan_3313_1', '2020-04-08 13:47:17', '2020-05-23 03:43:21'),
(59, '2020-04-08', NULL, 'Tambahan deskripsi aplikasi :  1. Mulai dari proses awal / login, kemudian Jelaskan untuk user manajemen di lihat apakah ada beberapa level selain admin.\n2. Data Master sedikit di jelaskan juga (Master barang, master supplier)  \n3. untuk transkasi barang keluar coba apa yg terjadi apabila barang yg di keluarkan melebihi stok yg ada.  kemudian berikan penjelasan apa yg terjadinya', 50, 95, 13, '1194013_bimbingan_5013_1', '2020-04-08 15:06:37', '2020-05-23 03:43:21'),
(97, '2020-04-09', NULL, 'Sip', 40, 100, 13, '7654321_bimbingan_4013_1', '2020-04-09 12:11:02', '2020-05-23 03:43:21'),
(98, '2020-04-10', NULL, 'Tambahkan jurnal2 sebagai referensi penjelasan yg kamu tulis di latar belakang(nasional/onternasional) .Minimal 2. Jurnal yg bahas PHP dan jurnal yg bahas aplikasibsejenis', 46, 85, 13, '1194050_bimbingan_4613_1', '2020-04-10 00:07:42', '2020-05-23 03:43:21'),
(99, '2020-04-10', NULL, 'ikuti format laporan, font, rata kiri kanan,dll', 22, 75, 13, '1194025_bimbingan_2213_1', '2020-04-10 10:10:38', '2020-05-23 03:43:21'),
(100, '2020-04-10', NULL, 'harus ada kejelasan aktifitas tersebut milih siapa,pada flowchart sistem nya, perbaiki', 22, 70, 18, '1194025_bimbingan_2218_1', '2020-04-10 10:12:03', '2020-05-23 03:43:21'),
(101, '2020-04-10', NULL, 'font tidak sesuai, jangan copas. perbanyak lg mengenai pembahasan apa itu applikasi karir, dll.lanjutkan dengan flowchart. ', 26, 68, 18, '1194069_bimbingan_2618_1', '2020-04-10 12:08:36', '2020-05-23 03:43:21'),
(102, '2020-04-11', NULL, 'Harus lebih detail', 44, 98, 13, '1194016_bimbingan_4413_1', '2020-04-11 04:17:18', '2020-05-23 03:43:21'),
(103, '2020-04-11', NULL, 'Supaya tidak menakutkan dan kesannya terlalu formal maka saya meminta ijin kepada anda menggunakan Bahasa non formal tetapi berbobot salaam bimbingan dengan saya.\n\nAbstrak loh itu coyyy ampuun dah, isi abstrak itu adalah sebuah tulisan RINGKASAN/RANGKUMAN dari project yang kamu buat, syarat membuat abstrak bahasanya harus standart EYD dan terdapat SPOK (Subject + Predikat + objek dan keterangan) kalimat aktif bukan kalimat lampau / pasif atau khayalan indah loh saudara saudara, mohon diperbaiki.\n\nkemudian isi abstrak itu terdiri dari :\n1. State of the art (Definisi Ringkas Bidang Ilmu project yang kamu buat)\n2. Problem yaitu masalah loh kenapa buat project ini\n3. Metode yaitu tahapan loh bagaimana dalam membuat project loh itu, metodenya harus sesuai dengan referensi keilmuan informatika bukan buatan loh ya gaeees,\n4. Solusi yaitu menjelaskan bagaimana solusi yang didapatkan\n5. Result yaitu hasil yang di capai oleh project loh\n\nNah udah jelaskan gaees, jadi tolong baca dan baca dalam menulis karya ilmiah itu tidak segampang menulis curhatan hati loh apa lagi bukan chattingan bersama kekasih loh pada, jadi tolong serius dan baca semua referensi dalam menulis abtrak yang baik itu.\n\nkemudian perbaiki Bahasa inggris loh ampunnnnnn dahh,…gunakan tols gramerly.\n\nDeskripsi aplikasinya oke sudah say abaca, mudah mudahan asaja loh bias bertanggung jawab apa yang loh jelaskan disitu gaees, gue pantau dan kalua gak sesuai kedepannya apa yang loh tulis sekarang hubungan kita beranghir sebagai pembimbing, disaat loh mengajukan siding lho and gue ..goodbye, jadi sebagai tim project pertanggung jawabkan setiap kalimat yang loh tulis disini dan gw akan memantaunya\n\nLanjutkan ke bab selanjutnya dan perlu diingatkan lagi, laporan harus rapi, rata kanan, rata kiri, margin font dan seterusnya jangan seenak mu dalam upload laporan, hari ini gw maafin, kalua besok masih sama, jangankan maaf, nilai lho langsung 0 dan tidak akan guea baca.\n\n', 52, 100, 13, '1194048_bimbingan_5213_1', '2020-04-11 08:44:58', '2020-05-23 03:43:21'),
(104, '2020-04-11', NULL, 'Tinggal tambah referensi dari jurnal2 di latar belakang. Cari minimal 2 jurnal yg membahas aplikasi pemesanan (tiket)dan yg bahas aplikasi berbasis desktop', 28, 85, 13, '1194027_bimbingan_2813_1', '2020-04-11 14:38:29', '2020-05-23 03:43:21'),
(105, '2020-04-12', NULL, 'silahkan dilanjutkan tema bahasan selanjutnya', 27, 90, 14, '1194055_bimbingan_2714_1|1194055_bimbingan_2714_2|1194055_bimbingan_2714_3', '2020-04-11 22:24:48', '2020-05-23 03:43:21'),
(106, '2020-04-12', NULL, 'silahkan lanjutkan ke pembahasan berikutnya', 54, 90, 13, '1164059_bimbingan_5413_1|1164059_bimbingan_5413_2', '2020-04-12 04:45:21', '2020-05-23 03:43:21'),
(107, '2020-04-12', NULL, 'utk kutipan misal, \r\nhilangkan Asropudin (2013: ganti dengan [3]\r\nberlaku utk semua kutipan dan harus konsisten', 48, 75, 17, '1194018_bimbingan_4817_1', '2020-04-12 10:29:17', '2020-05-23 03:43:21'),
(108, '2020-04-12', NULL, ' ', 48, 85, 14, '1194018_bimbingan_4814_1', '2020-04-12 11:28:39', '2020-05-23 03:43:21'),
(109, '2020-04-13', NULL, 'lanjut ke bab 2', 26, 72, 24, '1194069_bimbingan_2624_1|', '2020-04-13 11:57:27', '2020-05-23 03:43:21'),
(110, '2020-04-13', NULL, 'Berikan kutipan setiap teori dan cantumkan sumbernya didaftar pustaka. Lanjutkan ke bab berikutnya! ', 25, 85, 17, '1194021_bimbingan_2517_1', '2020-04-13 14:49:32', '2020-05-23 03:43:21'),
(111, '2020-04-14', NULL, '1. Mohon dihilangkan kata-kata : kita, kami\n2. Identifikasi masalah poin2 nya di buat lebih ringkas, singkat, padat dan jelas\n   contoh : \n   Identifikasi masalah:\n   1. adanya kejadian barang yang diterima pembeli tidak sesuai spesifikasi teknis, sehingga perlu menu/modul komplen/return barang.\n  2. Perlu adanya menu kompensasi keterlambatan pengiriman barang atau ada menu yang membatalkan transaksi secara otomatis apabila penjual tidak memproses nya dalam hari yg sudah di tentukan, selain itu poin ini akan berhubungan dengan perusahaan jasa kurir bukan hanya penjual, sehingga kompensasi bisa dilakukan di penjual. \n3.  Adanya menu cross cek pembayaran ke bank yang digunakan\n4. Ada menu deskripsi barang dan proses komunikasi antara penjual dan calon pembeli, sehingga dengan adanya menu tersebut penjual dan pembeli tidak ada yang merasa dirugikan.\n\n5. point 5 di hilangkan saja', 50, 95, 14, '1194013_bimbingan_5014_1', '2020-04-14 02:39:02', '2020-05-23 03:43:21'),
(112, '2020-04-14', NULL, '1. Jelaskan Bahasa pemrogaman dan database apa yang digunakannya?\n2. Penjelasan deskripsi aplikasi lampirkan screenshoot dari aplikasi dan database nya, setiap modul/menu di jelaskan mulai dari login sampai logout (sebagai admin dan sebagai user/anggota)\n3. Apakah ada menu (master, transaksi, report,dll)?\n4. Apakah ada proses keterlambatan pengembalian ? apabila ada bagaimana proses keterlambatan pengembalian buku tersebut ?\n5. Bagaimana apabila user daftar untuk jadi anggota di dalam aplikasi tersebut? \n', 41, 90, 13, '1194054_bimbingan_4113_1|', '2020-04-14 14:21:37', '2020-05-23 03:43:21'),
(113, '2020-04-15', NULL, 'Ok, lanjut ke langkah berikutnya. \nSedikit catatan : untuk singkatan di kasih penjelasan nya\nCRUD = singkatan dari apa?\nselebihnya ok', 50, 97, 15, '1194013_bimbingan_5015_1', '2020-04-15 14:30:35', '2020-05-23 03:43:21'),
(114, '2020-04-16', NULL, 'Jangan hanya tentang pembayaran tetapi pergudangannya juga ', 55, 80, 13, '1194056_bimbingan_5513_1|1194056_bimbingan_5513_2', '2020-04-16 10:30:27', '2020-05-23 03:43:21'),
(115, '2020-04-16', NULL, 'perbaiki lg, bentuk struktur menunya. Struktur menu keseluruhan applikasi. bukan yg hanya di analisis saja', 26, 70, 20, '1194069_bimbingan_2620_1|', '2020-04-16 12:30:17', '2020-05-23 03:43:21'),
(116, '2020-04-16', NULL, 'Ok, Lanjut ke bab /sub bab berikutnya', 50, 95, 16, '1194013_bimbingan_5016_1', '2020-04-16 14:38:22', '2020-05-23 03:43:21'),
(117, '2020-04-17', NULL, '1. abstrak diperbaiki lagi (paragraf1=menguraikan masalah, paragraf2=tujuan/tools/bahasa pemrograman, parafgraf3= pekerjaan dan hasil penelitian\n2. landasan teori gunakan kutipan/citasi\n3. tambahkan nomor halaman, biar saya mudah untuk menyebutkan halaman mana yg harus dikoreksi\n4. bab III tolong dibetulin dulu, gambar nimpatulisan, saya ga bisa membacanya\n5. buat laporannya yang rapilah sesuai aturan penulisan, biar saya ngoreksinya mudah.\n6. segera perbaiki', 25, 80, 15, '1194021_bimbingan_2515_1', '2020-04-17 10:32:21', '2020-05-23 03:43:21'),
(118, '2020-04-17', NULL, 'gak mau saya baca laporanmu berantakan tidak sesuai dengan format di buku panduan proyek https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html', 30, 0, 14, '1194031_bimbingan_3014_1', '2020-04-17 11:10:48', '2020-05-23 03:43:21'),
(119, '2020-04-17', NULL, 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', 30, 0, 15, '1194031_bimbingan_3015_1', '2020-04-17 11:12:36', '2020-05-23 03:43:21'),
(120, '2020-04-17', NULL, 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', 30, 0, 16, '1194031_bimbingan_3016_1', '2020-04-17 11:18:27', '2020-05-23 03:43:21'),
(121, '2020-04-17', NULL, 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', 30, 0, 14, '1194011_bimbingan_3014_1', '2020-04-17 11:59:40', '2020-05-23 03:43:21'),
(122, '2020-04-17', NULL, 'point satu identifikasi masalah gak kelas mksdunya apa? jelaskan, emang laporan efektig yang akan kamu buatkan itu gimana??', 29, 0, 14, '1194014_bimbingan_2914_1', '2020-04-17 12:02:30', '2020-05-23 03:43:21'),
(123, '2020-04-17', NULL, 'tujuan tidak menjawab point masalah yang disampaikan', 29, 0, 15, '1194014_bimbingan_2915_1', '2020-04-17 12:02:52', '2020-05-23 03:43:21'),
(124, '2020-04-17', NULL, 'point ini ngapain di bimbingkan, gak penting', 29, 0, 16, '1194014_bimbingan_2916_1', '2020-04-17 12:03:22', '2020-05-23 03:43:21'),
(125, '2020-04-17', NULL, 'landasan teori yang ditulis itu yang dibahas pada pendahuluan, dekspsi masalah , apa teori dan jelaskan dengan rinci bukan hanya pengertiannya saja, tp penjelasan untuk medukung masalah dan tujuan masalah.', 29, 0, 17, '1194014_bimbingan_2917_1', '2020-04-17 12:03:42', '2020-05-23 03:43:21'),
(126, '2020-04-17', NULL, 'perbaiki point indentifikasi masalah pada,\nPoint satu, harus menggunakan kalimat aktif SPOK jelas, sudah berapa kali saya sampaikan, saya contohkan \n\nkemudian pada point tujuan itu menjawab dari poitn diatas itu.  harus gunakan kalimat aktif\n\n\nkemudian BAB 2 kamu itu kurang lengkap, bukan hanya pengertian aja, bab 2 itu adalah LANDASAN TEORI anda untuk menyelesaikan masalah dan tujuan yang anda paparkan pada bab 1 dan pendahuluan. jelaskan dengan menggunakan literatur yang jelas 5 tahun terakhir referensi jurnal, atau buku dan lain sebagainya kecuali blogspot dan wikipia\nTidak tersedianya fasilitas yang difungsukan untuk membedakan halaman informasi branda admin dan user', 52, 70, 14, '1194048_bimbingan_5214_1', '2020-04-17 15:04:19', '2020-05-23 03:43:21'),
(127, '2020-04-17', NULL, '1. Setiap paragraf berikan informasi darimana sumbernya. \nmisal bagian :\ne. Desain Website\nDesain website dapat menentukan kualitas sebuah website dan sangat berpengaruh terhadap penilaian pengunjung. Desain website digunakan untuk memperindah suatu situs. (1) <--sesuai dengan sumber yang tertuang dihalaman akhir.\n\n\n2. Untuk materi tambahkan terkait dengan bahasa pemrograman yang digunakan, database yang di gunakan, atau teknologi lain yang digunakan hasil dari analisis terhadap sistem tersebut  ', 50, 97, 17, '1194013_bimbingan_5017_1', '2020-04-17 15:07:19', '2020-05-23 03:43:21'),
(128, '2020-04-18', NULL, '1. sub bab 3.1 gambar nimpa tulisan, tolong dibenerin\n2. gambar 3.3 harusnya yang input username/password itu petugas, tulisan database pada simbol database ganti dengan nama databesnya\n3. tampilkan nomor halaman\n', 25, 80, 23, '1194003_bimbingan_2523_1', '2020-04-17 20:49:28', '2020-05-23 03:43:21'),
(129, '2020-04-20', NULL, 'Beberapa revisi ', 34, 100, 18, '1194006_bimbingan_3418_1', '2020-04-20 05:26:43', '2020-05-23 03:43:21'),
(130, '2020-04-20', NULL, 'Beberapa revisi', 34, 100, 19, '1194006_bimbingan_3419_1', '2020-04-20 05:38:02', '2020-05-23 03:43:21'),
(131, '2020-04-20', NULL, 'Pembahasan di Bab 1 kurang lengkap', 35, 78, 18, '1194057_bimbingan_3518_1|', '2020-04-20 06:42:27', '2020-05-23 03:43:21'),
(132, '2020-04-20', NULL, 'permsalahan fokus kepada proses CRUD dan sistem transaksional', 22, 65, 14, '1194025_bimbingan_2214_1', '2020-04-20 09:34:25', '2020-05-23 03:43:21'),
(133, '2020-04-20', NULL, 'tujuan lebih detai ke pembagian masing-masing mahasiswa mengenai CRUD dan Transaksional ', 22, 80, 15, '1194025_bimbingan_2215_1', '2020-04-20 09:34:54', '2020-05-23 03:43:21'),
(134, '2020-04-20', NULL, 'mulai dokumentasi dan break down coding sesuai dengan pembagian yg ada di file ini', 22, 88, 16, '1194025_bimbingan_2216_1', '2020-04-20 09:35:17', '2020-05-23 03:43:21'),
(135, '2020-04-20', NULL, 'lanjutkan ke bongkar coding, fokus ke menu yg dikuasi di laporan ini, harus terdiri dari proses 4 CRUD minimal dan 2 proses transaksional minimal', 22, 85, 20, '1194025_bimbingan_2220_1', '2020-04-20 09:36:04', '2020-05-23 03:43:21'),
(136, '2020-04-20', NULL, 'perbaikin tujuan, harus ada 4 fungsi CRUD dan 2 proses transaksional . tambahkan ditujuan.', 26, 72, 16, '1194069_bimbingan_2616_1|', '2020-04-20 09:55:23', '2020-05-23 03:43:21'),
(137, '2020-04-23', NULL, 'silahkan dilanjutkan tema bahasan selanjutnya', 42, 90, 14, '1194059_bimbingan_4214_1', '2020-04-23 10:20:16', '2020-05-23 03:43:21'),
(138, '2020-04-24', NULL, 'Bagus. Segera buat buku tutorialnya. Terutama Cara ambil variable Dan kirim pesannke veronika', 43, 100, 13, '1194004_bimbingan_4313_1', '2020-04-24 15:47:57', '2020-05-23 03:43:21'),
(139, '2020-04-25', NULL, 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', 30, 0, 17, '1194031_bimbingan_3017_1', '2020-04-25 08:18:36', '2020-05-23 03:43:21'),
(140, '2020-04-30', NULL, 'untuk point 2. Pencatatan peminjaman yg sekarang berjalan seperti apa?', 41, 95, 14, '1194054_bimbingan_4114_1|', '2020-04-29 21:58:26', '2020-05-23 03:43:21'),
(141, '2020-04-30', NULL, 'Tujuan disini adalah menjawab dari identifkasi  masalah, apabila identifikasi masalah ada 2 (dua) point maka tujuan nya pun ada 2(dua) point. contoh :\nIdentifikasi Masalah :\n1. Tidak efisiennya sistem peminjaman buku yang saat ini sedang berlangsung \n2. Kurang efektifnya pencatatan peminjaman dari segi waktu\nTUjuan :\n1. Membuat sistem peminjaman buku yang seperti apa agar lebih efisien\n2. membuat sistem peminjaman buku yang online agar lebih efektif.............dst dst \n', 41, 95, 15, '1194054_bimbingan_4115_1|', '2020-04-29 21:59:35', '2020-05-23 03:43:21'),
(142, '2020-05-01', NULL, 'silahkan lanjutkan ke proses selanjutnya', 27, 90, 15, '1194055_bimbingan_2715_1', '2020-05-01 01:23:28', '2020-05-23 03:43:21'),
(143, '2020-05-01', NULL, 'Silahkan lanjutkan pada bab/bahasan berikutnya', 54, 90, 14, '1164059_bimbingan_5414_1', '2020-05-01 12:18:44', '2020-05-23 03:43:21'),
(144, '2020-05-01', NULL, '3.1 Analisis Sistem\n\nAnalisis sistem merupakan tahapan atau penguraian suatu sistem informasi terhadap sistem yang berjalan untuk mengetahui segala permasalahan yang terjadi serta dengan mudah untuk merancang ke tahapan selanjutnya yaitu perancangan sistem. Analisis sistem juga bertujuan untuk mengidentifikasi permasalahan kebutuhan yang diharapkan untuk di usulkan perbaikannya juga pengembangannya. <--ini teori pindah ke bab II\n\nPada Bab ini akan dibahas mengenai, analisis kebutuhan fungsional dan analisis kebutuhan non-fungsional.   (cukup ini saja di tambah dengan analisis terhadap sistem secara modul per modul atau menu per menu fungsinya buat apa utk setiap modul dalam aplikasi mulai dari login, proses, output/report, sampai dengan logoout) sertakan dalam tampilan User Interface atau screenshoot dari aplikasi untuk mempermudah dalam menjelaskan setiap tampilan ada menu apa saja dan di jelaskan.\n(catatan nya: utk teori pindah ke bab II, jadi di sub bab ini hanya pembahasan analisis apa saja yg akan di kerjakan)', 50, 95, 18, '1194013_bimbingan_5018_1', '2020-05-01 14:17:04', '2020-05-23 03:43:21'),
(145, '2020-05-01', NULL, '- Kebutuhan non-fungsional merupakan spesifikasi kebutuhan yang dibutuhkan oleh sistem yang berkaitan dengan perangkat keras (hardware) dan perangkat lunak (software).  <-- Kata-kata yang dibutuhkan di ganti dengan \"yang digunakan\"\n\n- Kebutuhan perangkat lunak (Software) di ganti jadi perangkat lunak yang digunakan  ', 50, 95, 19, '1194013_bimbingan_5019_1', '2020-05-01 14:18:07', '2020-05-23 03:43:21'),
(146, '2020-05-02', NULL, 'jangna banyak copas temen lain. fokus apa saja yang sudah kalian kerjakan termasuk laporan error dan bagaimana penanganannya terhadap triva', 32, 100, 13, '1194010_bimbingan_3213_1', '2020-05-01 22:04:22', '2020-05-23 03:43:21'),
(147, '2020-05-02', NULL, 'perbaiki pada penulisan sumber referensi, biasanya kalimat dulu kemudian sumbernya : \nsilahkan baca ini :\nhttps://isbands.wordpress.com/2011/10/07/standard-penulisan-kutipan-dan-daftar-pustaka/', 27, 85, 17, '1194055_bimbingan_2717_1|1194055_bimbingan_2717_2|27_bimbingan_17_3', '2020-05-02 00:38:11', '2020-06-09 06:56:53'),
(148, '2020-05-03', NULL, NULL, 55, 0, 15, '1194056_bimbingan_5515_1', '2020-05-03 07:42:30', '2020-05-23 03:43:21'),
(149, '2020-05-06', NULL, 'lanjutkan', 31, 85, 17, '1194029_bimbingan_3117_1', '2020-05-06 05:51:00', '2020-05-23 03:43:21'),
(150, '2020-05-06', NULL, 'Setiap menu data master di berikan penjelasan fungsi nya', 50, 95, 20, '1194013_bimbingan_5020_1', '2020-05-06 11:14:35', '2020-05-23 03:43:21'),
(151, '2020-05-07', NULL, 'reference nya Dari mana?sitasi', 22, 70, 17, '1194025_bimbingan_2217_1', '2020-05-07 10:21:15', '2020-05-23 03:43:21'),
(152, '2020-05-08', NULL, 'silahkan lanjutkan bab/sub bahasan berikutnya', 42, 95, 17, '1194059_bimbingan_4217_1|1194059_bimbingan_4217_2', '2020-05-08 02:47:50', '2020-05-23 03:43:21'),
(153, '2020-05-10', NULL, 'sub bab 1.3 Tujuan ,\nTUjuan membalas atau menjawab dari Identifikasi masalah, apabila identifikasi masalah ada 4 poin berarti tujuan nya ada 4 poin jg, setiap poin di identifikasi masalah di jawab di tujuan', 51, 95, 14, '1194036_bimbingan_5114_1', '2020-05-10 03:05:04', '2020-05-23 03:43:21'),
(154, '2020-05-11', NULL, 'coba ditambahkan lagi, uraian tujuannya. Kalo bisa bimbingnnya per-bab utuh saja. jangan per sub-bab. Kalo ini berarti harus cantumkan bareng dengan bab Pendahuluan. jangan sepotong2', 39, 70, 15, '1194040_bimbingan_3915_1', '2020-05-10 17:33:18', '2020-05-23 03:43:21'),
(155, '2020-05-11', NULL, 'Sebaiknya kalo bimbingan, cantumkan juga dokumen utuh dari dokumen sebelumnya yang sudah dilakukan bimbingan. jangan sepotong2. saya jg harus tau apa yang sdh dikerjakan sebelumnya', 39, 80, 16, '1194040_bimbingan_3916_1', '2020-05-10 17:35:32', '2020-05-23 03:43:21'),
(156, '2020-05-12', NULL, NULL, 22, 78, 19, '1194025_bimbingan_2219_1', '2020-05-12 02:52:29', '2020-06-12 03:55:39'),
(157, '2020-05-12', NULL, NULL, 53, 0, 13, '1194024_bimbingan_5313_1', '2020-05-12 04:42:17', '2020-05-23 03:43:21'),
(158, '2020-05-13', NULL, NULL, 46, 0, 14, '1194050_bimbingan_4614_1', '2020-05-13 06:18:43', '2020-05-23 03:43:21'),
(159, '2020-05-14', NULL, 'silahkan lanjutkan bab/bahasan berikutnya', 54, 90, 17, '1164059_bimbingan_5417_1', '2020-05-14 09:07:18', '2020-05-23 03:43:21'),
(160, '2020-05-16', NULL, 'Sip', 40, 100, 14, '40bimbingan_14_1', '2020-05-16 04:47:56', '2020-05-23 03:43:21'),
(161, '2020-05-16', NULL, NULL, 48, 85, 18, '48bimbingan_18_1', '2020-05-16 06:58:08', '2020-06-10 04:36:07'),
(162, '2020-05-18', NULL, NULL, 26, 75, 13, '26_bimbingan_13_1', '2020-05-18 12:59:14', '2020-06-12 00:41:25'),
(163, '2020-05-19', NULL, 'Sip', 40, 100, 16, '40_bimbingan_16_1', '2020-05-19 06:12:09', '2020-05-23 03:43:21'),
(164, '2020-05-19', NULL, 'Sip', 40, 100, 17, '40_bimbingan_17_1', '2020-05-19 06:12:20', '2020-05-23 03:43:21'),
(165, '2020-05-19', NULL, 'qwfq', 40, 100, 18, '40_bimbingan_18_1', '2020-05-19 06:12:33', '2020-05-23 03:43:21'),
(166, '2020-05-19', NULL, 'SIp', 40, 100, 19, '40_bimbingan_19_1', '2020-05-19 06:12:44', '2020-05-23 03:43:21'),
(167, '2020-05-19', NULL, 'Sip siap draftnya', 40, 100, 20, '40_bimbingan_20_1', '2020-05-19 06:12:56', '2020-05-23 03:43:21'),
(168, '2020-05-20', NULL, NULL, 40, 0, 21, '40_bimbingan_21_1', '2020-05-19 19:44:30', '2020-05-23 03:43:21'),
(169, '2020-05-20', NULL, NULL, 46, 0, 17, '46_bimbingan_17_1', '2020-05-20 14:11:36', '2020-05-23 03:43:21'),
(171, '2020-05-21', NULL, 'ok', 86, 15, 14, '86_bimbingan_14_1|86_bimbingan_14_2', '2020-05-20 22:12:43', '2020-05-23 03:43:21'),
(172, '2020-05-21', NULL, 'afva', 86, 90, 15, '86_bimbingan_15_1|', '2020-05-20 22:19:23', '2020-05-26 15:42:24'),
(173, '2020-05-21', NULL, 'wetw', 86, 55, 16, '86_bimbingan_16_1', '2020-05-20 22:26:19', '2020-05-23 03:43:21'),
(174, '2020-05-21', NULL, 'qwfwqfq', 86, 55, 17, '86_bimbingan_17_1', '2020-05-20 22:27:01', '2020-05-23 03:43:21'),
(175, '2020-05-21', NULL, NULL, 86, 95, 18, '86_bimbingan_18_1', '2020-05-20 22:27:36', '2020-05-26 15:42:42'),
(176, '2020-05-21', NULL, NULL, 86, 80, 19, '86_bimbingan_19_1', '2020-05-20 22:27:47', '2020-05-26 15:42:57'),
(177, '2020-05-21', NULL, NULL, 86, 90, 20, '86_bimbingan_20_1', '2020-05-20 22:28:16', '2020-05-26 15:43:09'),
(179, '2020-05-22', NULL, NULL, 86, 85, 21, NULL, '2020-05-22 03:25:00', '2020-05-26 15:43:21'),
(180, '2020-05-22', NULL, NULL, 87, 100, 13, NULL, '2020-05-22 04:28:16', '2020-05-23 03:43:21'),
(181, '2020-05-22', NULL, NULL, 87, 100, 14, NULL, '2020-05-22 04:44:32', '2020-05-23 03:43:21'),
(182, '2020-05-22', NULL, NULL, 87, 100, 15, NULL, '2020-05-22 04:46:17', '2020-05-23 03:43:21'),
(183, '2020-05-22', NULL, NULL, 87, 100, 16, NULL, '2020-05-22 04:48:24', '2020-05-23 03:43:21'),
(184, '2020-05-22', NULL, NULL, 87, 100, 17, NULL, '2020-05-22 04:49:58', '2020-05-23 03:43:21'),
(185, '2020-05-22', NULL, NULL, 87, 100, 18, NULL, '2020-05-22 04:52:16', '2020-05-23 03:43:21'),
(186, '2020-05-22', NULL, NULL, 87, 100, 19, NULL, '2020-05-22 04:54:02', '2020-05-23 03:43:21'),
(187, '2020-05-22', NULL, NULL, 87, 100, 20, NULL, '2020-05-22 04:57:35', '2020-05-23 03:43:21'),
(188, '2020-05-22', NULL, NULL, 87, 100, 21, NULL, '2020-05-22 05:02:06', '2020-05-23 03:43:21'),
(189, '2020-05-22', NULL, NULL, 87, 50, 22, NULL, '2020-05-22 05:04:29', '2020-05-23 03:43:21'),
(190, '2020-05-23', NULL, NULL, 86, 90, 13, NULL, '2020-05-22 22:43:42', '2020-05-26 15:43:33'),
(191, '2020-05-25', NULL, NULL, 50, 95, 21, NULL, '2020-05-25 08:54:10', '2020-06-09 01:37:46'),
(192, '2020-05-26', NULL, NULL, 88, 100, 13, NULL, '2020-05-26 09:16:34', '2020-05-26 09:19:37'),
(193, '2020-05-26', NULL, NULL, 88, 100, 14, NULL, '2020-05-26 09:17:19', '2020-05-26 09:19:46'),
(194, '2020-05-26', NULL, NULL, 88, 100, 15, NULL, '2020-05-26 09:17:44', '2020-05-26 09:20:07'),
(195, '2020-05-26', NULL, NULL, 88, 100, 16, NULL, '2020-05-26 09:17:53', '2020-05-26 09:20:12'),
(196, '2020-05-26', NULL, NULL, 88, 100, 17, NULL, '2020-05-26 09:18:04', '2020-05-26 09:20:17'),
(197, '2020-05-26', NULL, NULL, 88, 100, 18, NULL, '2020-05-26 09:18:13', '2020-05-26 09:20:22'),
(198, '2020-05-26', NULL, NULL, 88, 100, 19, NULL, '2020-05-26 09:18:23', '2020-05-26 09:20:26'),
(199, '2020-05-26', NULL, NULL, 88, 100, 20, NULL, '2020-05-26 09:18:31', '2020-05-26 09:20:32'),
(200, '2020-05-26', NULL, NULL, 88, 100, 21, NULL, '2020-05-26 09:18:41', '2020-05-26 09:20:53'),
(201, '2020-05-26', NULL, NULL, 88, 0, 22, NULL, '2020-05-26 09:18:48', '2020-05-26 09:18:48'),
(202, '2020-05-26', NULL, NULL, 88, 0, 23, NULL, '2020-05-26 09:19:01', '2020-05-26 09:19:01'),
(204, '2020-05-27', NULL, NULL, 43, 0, 14, NULL, '2020-05-27 07:27:48', '2020-05-27 07:27:48'),
(205, '2020-05-27', NULL, NULL, 89, 80, 13, NULL, '2020-05-27 09:29:03', '2020-06-05 04:48:09'),
(206, '2020-05-27', NULL, NULL, 89, 89, 14, NULL, '2020-05-27 10:02:25', '2020-06-05 04:48:17'),
(207, '2020-05-27', NULL, NULL, 89, 87, 15, NULL, '2020-05-27 10:03:12', '2020-06-05 04:48:28'),
(208, '2020-05-27', NULL, NULL, 89, 77, 16, NULL, '2020-05-27 10:03:43', '2020-06-05 04:48:36'),
(209, '2020-06-02', NULL, NULL, 22, 85, 23, NULL, '2020-06-02 00:19:47', '2020-06-12 04:05:46'),
(210, '2020-06-08', NULL, NULL, 86, 85, 22, NULL, '2020-06-08 01:58:35', '2020-06-08 02:00:38'),
(211, '2020-06-08', NULL, NULL, 22, 80, 22, NULL, '2020-06-08 06:18:40', '2020-06-12 04:02:53'),
(212, '2020-06-08', NULL, NULL, 26, 80, 14, NULL, '2020-06-08 15:20:54', '2020-06-12 00:43:14'),
(213, '2020-06-10', NULL, NULL, 25, 88, 16, NULL, '2020-06-10 04:43:08', '2020-06-12 12:44:50'),
(214, '2020-06-10', NULL, NULL, 39, 85, 17, NULL, '2020-06-10 09:54:21', '2020-06-12 12:41:40'),
(215, '2020-06-11', NULL, NULL, 49, 0, 14, NULL, '2020-06-11 01:48:04', '2020-06-11 01:48:04'),
(216, '2020-06-11', NULL, NULL, 49, 0, 16, NULL, '2020-06-11 01:50:53', '2020-06-11 01:50:53'),
(217, '2020-06-11', NULL, NULL, 49, 0, 15, NULL, '2020-06-11 01:53:38', '2020-06-11 01:53:38'),
(218, '2020-06-12', NULL, NULL, 42, 0, 18, NULL, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(219, '2020-06-12', NULL, NULL, 27, 0, 18, NULL, '2020-06-12 08:54:12', '2020-06-12 08:54:12'),
(220, '2020-06-12', NULL, NULL, 25, 85, 18, NULL, '2020-06-12 11:42:55', '2020-06-12 12:46:45'),
(223, '2020-06-12', NULL, NULL, 22, 0, 21, NULL, '2020-06-12 14:19:51', '2020-06-12 14:19:51'),
(224, '2020-06-12', NULL, NULL, 26, 0, 26, NULL, '2020-06-12 14:47:57', '2020-06-12 14:47:57'),
(225, '2020-06-14', NULL, NULL, 28, 0, 14, NULL, '2020-06-14 13:35:56', '2020-06-14 13:35:56'),
(226, '2020-06-14', NULL, NULL, 28, 0, 15, NULL, '2020-06-14 13:37:32', '2020-06-14 13:37:32'),
(227, '2020-06-14', NULL, NULL, 28, 0, 16, NULL, '2020-06-14 13:40:10', '2020-06-14 13:40:10'),
(228, '2020-06-16', NULL, NULL, 34, 0, 20, NULL, '2020-06-16 01:36:08', '2020-06-16 01:36:08'),
(229, '2020-06-21', NULL, NULL, 25, 100, 19, NULL, '2020-06-21 04:10:53', '2020-06-22 06:15:57'),
(230, '2020-06-21', NULL, NULL, 25, 100, 20, NULL, '2020-06-21 07:50:06', '2020-06-22 06:18:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbingan_progress`
--

CREATE TABLE `bimbingan_progress` (
  `id_bimbingan_progress` int(36) NOT NULL,
  `nama_progress` text DEFAULT NULL,
  `status_penyelesaian` int(1) NOT NULL,
  `id_bimbingan` int(24) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bimbingan_progress`
--

INSERT INTO `bimbingan_progress` (`id_bimbingan_progress`, `nama_progress`, `status_penyelesaian`, `id_bimbingan`, `last_update`, `created_date`) VALUES
(29, 'tujuan pembuatan aplikasi', 1, 22, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(30, 'tujuan penyelesaian persoalan', 1, 22, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(31, 'cover dan deskripsi aplikasi ', 1, 23, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(32, 'deskripsi aplikasi yang dianalisis', 0, 24, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(33, 'deskripsi aplikasi', 1, 25, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(34, 'penjelasan dan tujuan di buatnya aplikasi', 1, 26, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(35, 'penjabaran tentang aplikasi', 1, 26, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(36, 'penjelasan tentang aplikasi yang di analisis', 1, 27, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(37, 'penjelasan latar belakang', 1, 28, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(38, 'penguraian masalah yang di hadapi', 1, 28, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(39, 'Fitur-fitur yang terdapat di dalam aplikasi', 1, 29, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(40, 'Tujuan pembuatan aplikasi atau persoalan', 1, 30, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(41, 'deskripsi aplikasi yang sedang dianalisis', 0, 31, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(42, 'Membuat identifikasi masalah', 1, 32, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(43, 'Membuat struktur pada BAB 1', 0, 32, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(44, 'Membuat struktur pada bab 1', 1, 33, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(45, 'menambahkan identifikasi masalah', 1, 33, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(48, 'Menentukan permasalahan yang cocok di tuangkan dalam id', 1, 35, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(49, 'sistem kerja form login', 0, 36, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(50, 'bahasan dashboard utama', 0, 36, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(51, 'dll', 0, 36, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(52, 'tujuan dari penyelesaian dari masalah yang ada', 1, 37, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(53, 'Membahas Deskripsi dari Aplikasi Kasir Jasa Cuci', 1, 38, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(54, 'Tujuan Pembuatan Aplikasi', 1, 39, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(55, '1. Tentang Brainly', 0, 40, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(56, '2. Cara Menggunakan Brainly', 0, 40, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(57, 'batasan pembahasan dalam laporan', 1, 41, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(58, 'deskripsi aplikasi', 1, 42, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(59, 'identifikasi masalah', 1, 43, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(60, 'tujuan', 1, 44, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(61, 'lingkup dokmentasi', 1, 45, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(62, 'landasan teori', 1, 46, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(63, 'sub identifikai nasalah, tujuan aplikasi, lingkup dokum', 1, 47, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(64, 'bertujuan untuk mengidentifikasi masalah-masalah yang y', 1, 48, '2020-06-15 03:30:57', '2020-05-23 03:46:40'),
(65, 'tujuan dari pembuatan aplikasi ini', 1, 49, '2020-06-15 03:31:12', '2020-05-23 03:46:40'),
(66, 'proses lingkup dokumentasi aplikasi', 1, 50, '2020-06-15 03:31:36', '2020-05-23 03:46:40'),
(67, 'Landasan teori yang digunakan dalam aplikasi', 1, 51, '2020-06-15 03:31:46', '2020-05-23 03:46:40'),
(70, 'Menambahkan Identifikasi Masalah', 1, 54, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(71, 'Latar belakang masalah', 1, 55, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(72, 'Latar belakang masalah', 1, 56, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(75, 'Pembahasan mengenai deskripsi aplikasi dan tampilan apl', 1, 59, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(113, 'Hemm', 1, 97, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(114, 'Deskripsi Aplikasi', 1, 98, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(115, 'Penjelasan ringkas aplikasi dan cara membukanya', 1, 99, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(116, 'Flowchart pembuatan user baru', 1, 100, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(117, 'kami disini menganalisis crud system dan kemarin saya sekaligus menjelaskan tentang database saya dan tugas devisi saya', 1, 101, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(118, 'Deskripsi aplikasi', 1, 102, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(119, 'Deskripsi aplikasi yang akan dianalisis', 1, 103, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(120, 'Melihat film yang tersedia dalam bioskop', 1, 104, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(121, 'Date and Time Selection', 1, 104, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(122, 'Seat Selection', 1, 104, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(123, 'Printout hasil booking', 1, 104, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(124, 'identifikasi masalah', 1, 105, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(125, 'Deskripsi Aplikasi', 1, 106, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(126, 'analisis, aplikasi,  algoritma, E-Booking, Transaksi', 1, 107, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(127, 'Revisis Identifikasi Masalah', 1, 108, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(128, 'disini kami menjelaskan masalah yg saya dapat dan sekaligus menjelaskan devisi yg kami kerjakan', 0, 109, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(129, 'Menambahkan Landasan Teori (BAB II)', 1, 110, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(130, 'membahas identifikasi masalah beserta penjelasannya', 1, 111, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(131, 'Deskripsi Aplikasi Aplikasi Perpustakaan  adalah sistem yang berfungsi untuk pengolahan data perpustakaan dari stok buku-buku yang tersedia,  pengunjung sampai yang melakukan peminjaman dan pengembalian buku yang dipinjam. Sistem ini bersifat client-server karena menggunakan database MySQL sehingga untuk mengembangan jaringan akan lebih mudah untuk diimplementasikan. Dengan menggunakan sistem aplikasi ini kemudahan proses pengelolaan data perpustakaan  dan pengontrolannya akan lebih mudah. Setiap  data stok buku,pengunjung dan  peminjam. Adapun proses log in pada aplikasi ini sebagai berikut:  1. Login dalam bentuk member akan di arahkan kepada halaman member yang dimana pembaca  akan dapat memilih judul buku yang akan di pinjam. Setelah itu member tersebut akan memilih buku sesuai dengan keiginannya kemudian member akan dihadapkan dengan pemilihan waktu peminjaman dan pengembalian buku. Setelah itu pengguna akan diarahkan ke dalam sebuah menu transaksi, pada menu ini member akan mendapatkan kode transaksi. 2. Login sebagai Admin. Login dalam bentuk Admin akan dapat memantau, menghapus, mengubah dan mengendalikan aplikasi tersebut.', 0, 112, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(132, 'membahas tujuan dan  penjelasannya', 1, 113, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(133, 'Deskripsi aplikasi', 0, 114, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(134, 'disini kami menjelaskan struktur dan tahapan peng inputan form dengan berbasis flowchart', 0, 115, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(135, 'membahas tentang lingkup dokumentasi dalam laporan proyek 1', 1, 116, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(136, 'Menambahkan Tujuan (BAB I)', 1, 117, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(137, 'Pada tema ini, kita mengidentifikasi masalah-masalah yang terjadi pada aplikasi Kasir Jasa Cuci tersebut', 1, 118, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(138, 'Sub Bahasan yang di bahas dalam tema ini adalah , menganalisis tujuan dibuatnya aplikasi Kasir Jasa Cuci ini.', 1, 119, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(139, 'Lingkup Dokumentasi merupakan bagian akhir dari Bab I, yang di bahas dari lingkup dokumentasi adalah batasan-batasan dari setiap Bab yang ada pada laporan ini.', 1, 120, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(140, 'Bagian identifikasi masalah', 1, 121, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(141, 'Bagian identifikasi masalah', 1, 122, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(142, 'Bagian tujuan', 1, 123, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(143, 'Bagian lingkup dokumentasi', 1, 124, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(144, 'Bagian landasan teori', 1, 125, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(145, 'Identifikasi masalah yang ada pada aplikasi Laundry', 1, 126, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(146, 'membahas landasan teori serta dicantumkan sumbernya', 1, 127, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(147, 'BAB III - Analisis Dan Perancangan', 1, 128, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(148, 'Analisis Sistem Yang Sedang Berjalan', 1, 128, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(149, 'Sistem Yang Berjalan Pada Prosedur Login', 1, 128, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(150, 'Sistem Yang Berjalan Pada Prosedur Menu Layar Printer', 1, 128, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(151, 'Sistem Yang Berjalan Pada Prosedur Menu Antrian Administrasi', 1, 128, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(152, 'analisi fungsional aplikasi', 1, 129, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(153, 'Analis non fungsional', 1, 130, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(154, 'sistem kerja form login', 0, 131, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(155, 'bahasan dasboard utama', 0, 131, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(156, 'Permasalahan yang ingin diselesaikan oleh aplikasi', 1, 132, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(157, 'Tujuan analisis di buat', 1, 133, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(158, 'Batasan batasan yang dikerjakan', 1, 134, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(159, 'Menu dalam aplikasi', 1, 135, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(160, 'disini kami melakukan revisi pada laporan terutama di lingkup dokumentasi', 0, 136, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(161, 'identifikasi masalah', 1, 137, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(162, 'Tujuan', 1, 137, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(163, 'Deskripsi mengenai aplikasi chatbot Iteung', 1, 138, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(164, 'Membahas tentang landasan teori  yang berisi pendapat para ahli', 1, 139, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(165, '1.2  Latar Belakang Masalah Membaca buku adalah sebuah kebiasaan yang baik yang banyak di gemari oleh banyak orang di seluruh dunia, membaca buku ini dapat di lakukan dimana saja. Membaca buku adalah point penting dalam pendidikan di negara manapun untuk meningkatkan sumber daya manusia agar menciptakan manusia yang berkualitas, namun selain di sekolah membaca buku juga dapat di lakukan dimana saja misalnya di halte pada saat meunggu bis atau mengisi waktu luang ketika santai.   Membaca buku adalah jendela dunia, membaca buku juga sering di sebut jalan menuju kesuksesan, namun pada era ini budaya membaca sudah mulai pudar karena pada generasi saat ini banyak anak muda yang lebih suka bermain gadget karena telah menjadi trend di masa sekarang ini. Oleh karena itu aplikasi ini di buat untuk meingkatkan kembali semangat membaca khusunya di indonesia karena memiliki system yang efisien untuk mempermudah pembaca untuk meminjam sebuah buku.  1.3Identifikasi Masalah  1.Tidak efisiennya sistem peminjaman buku yang saat ini sedang berlangsung 2. Kurang efektifnya pencatatan peminjaman dari segi waktu', 0, 140, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(166, '1.4Tujuan  1.Untuk mempermudah proses peminjaman buku,yang tidak perlu mengantri buku yang memakan waktu karena buku yang ingin di pinjam pasti ada. 2.Memepermudah para User untuk meminjam buku atau memboking buku yang akan di pinjam. 3.Lebih efisien. 4.Untuk lebih memanfaatkan program saing di era globalisasi. 5.Mempercepat proses peminjaman buku.', 0, 141, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(167, 'tujuan', 1, 142, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(168, 'lingkup dokumentasi', 1, 142, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(169, 'Identifikasi masalah', 1, 143, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(170, 'tujuan', 1, 143, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(171, 'lingkup dokumentasi', 1, 143, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(172, 'membahas mengenai analisis serta kebutuhan fungsional pada aplikasi pengadaan barang', 1, 144, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(173, 'membahas analisis kebutuhan non-fungsional ', 1, 145, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(174, 'Sub bahasan mengenai deskripsi aplikasi chatbot ITeung ', 1, 146, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(175, 'sistem informasi akademik', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(176, 'registrasi', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(177, 'kartu rencana studi', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(178, 'website', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(179, 'php', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(180, 'mysql', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(181, 'html', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(182, 'css', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(183, 'database', 1, 147, '2020-06-09 06:56:53', '2020-05-23 03:46:40'),
(184, 'Tujuan pembuatan aplikasi', 0, 148, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(185, 'Membahas Isi Landasan Teori', 1, 149, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(186, 'struktur menu aplikasi pengadaan barang', 1, 150, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(187, 'Materi yang terkait dengan yang ingin dibahas', 1, 151, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(188, 'ruang linkup', 1, 152, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(189, 'Sistematika penulisan', 1, 152, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(190, 'Bab 2', 1, 152, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(191, 'pengajuan bimbingan', 1, 153, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(192, 'tujuan dari menganalsis aplikasi antrian bank', 1, 154, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(193, 'pembagian tugas antar teman kelompok', 1, 155, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(194, 'Kebutuhan Non-Fungsional Aplikasi', 1, 156, '2020-06-12 03:55:39', '2020-05-23 03:46:40'),
(195, 'data yang dapat diisi atau diolah oleh sistem informasi', 0, 157, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(196, 'data yang dapat diakses oleh pengguna', 0, 157, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(197, 'manfaat dari sistem informasi', 0, 157, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(198, 'Rumusan Masalah', 0, 158, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(199, 'Tujuan', 0, 158, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(200, 'Ruang Lingkup', 0, 158, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(201, 'Sistematika Penulisan', 0, 158, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(202, 'Landasan Teori', 1, 159, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(203, 'A', 1, 160, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(204, 'C', 1, 160, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(205, 'D', 1, 160, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(206, 'fungsional dan non fungsional', 1, 161, '2020-06-10 04:36:07', '2020-05-23 03:46:40'),
(207, 'revisi', 1, 162, '2020-06-12 00:41:25', '2020-05-23 03:46:40'),
(208, 'AC', 1, 163, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(209, 'AS', 1, 163, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(210, 'aWT', 1, 164, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(211, '112', 1, 165, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(212, 'ZV', 1, 166, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(213, 'ASFASF', 1, 167, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(214, 'A', 0, 168, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(215, 'Analisis Kelebihan & kekurangan', 0, 169, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(216, 'metode penelitian', 0, 169, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(217, 'hasil penelitian', 0, 169, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(219, 'afa', 1, 171, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(220, 'qwfwqfqwf', 1, 172, '2020-05-26 15:42:24', '2020-05-23 03:46:40'),
(221, 'asfasf', 1, 173, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(222, 'qwfw', 1, 174, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(223, 'qwfqf', 1, 175, '2020-05-26 15:42:42', '2020-05-23 03:46:40'),
(224, 'wqfwqfqw', 1, 176, '2020-05-26 15:42:57', '2020-05-23 03:46:40'),
(225, 'qfzxvadsf', 1, 177, '2020-05-26 15:43:09', '2020-05-23 03:46:40'),
(227, 'pqwf', 1, 179, '2020-05-26 15:43:21', '2020-05-23 03:46:40'),
(228, 'a', 1, 180, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(229, 'v', 1, 180, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(230, 'x', 1, 180, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(231, 'a', 1, 181, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(232, 'c', 1, 181, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(233, 'vb', 1, 181, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(234, 'a', 1, 182, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(235, 'v', 1, 182, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(236, 'e', 1, 182, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(237, 'a', 1, 183, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(238, 'd', 1, 183, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(239, 'c', 1, 183, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(240, 'a', 1, 184, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(241, 'v', 1, 184, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(242, 't', 1, 184, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(243, 'v', 1, 185, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(244, 'fh', 1, 185, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(245, 'h', 1, 185, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(246, 'asd', 1, 186, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(247, 'asda', 1, 186, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(248, 'a', 1, 186, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(249, 'hy', 1, 187, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(250, 'kuik', 1, 187, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(251, 'dgr', 1, 187, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(252, 'asdaw', 1, 188, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(253, 'daad', 1, 188, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(254, 'awda', 1, 188, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(255, 'aadsa', 1, 189, '2020-05-23 03:46:17', '2020-05-23 03:46:40'),
(256, 'qwfwq', 1, 190, '2020-05-26 15:43:33', '2020-05-23 03:46:40'),
(257, 'qwffqwwqf', 1, 190, '2020-05-26 15:43:33', '2020-05-23 03:46:40'),
(258, 'user interface dan penjelasannya', 1, 191, '2020-06-09 01:37:46', '2020-05-25 08:54:11'),
(259, 'a', 1, 192, '2020-05-26 09:19:37', '2020-05-26 09:16:34'),
(260, 'a', 1, 192, '2020-05-26 09:19:37', '2020-05-26 09:16:34'),
(261, 'd', 1, 193, '2020-05-26 09:19:46', '2020-05-26 09:17:20'),
(262, 'f', 1, 193, '2020-05-26 09:19:46', '2020-05-26 09:17:20'),
(263, 'f', 1, 194, '2020-05-26 09:20:07', '2020-05-26 09:17:44'),
(264, 'c', 1, 194, '2020-05-26 09:20:07', '2020-05-26 09:17:44'),
(265, 'g', 1, 195, '2020-05-26 09:20:12', '2020-05-26 09:17:54'),
(266, 'v', 1, 195, '2020-05-26 09:20:12', '2020-05-26 09:17:54'),
(267, 'das', 1, 196, '2020-05-26 09:20:17', '2020-05-26 09:18:04'),
(268, 'ef', 1, 196, '2020-05-26 09:20:17', '2020-05-26 09:18:04'),
(269, 'awdawd', 1, 197, '2020-05-26 09:20:21', '2020-05-26 09:18:13'),
(270, 'd', 1, 197, '2020-05-26 09:20:21', '2020-05-26 09:18:13'),
(271, 'asd', 1, 198, '2020-05-26 09:20:26', '2020-05-26 09:18:23'),
(272, 'asd', 1, 198, '2020-05-26 09:20:26', '2020-05-26 09:18:23'),
(273, 'ad', 1, 199, '2020-05-26 09:20:32', '2020-05-26 09:18:31'),
(274, 'w', 1, 199, '2020-05-26 09:20:32', '2020-05-26 09:18:31'),
(275, 'wdaw', 1, 200, '2020-05-26 09:20:53', '2020-05-26 09:18:41'),
(276, 'ada', 1, 200, '2020-05-26 09:20:53', '2020-05-26 09:18:41'),
(277, 'awdawd', 0, 201, '2020-05-26 09:18:48', '2020-05-26 09:18:48'),
(278, 'dfs', 0, 201, '2020-05-26 09:18:48', '2020-05-26 09:18:48'),
(279, 'awda', 0, 202, '2020-05-26 09:19:01', '2020-05-26 09:19:01'),
(280, 'adaw', 0, 202, '2020-05-26 09:19:01', '2020-05-26 09:19:01'),
(281, 'Identifikasi masalah', 0, 204, '2020-05-27 07:27:48', '2020-05-27 07:27:48'),
(282, 'Latar belakang masalah', 0, 204, '2020-05-27 07:27:48', '2020-05-27 07:27:48'),
(283, 'qwfqw', 1, 205, '2020-06-05 04:48:09', '2020-05-27 09:29:03'),
(284, 'qwfwq', 1, 205, '2020-06-05 04:48:09', '2020-05-27 09:29:03'),
(285, 'a', 1, 206, '2020-06-05 04:48:17', '2020-05-27 10:02:25'),
(286, 'asfa', 1, 207, '2020-06-05 04:48:28', '2020-05-27 10:03:12'),
(287, 'wqdwqdwq', 1, 208, '2020-06-05 04:48:36', '2020-05-27 10:03:43'),
(288, 'Breaking down kodingan', 1, 209, '2020-06-12 04:05:46', '2020-06-02 00:19:47'),
(289, 'afsa', 1, 210, '2020-06-08 02:00:38', '2020-06-08 01:58:35'),
(290, 'CDM dan PDM', 1, 211, '2020-06-12 04:02:53', '2020-06-08 06:18:44'),
(291, 'disini saya membahas tugas dari defisi saya dan masih akan terus saya kembangkan dan perdalam mohon maaf jika aga kurang tepat', 1, 212, '2020-06-12 00:43:14', '2020-06-08 15:20:54'),
(292, 'Linkup Dokumentasi', 0, 213, '2020-06-10 04:43:08', '2020-06-10 04:43:08'),
(293, 'Memperbaiki Flowchart', 0, 213, '2020-06-10 04:43:09', '2020-06-10 04:43:09'),
(294, 'Menambahkan No Halaman', 0, 213, '2020-06-10 04:43:09', '2020-06-10 04:43:09'),
(295, 'landasan teori dari analisis', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(296, 'landasan teori dari sistem', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(297, 'landasan teori dari informasi', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(298, 'landasan teori dari antrian', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(299, 'landasan teori dari struktur antrian', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(300, 'landasan teori dari mekanisme pelayanan', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(301, 'landasan teori dari karateristik sistem antrian', 0, 214, '2020-06-10 09:54:21', '2020-06-10 09:54:21'),
(302, 'identifikasi masalah aplikasi', 0, 215, '2020-06-11 01:48:04', '2020-06-11 01:48:04'),
(303, 'membahas lingkup dokumentasi  pembuatan aplikasi', 0, 216, '2020-06-11 01:50:53', '2020-06-11 01:50:53'),
(304, 'tujuan dari aplikasi tersebut', 0, 217, '2020-06-11 01:53:38', '2020-06-11 01:53:38'),
(305, 'Analisis non fungsional', 0, 218, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(306, 'Struktur Menu', 0, 218, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(307, 'User Interface', 0, 218, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(308, 'Struktur Database', 0, 218, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(309, 'Logika Fungsi/ Algoritma Fungsi', 0, 218, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(310, 'BAB III', 0, 218, '2020-06-12 01:51:59', '2020-06-12 01:51:59'),
(311, 'analisis kebutuhan fungsional', 0, 219, '2020-06-12 08:54:12', '2020-06-12 08:54:12'),
(312, 'analisis kebutuhan non fungsional', 0, 219, '2020-06-12 08:54:12', '2020-06-12 08:54:12'),
(313, 'Menambahkan Analisis Sistem Yang akan dibangun', 0, 220, '2020-06-12 11:42:55', '2020-06-12 11:42:55'),
(314, 'Menambahkan Analisis Fungsional Aplikasi', 0, 220, '2020-06-12 11:42:55', '2020-06-12 11:42:55'),
(315, 'User Interface', 0, 223, '2020-06-12 14:19:55', '2020-06-12 14:19:55'),
(316, 'Revisi Analisis Fungsional', 0, 223, '2020-06-12 14:19:55', '2020-06-12 14:19:55'),
(317, 'Revisi Analisis Non-Fungsional', 0, 223, '2020-06-12 14:19:55', '2020-06-12 14:19:55'),
(318, 'Revisi Breaking Down Kodingan', 0, 223, '2020-06-12 14:19:55', '2020-06-12 14:19:55'),
(319, 'progress pembahasan', 0, 224, '2020-06-12 14:47:57', '2020-06-12 14:47:57'),
(320, 'Identifikasi Masalah', 0, 225, '2020-06-14 13:35:56', '2020-06-14 13:35:56'),
(321, 'Tujuan', 0, 226, '2020-06-14 13:37:32', '2020-06-14 13:37:32'),
(322, 'Lingkup Dokumentasi', 0, 227, '2020-06-14 13:40:10', '2020-06-14 13:40:10'),
(323, 'struktur menu', 0, 228, '2020-06-16 01:36:08', '2020-06-16 01:36:08'),
(324, 'Menambahkan Analisis Non - Fungsional', 1, 229, '2020-06-22 06:15:57', '2020-06-21 04:10:53'),
(325, 'Menambahkan Struktur menu Keseluruhan Aplikasi', 0, 230, '2020-06-21 07:50:07', '2020-06-21 07:50:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_kegiatan`
--

CREATE TABLE `dokumen_kegiatan` (
  `id_dokumen` int(11) NOT NULL,
  `nama_dokumen` text DEFAULT NULL,
  `file_dokumen` text DEFAULT NULL,
  `id_kegiatan` text DEFAULT NULL,
  `target` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'A',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokumen_kegiatan`
--

INSERT INTO `dokumen_kegiatan` (`id_dokumen`, `nama_dokumen`, `file_dokumen`, `id_kegiatan`, `target`, `created_date`) VALUES
(23, 'Buku Panduan Kegiatan Proyek 1 2020', 'panduan_4_595348459200', '4', 'A', '2020-05-09 15:34:16'),
(24, 'Panduan Penggunaan Aplikasi Mahasiswa', 'panduan_4_624839909760', '4', 'M', '2020-05-09 15:36:39'),
(25, 'Panduan Bimbingan Dosen', 'panduan_4_1277075479680', '4', 'D', '2020-05-09 15:39:32'),
(27, 'Panduan Penggunaan Aplikasi Dosen', 'panduan_4_3045295440000', '4', 'D', '2020-05-09 15:54:54'),
(28, 'Panduan Bimbingan Mahasiswa', 'panduan_4_698650128000', '4', 'M', '2020-05-09 15:55:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nidn` char(16) NOT NULL,
  `nama` varchar(75) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(35) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `research_interest` varchar(500) DEFAULT NULL,
  `prodi` char(2) DEFAULT NULL,
  `username` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama`, `tgl_lahir`, `tempat_lahir`, `alamat`, `research_interest`, `prodi`, `username`) VALUES
('0403117607', 'Noviana Riza, S.Si., M.T.', '0000-00-00', NULL, NULL, '12', '14', 'novianariza@poltekpos.ac.id'),
('123456789', 'Simpro Sample DSN #1', NULL, NULL, NULL, '12,11,10,9', '14', 'luthfimnabil17@gmail.com'),
('402047205', 'Rd. Nuraini Siti Fatonah, S.S., M.Hum.', '0000-00-00', '', '', '12', '14', 'nuraini@poltekpos.ac.id'),
('402058005', 'Mohamad Nurkamal Fauzan, S.T., M.T.', '0000-00-00', '', '', '1,11', '14', 'm.nurkamal.f@poltekpos.ac.id'),
('407117405', 'M. Yusril Helmi Setyawan, S.Kom., M.Kom.', '1974-11-07', 'Rembang', 'Pesona Bangun Indah Persada D20 RT/RW 007/001 Tanimulya,Bandung Barat – Jawa Barat', '1,5,6', '14', 'yusrilhelmi@poltekpos.ac.id'),
('410118609', 'Rolly Maulana Awangga, S.T., M.T.', '0000-00-00', '', '', '7,8,9,10', '14', 'awangga@poltekpos.ac.id'),
('415048901', 'Nisa Hanum Harani, S.Kom., M.T.', '0000-00-00', '', '', '8,9,12,14', '14', 'nisahanum@poltekpos.ac.id'),
('415107901', 'Woro Isti Rahayu, S.T., M.T.', '0000-00-00', '', '', '12', '14', 'woroisti@poltekpos.ac.id'),
('416048803', 'Syafrial Fachri Pane, S.T., M.T.I.,EBDP', '0000-00-00', '', '', '9,13', '14', 'syafrial.fachri@poltekpos.ac.id'),
('420058801', 'Roni Andarsyah, S.T., M.Kom.', '0000-00-00', '', '', '12', '14', 'roniandarsyah@poltekpos.ac.id'),
('423127804', 'Roni Habibi, S.Kom., M.T.', '0000-00-00', NULL, NULL, '12', '14', 'roni.habibi@poltekpos.ac.id'),
('424038805', 'M. Harry K Saputra, S.T., M.T.I', '1988-03-24', 'Cianjur', 'Jl Sariasih no 54 Bandung', '12', '14', 'harrysaputra@poltekpos.ac.id'),
('427078401', 'Cahyo Prianto, S.Pd., M.T.', '0000-00-00', '', '', '9,12', '14', 'cahyoprianto@poltekpos.ac.id');

--
-- Trigger `dosen`
--
DELIMITER $$
CREATE TRIGGER `user_add_dosen` AFTER INSERT ON `dosen` FOR EACH ROW BEGIN INSERT INTO app_simpro.user VALUES(new.username, new.nidn, 'D', 'default'); END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_delete_dosen` AFTER DELETE ON `dosen` FOR EACH ROW BEGIN
DELETE FROM app_simpro.user WHERE id_user = old.username;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal`
--

CREATE TABLE `jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `nidn` char(16) NOT NULL,
  `judul_jurnal` varchar(150) NOT NULL,
  `link_jurnal` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(8) NOT NULL,
  `prodi` char(2) NOT NULL,
  `nama_kegiatan` varchar(40) NOT NULL,
  `jenis_kegiatan` int(2) DEFAULT NULL,
  `id_koordinator` char(16) NOT NULL,
  `status_mulai` int(1) NOT NULL,
  `angkatan` varchar(9) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `semester` char(1) NOT NULL,
  `persentase_sidang` int(3) NOT NULL,
  `persentase_bimbingan` int(3) NOT NULL,
  `min_bimbingan` int(11) NOT NULL DEFAULT 0,
  `tgl_batas_proposal` date DEFAULT NULL,
  `tgl_batas_bimbingan` date DEFAULT NULL,
  `tgl_batas_sidang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kegiatan`
--

INSERT INTO `kegiatan` (`id_kegiatan`, `prodi`, `nama_kegiatan`, `jenis_kegiatan`, `id_koordinator`, `status_mulai`, `angkatan`, `tgl_mulai`, `tgl_selesai`, `semester`, `persentase_sidang`, `persentase_bimbingan`, `min_bimbingan`, `tgl_batas_proposal`, `tgl_batas_bimbingan`, `tgl_batas_sidang`) VALUES
(4, '14', 'Proyek 1 | 19202', NULL, '424038805', 1, '2019', '2020-02-28', '2020-07-30', '2', 70, 30, 8, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan_parameter`
--

CREATE TABLE `kegiatan_parameter` (
  `id_matkul` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `min_nilai` varchar(1) NOT NULL,
  `semester` int(11) NOT NULL,
  `prodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan_progress`
--

CREATE TABLE `kegiatan_progress` (
  `id_kegiatan_progress` int(11) NOT NULL,
  `judul_progress` varchar(55) NOT NULL,
  `id_kegiatan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kegiatan_progress`
--

INSERT INTO `kegiatan_progress` (`id_kegiatan_progress`, `judul_progress`, `id_kegiatan`) VALUES
(13, 'Deskripsi Aplikasi', 4),
(14, 'Identifikasi Masalah', 4),
(15, 'Tujuan', 4),
(16, 'Lingkup Dokumentasi', 4),
(17, 'Landasan Teori', 4),
(18, 'Analisis Fungsional Aplikasi', 4),
(19, 'Analisis Non-Fungsional Aplikasi', 4),
(20, 'Struktur Menu', 4),
(21, 'User Interface', 4),
(22, 'Struktur Database', 4),
(23, 'Logika Fungsi/Algoritma Aplikasi', 4),
(24, 'Pembahasan Hasil Implemntasi', 4),
(25, 'Pengujian Aplikasi', 4),
(26, 'Kesimpulan', 4),
(27, 'Saran', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` char(7) NOT NULL,
  `nama` varchar(75) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `tempat_lahir` varchar(35) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `prodi` int(2) DEFAULT NULL,
  `semester` int(1) NOT NULL DEFAULT 1,
  `angkatan` int(4) DEFAULT NULL,
  `kelas` char(1) NOT NULL DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama`, `alamat`, `tempat_lahir`, `tgl_lahir`, `prodi`, `semester`, `angkatan`, `kelas`, `email`, `no_telp`) VALUES
('1164059', 'Yoga Sakti Hadi Putra', 'Bandung', 'Klaten', '1998-08-09', 14, 2, 2016, 'A', 'yogazacty@gmail.com', '082324937376'),
('1174020', 'Luthfi01', '', '', '0000-00-00', 14, 6, 2017, 'B', '', ''),
('1174021', 'Luthfi02', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1174022', 'Luthfi 55', '', '', '0000-00-00', 14, 5, 2017, 'B', '', ''),
('1174023', 'Luthfi 60', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1174024', 'Luthfi 65', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1174025', 'Luthfi 70', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1174026', 'Luthfi 75', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1174027', 'Luthfi 80', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1174035', 'Luthfi', '', '', '0000-00-00', 14, 5, 2017, 'B', '', ''),
('1174040', 'Hagan', '', '', '0000-00-00', 14, 6, 2017, 'B', '', ''),
('1174045', 'Luthfi 45', '', '', '0000-00-00', 14, 6, 2017, 'B', '', ''),
('1174050', 'Luthfi 50', NULL, NULL, NULL, 14, 1, 2017, 'B', NULL, NULL),
('1194001', 'Ade Ilham Permadi', NULL, NULL, NULL, 14, 1, 2019, 'A', NULL, NULL),
('1194002', 'Ahmad Fathoni Rizaldi', 'Jl. Adipati Agung Dalam 1 RT 07 RW 10 No. 176, Baleendah, Bandung, Jawa Barat, 40375', 'Bandung', '2000-09-20', 14, 2, 2019, 'A', NULL, NULL),
('1194003', 'Akmal Restu Dewantoro', 'KP.CITAMAN RT03 RW 04 CIMAHI TENGAH', 'BANYUMAS', '1999-11-25', 14, 2, 2019, 'A', NULL, NULL),
('1194004', 'Alwizain Almas Trigreisian', 'Jl. Kumbokarno 36B Ponorogo, Jawa Timur', 'Ponorogo', '2001-07-03', 14, 2, 2019, 'A', NULL, NULL),
('1194005', 'Artha Glory Romey Manurung', 'Sarijadi', 'Tangerang', '2001-05-03', 14, 2, 2019, 'A', 'arthaglory@gmail.com', '081316055407'),
('1194006', 'Audry Febrisa Sidabutar', 'JL. SM RAJA NO.113, PARAPAT, GIRSANG SIPANGAN BOLON', 'PORSEA', '2001-02-23', 14, 2, 2019, 'A', NULL, NULL),
('1194007', 'Ayu Lestari Nasution', NULL, NULL, NULL, 14, 1, 2019, 'A', NULL, NULL),
('1194008', 'Burhanudin Zuhri', 'Desa Karangglonggong RT02/RW02, Kecamatan Klirong, Kabupaten Kebumen, Provinsi Jawa Tengah', 'Kebumen', '2000-07-25', 14, 2, 2019, 'A', 'burhanudinzuhri25@gmail.com', '087719053289'),
('1194010', 'Deriska Fadilla Musdalifa', 'JALAN TRUNOJOYO NO 25 SENTUL, KEPANJENKIDUL', 'BLITAR', '2001-08-18', 14, 2, 2019, 'A', NULL, NULL),
('1194011', 'Dzul Jalali Wal Ikram', 'Manggemaci,RT 003/RW 001, kelurahan manggemaci, kecamatan Mpunda', 'Mataram', '2001-03-22', 14, 2, 2019, 'A', NULL, NULL),
('1194012', 'Eni Lestari', 'jln sari asih 2, bandung, jawa barat', 'Kayuagung', '2002-09-16', 14, 2, 2019, 'A', NULL, NULL),
('1194013', 'Eriskiannisa Febrianty Luchia Awalina', NULL, NULL, NULL, 14, 1, 2019, 'A', NULL, NULL),
('1194014', 'Faisal Abdullah', 'Jln.pln dalam RT:09  Rw:05', 'Tanggerang', '2000-12-14', 14, 2, 2019, 'A', 'faisalabdullah168@gmail.com', ''),
('1194015', 'Fanny Devita Inggarini', NULL, NULL, NULL, 14, 1, 2019, 'A', NULL, NULL),
('1194016', 'Farhan Ali Syahbana', 'Sambong, padaherang RT/RW:25/03 KEL. PASIRGEULIS KEC.PADAHERANG KAB.PANGANDARAN', 'Ciamis', '2000-09-12', 14, 2, 2019, 'A', NULL, NULL),
('1194017', 'Haekal Hilmi Zain', '', 'Bandung', '2001-07-20', 14, 1, 2019, 'A', 'haekal.hlm@gmail.com', '081395966415'),
('1194018', 'Helmi Salsabila', 'Cirebon, Jawa Barat', 'Cirebon', '2000-11-28', 14, 2, 2019, 'A', NULL, NULL),
('1194019', 'Khoirul aziz', NULL, NULL, NULL, 14, 1, 2019, 'A', NULL, NULL),
('1194020', 'Krisna Bayu Pratama', '', 'Manado', '2001-03-23', 14, 2, 2019, 'A', 'krisnabayup86@gmail.com', '083831701707'),
('1194021', 'M. Rizky', 'Link. Sawete Barat Kel. Bali Kec. Dompu Kab. Dompu Provinsi NTB.', 'Dompu', '2000-04-17', 14, 2, 2019, 'A', 'mriski889@gmail.com', '085239807970'),
('1194023', 'M.Rizki Maulana Y.', 'asrama kopassus yon 14, kemang, Bogor', 'Bandung', '2000-06-12', 14, 2, 2019, 'A', NULL, NULL),
('1194024', 'Muhammad Farhan Faridz Sofyan', 'Pangkajene Sidrap', 'Polewali Mandar', '2000-10-20', 14, 2, 2019, 'B', 'farhansofyan117@gmail.com', '+6282394507892'),
('1194025', 'Muhammad Nazhim Maulana', '', 'Watampone', '2002-07-16', 14, 2, 2019, 'A', NULL, NULL),
('1194026', 'Muhammad Syiarul Amrullah', '', '', '0000-00-00', 14, 2, 2019, 'A', NULL, NULL),
('1194027', 'Muhammad Yaqdhan Taqy Ariana', 'Jl.Cibogo Bawah RT 04 RW 07', 'Bandung', '1999-11-14', 14, 2, 2019, 'A', 'yaqdhan.ariana@gmail.com', '08988760548'),
('1194028', 'Naurah Nazifah', NULL, NULL, NULL, 14, 1, 2019, 'A', NULL, NULL),
('1194029', 'Nur Ikhsani Suwandy Futri', '', '', '0000-00-00', 14, 2, 2019, 'A', NULL, NULL),
('1194030', 'Petrolina Anastasia Gatto', 'Sarijadi', 'Kupang', '2000-02-13', 14, 2, 2019, 'A', 'linapark1300@gmail.com', '081246853143'),
('1194031', 'R.Bimantoro Putra', 'sadia rt 01 rw 01 kec. Mpunda Kota Bimaa, prov. NTB', 'Bima', '1999-05-08', 14, 2, 2019, 'A', 'Rahmatbp962@gmail.com', '082147561865'),
('1194034', 'Salsa Thalia Putri Nur Rochmani', 'Bandung', 'Bandung ', '2002-09-11', 14, 2, 2019, 'A', 'salthalia16@gmail.com', ''),
('1194036', 'Alek Brahma', 'jl.sarimanah 2 no.33/178 rt.03/08 kelurahan sarijadi keceematan sukasari', 'MEDAN', '2001-05-17', 14, 2, 2019, 'A', NULL, NULL),
('1194038', 'Alvaro Daniel Bamba', 'Jalan Tanjung Branjangan Nomor 36, Luwuk, Sulawesi Tengah', 'Luwuk Sulawesi Tengah', '0000-00-00', 14, 2, 2019, 'B', NULL, NULL),
('1194039', 'Ardhila Pudjaningrum', 'Jalan Bhakti', 'Tanjung Balai Karimun', '2001-04-24', 14, 2, 2019, 'B', NULL, NULL),
('1194040', 'Aris Febriansyah', 'Jl.aries no.37', 'sumenep', '2001-02-18', 14, 2, 2019, 'B', NULL, NULL),
('1194041', 'Aufarrifqi Muthahhari Aziz', 'Jl. Amir Hamzah No. 48, Pekanbaru, Riau', 'Pekanbaru', '2001-11-07', 14, 2, 2019, 'B', 'aufarifqi11@gmail.com', '082297201843'),
('1194042', 'Danang Ari Subarkah', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194044', 'Esadhira Giovany Syuhada', '', 'Bandung', '2001-10-09', 14, 2, 2019, 'B', NULL, NULL),
('1194045', 'Fahriza Rizky Amalia', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194046', 'Ilham Ambar Rochmat', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194047', 'Linggo Prasetyo', '', '', '0000-00-00', 14, 2, 2019, 'B', NULL, NULL),
('1194048', 'Lunetta Ivania Sidora', 'Dsn. Kramat RT.07/RW.02, kel. Kramat Temenggung. Kec. Tarik, kab.Sidoarjo', 'Gunung Kidul', '2001-05-14', 14, 2, 2019, 'B', NULL, NULL),
('1194049', 'M. Hadi Syatiri', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194050', 'M. Ilyas Tri Khaqiqi', 'Kp. Rancakangkung Rt. 002/001 Desa. Bojongsalam Kec.Rancaekek. Kab.Bandung. Jawa Barat', 'Bandung', '2001-02-22', 14, 2, 2019, 'B', NULL, NULL),
('1194052', 'Muh Fariz Syafiq Bempah', 'Jln. K.H Dewantara No. 11 Kab. Banggai, Sulawesi Tengah', 'Luwuk', '2001-03-22', 14, 2, 2019, 'B', 'muhfarizsyafiq@gmail.com', ''),
('1194053', 'Daffa Algifary', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194054', 'Muhammad Al Farrabi', 'Griya Parahyangan C. 19', 'Bandung', '2000-10-26', 14, 2, 2019, 'B', 'alfarrabim@gmail.com', '0895324279619'),
('1194055', 'Muhammad Fahri Ramadhan', '', 'Bandung', '2000-12-07', 14, 2, 2019, 'B', 'fahrim42@gmail.com', '083826390631'),
('1194056', 'Muhammad Kautsar', '', 'Bima', '2001-04-25', 14, 2, 2019, 'B', NULL, NULL),
('1194057', 'Muhammad Nanda Fahriza', 'Prov. Aceh, Kab. Aceh Tenggara, Kec. Semadam, Desa Sukamakmur', 'Medan', '2000-10-16', 14, 2, 2019, 'B', NULL, NULL),
('1194058', 'Muhammad Rafly Fachrian Al Bantani', 'Komp Puri Anggrek blok C49D no 6 Walantaka, Serang BANTEN', 'Lebak', '2001-11-10', 14, 2, 2019, 'B', NULL, NULL),
('1194059', 'Muhammad Rizal Supriadi', 'Kp. Cikambuy Hilir Rt.02 Rw.11 No.47 Kec. Katapang Kab. Bandung', 'Bandung', '2000-09-17', 14, 2, 2019, 'B', NULL, NULL),
('1194060', 'Natalya Br Sidauruk', 'Jl K H Z Arifin no 97', 'Stabat', '2001-12-26', 14, 2, 2019, 'B', NULL, NULL),
('1194061', 'Nur Raisa', 'Jl. Anggaran/Padang No.1', 'Padang ', '2000-05-28', 14, 2, 2019, 'B', NULL, NULL),
('1194062', 'Oktaviami Manullang', '', 'Pulau baru', '2001-10-30', 14, 2, 2019, 'B', 'oktaviamimanullang30@gmail.com', '081318960667'),
('1194063', 'Rachmatika Intan Sari', 'Jl. Raya Banteran RT 02/05 Kec. Sumbang Kab. Banyumas Jawa Tengah', 'Bandung', '2000-11-10', 14, 2, 2019, 'B', 'rachmatikaintans.ris@gmail.com', ''),
('1194064', 'Rendi Baji Syadewo', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194065', 'Ririn Indriyani', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194066', 'Salsabila Vebi Natasya', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194068', 'Yunia Salsabila Ritonga', NULL, NULL, NULL, 14, 1, 2019, 'B', NULL, NULL),
('1194069', 'Zaky Muhammad Yusuf', 'jl.lumba-lumba ', 'tanggerang ', '2001-03-02', 14, 2, 2019, 'B', NULL, NULL),
('1194070', 'Dellavianti Nishfi Ilmiah Huda', 'Ds.Wunut RT.02 RW.01 Dsn.Wunut Kecamatan.Mojoanyar Kabupaten.Mojokerto Jawa Timur', 'MOJOKERTO', '2001-09-20', 14, 2, 2019, 'B', 'dvinishfi@gmail.com', '085745364949'),
('1234567', 'Simpro Sample MHS', 'Jl Cianjur no 29', 'Cianjur', '1988-03-24', 14, 2, 2019, 'E', NULL, NULL),
('7654321', 'Simpro Sample MHS #2', '', '', '0000-00-00', 14, 2, 2019, 'F', NULL, NULL);

--
-- Trigger `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `user_add_mahasiswa` AFTER INSERT ON `mahasiswa` FOR EACH ROW BEGIN INSERT INTO app_simpro.user VALUES(new.npm, new.npm, 'M', 'default'); END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_delete_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW begin
DELETE FROM app_simpro.user WHERE id_user = old.npm;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul_prasyarat`
--

CREATE TABLE `matkul_prasyarat` (
  `id_prasyarat` int(11) NOT NULL,
  `id_matkul` varchar(55) DEFAULT NULL,
  `id_kegiatan` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(50) NOT NULL,
  `pesan` varchar(50) NOT NULL,
  `tema_notifikasi` varchar(20) NOT NULL,
  `target` varchar(16) NOT NULL,
  `status_pesan` int(1) NOT NULL,
  `status_notifikasi` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `obyek_penelitian`
--

CREATE TABLE `obyek_penelitian` (
  `id_penelitian` int(4) NOT NULL,
  `nama_penelitian` varchar(150) NOT NULL,
  `id_prodi` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `obyek_penelitian`
--

INSERT INTO `obyek_penelitian` (`id_penelitian`, `nama_penelitian`, `id_prodi`) VALUES
(0, 'Gak Ada', 0),
(1, 'Internet of Things', 14),
(5, 'Robotics', 14),
(6, 'Computer Networks', 14),
(7, 'Geospatial Intelligence', 14),
(8, 'Machine Learning', 14),
(9, 'Data Science', 14),
(10, 'Social Network Analysis', 14),
(11, 'E-Learning', 14),
(12, 'Information System', 14),
(13, 'Big Data', 14),
(14, 'Enterprise Architecture', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembimbing_kegiatan`
--

CREATE TABLE `pembimbing_kegiatan` (
  `id_pembimbing_kegiatan` int(11) NOT NULL,
  `nik` char(32) DEFAULT NULL,
  `id_kegiatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembimbing_kegiatan`
--

INSERT INTO `pembimbing_kegiatan` (`id_pembimbing_kegiatan`, `nik`, `id_kegiatan`) VALUES
(5, '3217061702990007', 18),
(7, '3217061702990006', 18),
(9, '3217061702990004', 29);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` char(2) NOT NULL,
  `nama_prodi` varchar(80) NOT NULL,
  `total_semester` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `total_semester`) VALUES
('13', 'D-III Teknik Informatika', 6),
('14', 'D-IV Teknik Informatika', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `proyek`
--

CREATE TABLE `proyek` (
  `id_proyek` int(16) NOT NULL,
  `judul_proyek` text DEFAULT NULL,
  `abstrak` text DEFAULT NULL,
  `keyword_abstrak` text DEFAULT NULL,
  `latar_belakang` text DEFAULT NULL,
  `identifikasi_masalah` text DEFAULT NULL,
  `daftar_pustaka` text DEFAULT NULL,
  `id_penelitian` int(4) DEFAULT NULL,
  `id_kegiatan` int(8) NOT NULL,
  `id_dosen_pembimbing` char(16) DEFAULT NULL,
  `id_dosen_penguji` char(16) DEFAULT NULL,
  `tgl_sidang` date DEFAULT NULL,
  `tgl_sidang_ulang` date DEFAULT NULL,
  `nilai_pembimbing` decimal(5,0) DEFAULT NULL,
  `nilai_penguji` decimal(5,0) DEFAULT NULL,
  `ruangan` varchar(4) DEFAULT NULL,
  `npm_ketua` char(7) NOT NULL,
  `status_proyek` int(1) DEFAULT NULL,
  `npm_anggota` char(7) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `proyek`
--

INSERT INTO `proyek` (`id_proyek`, `judul_proyek`, `abstrak`, `keyword_abstrak`, `latar_belakang`, `identifikasi_masalah`, `daftar_pustaka`, `id_penelitian`, `id_kegiatan`, `id_dosen_pembimbing`, `id_dosen_penguji`, `tgl_sidang`, `tgl_sidang_ulang`, `nilai_pembimbing`, `nilai_penguji`, `ruangan`, `npm_ketua`, `status_proyek`, `npm_anggota`, `created_date`, `last_update`) VALUES
(22, 'ANALISIS PERANCANGAN APLIKASI MANAJEMEN KEUANGAN BERBASIS WEB (STUDI KASUS KOSAN 54)', 'Manajemen Keuangan adalah perencanaan keuangan dalam penganggaran, pemeriksaan, manajemen, pengendalian, dana simpanan yang dimiliki untuk pengambilan keputusan secara efektif dan efisien. Seperti proses pengelolaan keuangan yang ada di Kosan 54 masih dilakukan secara manual sehingga sering terjadi kesalahan dalam hal pencatatan maupun pembuatan tagihan dan laporan keuangan mereka sendiri, serta proses pembayaran tagihan oleh anggota kost.\r\nOleh karena itu, diperlukan sebuah sistem yang bisa melakukan pemrosesan data secara terintegrasi dan terkomputerisasi dengan baik dengan penggunaan sistem berbasis WEB. Sistem yang dirancang adalah Aplikasi Manajemen Keuangan berbasis WEB. Untuk membangun Aplikasi tersebut, digunakan beberapa software antara lain database MySQL, serta menggunakan bahasa pemrograman PHP.\r\nDengan adanya aplikasi pengelolaan keuangan ini akan membantu perencanaan pendapatan dan biaya keuangan yang tepat untuk dikeluarkan.\r\n', 'Aplikasi Manajemen Keuangan, MySQL, PHP', 'Kami akan melakukan anaslisis tentang aplikasi ini, bersamaan dengan kemajuan dan perkembangan teknologi, kebutuhan manusia pada teknologi menjadi kebutuhan yang sangat bermanfaat. Pemanfaatan teknologi hampir dibutuhkan dalam semua aspek baik di bidang pendidikan, kesehatan, ekonomi, sosial dan budaya. Pada saat ini KOSAN 54 beranggotakan 10 orang masih menggunakan system pembukuan dan perhitungan secara manual dalam hal mengelola keuangan mereka, seperti pemasukan perbulan, pengeluaran dan lain sebagainya sehingga sering terjadi kesalahan dalam hal perhitungan, pembukuan serta laporan keuangan mereka sendiri\r\nInternet, merupakan sarana informasi yang sangat berkembang saat ini. Berbagai macam hal dapat dilakukan dengan menggunakan internet, seperti pencarian informasi, forum diskusi, sarana pendidikan, transaksi penjualan, dan sebagainya. Transaksi melalui internet merupakan salah satu manfaat yang penting dalam penggunaan internet, dimana seorang pembeli bisa melakukan transaksi tanpa harus pergi ke suatu tempat tujuan untuk melihat barang-barang yang akan dibeli atau dipinjam, namun pembeli tersebut cukup memesan pada website yang bersangkutan, melakukan pembayaran dan barang akan dikirimkan ke alamat pembeli.\r\nPengelolaan keuangan merupakan suatu kegiatan yang harus benar-benar ditekankan dan diperhatikan oleh setiap organisasi khususnya yang dimana akan membantu mereka dalam mencapai hal-hal atau keinginan-keinginan mereka di kemudian hari.\r\nUntuk itulah, maka dibuat suatu website yang dapat menanggulangi masalah tersebut. Website ini akan memberikan kemudahan kepada pengurus Kosan 54, dimana mereka dapat mengakses situs ini guna mengatur keuangan mereka agar dapat terkelola dengan baik dan tanpa perlu menggunakan pulpen, kalkulator maupun kertas lagi karena telah terintegrasi dan terkomputerisasi dengan baik dalam bentuk Website.\r\n', 'Berdasarkan latar belakang diatas, maka pembahasan penulisan ini dibatasi sebagai berikut:\r\n1.	Informasi dari web hanya digunakan untuk menampilkan informasi tagihan bagi anggota Kosan 54.\r\n2.	Sistem hanya melayani pencatatan keuangan oleh pengelola kost.\r\n3.	Dalam pembagian tugas kami akan membagi bagian yang akan kami kerjakan masing masing\r\no	Muhammad Nazim Maulana: Akan mengatur proses crud dalam lingkup menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota yang ada dalam kosan 54. Selain itu, pengolahan data user mulai dari menambahkan user baru, update user, menampilkan user dan juga menghapus user yang ada di dalam kosan 54 ini. Bukan itu saja, pengolahan data transaksi juga mulai dari menambahkan data transaksi baru, update data transaksi, menampilkan data transaksi, dan menghapus data transaksi.\r\no	Krisna bayu Pratama : Akan mengatur proses crud yang dalamnya mencakup data kamar, mulai dari menambahkan data kamar baru, update data kamar, menampilkan data kamar, dan juga menghapus data kamar. Selain itu data kas masuk, mulai dari menambahkan data kas masuk, update data kas masuk, menampilkan data kas masuk dan juga menghapus data kas masuk. Serta mengurusi data kas keluar, mulai dari menambahkan data kas keluar, update data kas keluar, menampilkan data kas keluar dan menghapus data kas keluar.\r\n', '[1] 	HM, Jogiyanto.1991. Analisis & disain sistem informasi: pendekatan 	terstruktur 	teori dan praktik aplikasi bisnis. Yogyakarta: ANDI\r\n[2] 	Solikin, dan Suseno. 2002. UANG: Pengertian, Penciptaan, dan Peranannya 	dalam 	Perekonomian. Jakarta: Pusat Pendidikan dan Studi 	Kebanksentralan 	(PPSK) 	BANK INDONESIA\r\n[3] 	Al-Maqassary, Ardi. 2013. PENGERTIAN MANAJEMEN, (online), 	(http://www.e-jurnal.com/2013/11/pengertian-manajemen.html, diakses 	tanggal 	12 Oktober 2017).\r\n[4] 	Andiani dan Eko. 2012. PERANCANGAN SISTEM INFORMASI 	BERBASIS WEBSITE SUBSISTEM SEKOLAH PESANTREN 	PERSATUAN ISLAM 9 RANCABANGO. Garut: Jurnal Algoritma. Vol. 09, 	No. 	40-2.\r\n[5] 	Gafar, Abdoel. 2008. Penggunaan Internet Sebagai Media Baru dalam 	pembelajaran. Batanghari: Jurnal Imiah Universitas Batanghari, Jambi. Vol. 	08, 	No. 02-38.\r\n[6] 	Heriyanto. Imam dan Raharjo, Budi dan Enjan. 2010. Modul Pemrograman 	WEB (HTML, PHP & Mysql). Bandung: Modula. Kadir.\r\n[7] 	Arief, Rudyanto. 2011. Pemrograman Web Dinamis Menggunakan PHP dan 	MySQL. Yogyakarta: Andi.\r\n[8] 	Nugroho, Adi. 2007. Pemorograman Berorientasi Obyek. 	Bandung:Informatika.\r\n[9] 	Fathansyah. 2007. Buku Teks Komputer Sistem Basis Data/Lanjutan. 	Bandung: 	Informatika.\r\n[10] 	Ramadhan, Arief. 2006. Pemrograman Web Database dengan PHP dan 	MySQL. Jakarta: PT.Elex Media Komputindo.\r\n[11] 	Wahyu. 2010 Jenis-Jenis Metode Penelitian Beserta Contohnya, (Online), 		(http://penjuan-mimpi.net/jenis-jenis-metode-penelitian-beserta.html, diakses 	10 	Desember 2017).\r\n[12] 	Pahlevy, Randy, Tesar. 2010. Rancang Bangun Sistem pendukung Keputusan 	Menentukan penerima Beasiswa dengan Menggunakan metode Simpele 	Additive Weighting (SAW). Skripsi Program Studi Tehnik Informatika. 	Surabaya,Indonesia: Universitas Pembangunan Nasional “Veteran”.\r\n[13]	Arel Riedsa Adiguna, Mochamad Chandra Saputra dan Fajar Pradana. 2018. 	Analisis dan Perancangan Sistem Informasi Manajemen Gudang pada PT 	Mitra Pinasthika Mulia Surabaya. Jurnal Pengembangan Pengembangan 	Teknologi Informasi dan Ilmu Komputer. Vol. 02, No. 02. Diambil dari: 	http://j-ptiik.ub.ac.id (Diakses tanggal 22 januari 2018).\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1, 4, '415048901', NULL, NULL, NULL, NULL, NULL, NULL, '1194025', 2, '1194020', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(25, 'ANALISIS FITUR COSTUMER ADMINISTRASI  PADA APLIKASI ANTRIAN BERBASIS WEB', 'Pada jaman sekarang ini, banyak sekali aplikasi – aplikasi yang memiliki fungsi yang berbeda – beda yang tentunya untuk mempermudah dalam mengatasi suatu masalah. Akan tetapi dari banyaknya aplikasi tersebut tentu dibutuhkan proses analisis terlebih dahulu bagaimana aplikasi tersebut akan berkerja nantinya, sehingga semata – mata kita tidak hanya menggunakan aplikasi tersebut tetapi juga mengetahui bagaimana aplikasi tersebut dapat berjalan.\r\n	Seiring berjalannya waktu, sudah banyak aplikasi – aplikasi yang sudah mulai dikembangkan sampai saat ini karena melalui proses dan tahapan analisis yang baik dan tepat sasaran. Untuk itu, dalam melakukan proses analisis kita dituntut untuk mengetahui bagaimana struktur, alur, dan sistem yang sedang berjalan pada aplikasi yang akan di analisis.', 'Analisis, Aplikasi, Sistem, Struktur.', 'Pada jaman sekarang ini, banyak sekali aplikasi – aplikasi yang memiliki fungsi yang berbeda – beda yang tentunya untuk mempermudah dalam mengatasi suatu masalah. Akan tetapi dari banyaknya aplikasi tersebut tentu dibutuhkan proses analisis terlebih dahulu bagaimana aplikasi tersebut akan berkerja nantinya, sehingga semata – mata kita tidak hanya menggunakan aplikasi tersebut tetapi juga mengetahui bagaimana aplikasi tersebut dapat berjalan.\r\n	Salah satu masalah yang sering terjadi adalah tidak teraturnya dalam porses pengantrian yang terjadi pada instansi atau perbankan. Pada aplikasi Antrian Bank ini,  sangat membantu dalam proses pengantrian dalam melakukan kegiatan transaksi terhadap loket – loket yang tersedia pada bank  tersebut. Sehingga nantinya proses kegiatan antrian yang ada pada bank tersebut berjalan dengan terstruktur, sistematis dan teratur.\r\n', 'Akmal Restu Dewantoro (1194003)  -  Menganalisis  system loket administrasi  yang berjalan pada  aplikasi antrian bank dan bagaimana cara kerja aplikasi loket administrasi tersebut digunakan oleh costumer  kemudian selanjutnya menganalisisi bagaimana cara kerja templating tampilan pada pengaturan panel menu  di dalam  aplikasi.\r\nM. Rizky (1194021)  -  Menganalisis  system data costumer administrasi yang berjalan pada aplikasi  antrian bank dan bagaimana cara memanipulasi data costumer tersebut dan  juga menganalisis bagaimana cara manajemen data akun, seperti memverifikasi akun yang baru terdaftar pada aplikasi antrian bank dengan fitur yang bernama Setting penggunaan akun.\r\n', '[1] https://id.wikipedia.org/wiki/MySQL\r\n[2] https://id.wikipedia.org/wiki/Pengadaan\r\n[3] https://www.duniailkom.com/tutorial-mysql-pengertian-sql-structured-query-language/\r\n[4] https://www.malasngoding.com/php-oop-part-2-pengertian-class-object-property-dan-method/\r\n[5] https://id.wikipedia.org/wiki/PHP\r\n[6] https://id.wikipedia.org/wiki/JavaScript\r\n[7] https://id.wikipedia.org/wiki/AJAX\r\n[8] https://www.php.net/ ', 12, 4, '407117405', NULL, NULL, NULL, NULL, NULL, NULL, '1194021', 2, '1194003', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(26, 'analisis aplikasi topkarir', 'Lowongan kerja merupakan suatu informasi yang digunakan untuk mendaftarkan diri ke perusahaan tersebut untuk melamar pekerjaan. Lowongan kerja online merupakan Lowongan yang memanfaatkan teknologi dalam hal mencari Lowongan kerja. lowongan kerja online dapat dilakukan dengan registrasi online website lowongan kerja online itu. Registrasi online merupakan pendaftaran yang dilakukan di website lowongan kerja online tersebut untuk menjadi member di flatform lowongan kerja tersebut. Pelamar tinggal menggunakan smartphone atau laptop untuk melakukan registrasi. Salah satu lowongan kerja online sendiri diantaranya website Topkarir yang terdapat fitur pencari karir. Penelitian ini ditunjukan untuk bagaimana menganalisa sistem registrasi yang ada di Website TopKarir', 'proses input form, proses crud dan data pada form', 'Internet menjadi salah satu media bantu yang sangat bermanfaat untuk semua orang. Salah satunya adalah komunikasi antar personal melalui internet dengan jarak yang dekat maupun jauh sekalipun. Kita juga dapat dengan mudah mendapatkan informasi yang kita inginkan, contohnya yaitu informasi lowongan pekerjaan. \r\nLowongan Kerja memang dibutuhkan untuk orang – orang yang ingin mencari kerja untuk memenuhi kebutuhan – kebutuhan, baik yang sudah berkeluarga maupun yang belum berkeluarga. Lowongan kerja nya pun ada yang bersifat offline dan online. Unuk offline sendiri diharuskan pelamar untuk mendatangi sebuah perusahaan untuk melamar kerja dan membawa berkas-berkas yang dibutuhkan. Sedangkan online sendiri kita hanya cukup melakukan suatu registrasi di sebuah website pencari kerja untuk melamar kerja dan registrasinya itu bisa dipakai ke beberapa perusahaan.\r\nRegistrasi website sendiri hadir bagi para pelamar untuk mencari lowongan kerja itu, dimana website sendiri menjadi media online yang sekarang banyak dimanfaatkan untuk mencari informasi lowongan pekerjaan. Tidak hanya itu, dalam website ini, pengguna juga bisa melakukan registrasi di website nya itu kemudian setelah menjadi member bisa digunakan untuk melamar ke beberapa perusahaan. Hal ini bisa membantu pelamar dalam mencari pekerjaan. \r\n', '1.4	RUANG LINGKUP\r\nCakupan penganalisisan website bagian registrasi atau pendaftaran. \r\n1.	  Registrasi website dari awal mendaftar sampai menjadi member\r\n2. 	System dari inputan daftar riwayat hidup dan pengalaman kerja dan system CRUD\r\n3. 	System pengelolahan data document\r\nUntuk menghindari pembahasan yang terlalu luas, maka ruang lingkup ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut:\r\n\r\n1. Zaky Muhammad Yusuf\r\n1.1 Pengolahan Data Form Registrasi\r\nPada formulir registrasi ini terdapat form atau kotak untuk mengisikan sebuah identitas atau data yang dimana itu terdapat master data (Create, Read, Update, Delete) yaitu, sebagai berikut :\r\n•	Data profinsi yaitu: dapat menambahkan data profinsi, update data profinsi, menampilkan data, hapus data profinsi.\r\n•	Data Nama Luar Negri, yaitu: dapat menambahkan data negara, update data negara ampilkan data negara dan hapus data negara. \r\n•  Data Gaji ekspetasi, yaitu: dapat menambahkan data gaji, update data gaji, menampilkan data gaji dan hapus data gaji.\r\n1.2 Pengolahan Data Spesialis\r\n	Menu ini berfungsi untuk memberikan keterangan informasi data-data mencakup pendalaman / spesifik yang terdapat pada pelamar tersebut.\r\n•	Data Spesialis, yaitu: dapat menambahkan data spesifik, update data, menampilkan data dan hapus data.\r\n•	Data SubSpesialis, yaitu: dapat menambahkan data kategori SubSpesialis, update data kategori SubSpesialis, menampilkan data kategori SubSpesialis dan hapus data Kategori SubSpesialis.\r\n\r\n2. Ilham Ambar Rochmat\r\n2.1 Pengolahan Data Pekerja\r\n	Dalam proses ini terdapat fungsi CRUD (Create, Read, Update, Delete) untuk mengelola data pekerja\r\n•	Tambah data pengalaman kerja, Disini untuk menambahkan pengalaman kerja\r\n•	Pengalaman Berorganisasi, Disini untuk  menambah kan pada profil pengalaman berorganisasi\r\n•	Bahasa, Di bagian bahasa dapat menambahkan bahasa yang digunakan \r\n•	Media Sosial, Dapat menambahkan atau merubah account seperti: account instagram, account twiter, account facebook, account line.\r\n2.2 Pengolahan Data Dokumen\r\nDalam data dokumen ini untuk mengumpulkan atau mengupload data domen sebagai berikut.\r\n•	CV, Di form tersebut dapat mengupload data CV, dengan berbentuk file doc,docx, pdf.\r\n•	Dokumen Sertipikat, Di form tersebut juga dapat mengupload data Dokumen Sertipikat dengan ukuran file yang di batasi tidak boleh lebih dari 1MB (Doc/Docx/PDF/RAR/ZIP) \r\n', '[1]	Wijaya, Nova, Taqwiym, Akhsani, “Perancangan Lowongan Kerja Online Berbasis Web Pada PT ANH” Bandung : Jurnal Ilmiah Informatika Volume 2 No.1 / Juni 2016.\r\n[2]	Triyono, Ramadian Agus, Purnama, Bambang Eka, Habibie, Farid Hamzah, “Pembangunan SIstem Informasi Penerimaan Calon Tenaga Kerja Secara Online Berbasis Web Pada Bursa Kerja Khusus SMK Ganesha Tama Boyolali” Surakarta : Jurnal Teknologi Informasi dan Komunikasi, ISSN : 2087 – 0868, Volume 5 Nomor 2 Agustus 2014.\r\n[3]	Rispianda, Alfarisyi, Muhammad Imam, Amilla, Khuria, “Rancamgan Sistem Informasi Layanan Alumni Itenas Berbasis Web”, Bandung : Jurnal Online Institut Teknologi Nasional No.01 Vol.02 Juli 2014\r\n', 12, 4, '415048901', NULL, NULL, NULL, NULL, NULL, NULL, '1194069', 2, '1194046', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(27, 'Analisis Sistem Informasi Akademik (Siakad) Berbasis Website Modul Registrasi dan KRS', 'Pada zaman serba teknologi ini, pengolahan data akademik dengan metode konvensional dinilai tidak efektif. Terkadang dalam pengolahan nilai konvensional ini banyak terjadi kendala seperti, buku nilai rusak, data hilang, terlalu banyak data yang harus diinput sehingga hasil kadang tidak akurat. Tujuan pada penelitian kali ini adalah untuk menganalisis sistem informasi akademik berbasis website agar dapat membantu mengembangkan aplikasi yang dimaksud.\r\nUntuk mengatasi masalah-masalah diatas dalam persoalan sistem akademik konvensional, maka dibangunlah sistem informasi akademik berbasis web. Yang di bangun menggunakan bahasa pemrogrammn PHP(Hypertext Preprocessor) dengan framework CodeIgniter dan MySql sebagai database di dalam web ini. ', 'PHP(Hypertext Preprocessor), CodeIgniter, Sistem Informasi Akademik, MySql', 'Pada zaman serba teknologi ini, pengolahan data akademik dengan metode konvensional dinilai tidak efektif. Banyak kendala yang dihadapi dalam pengolahan data secara konvensional seperti waktu untuk menginput data relatif lebih lama, data yang tidak akurat, sulit untuk mengakses data, dan sulit untuk mencari data.\r\nPerguruan tinggi adalah sebuah lembaga yang bergerak di bidang akademik. Maka, dibutuhkan sebuah sistem informasi guna menunjang berbagai aktivitas akademik di perguruan tinggi seperti registerasi mahasiswa, pengisian kartu rencana studi (KRS), menyimpan nilai mahasiswa, dan aktivitas akademik lainnya.\r\nPada aplikasi sistem informasi akademik berbasis website ini, data-data sudah terkomputerisasi. Namun aplikasi tersebut dinilai kurang efisien, sehingga dapat mengurangi kualitas pelayanan baik itu terhadap mahasiswa maupun terhadap pegawai perguruan tinggi. Oleh karena itu dibutuhkan analisis untuk mengetahui kelebihan dan kelemahan sistem informasi akademik berbasis website tersebut.\r\nAtas permasalahan-permasalahan diatas, maka penulis memutuskan untuk mengambil topik penelitian yang berjudul “Analisis Sistem Informasi Akademik (Siakad) Berbasis Website Modul Registrasi dan KRS”. Penelitian ini diharapkan dapat membantu pembaca untuk memehami konsep sistem informasi akademik berbasis web, juga dapat membantu pengembang untuk mengembangkan aplikasi yang dimaksud.', 'Pembatasan dari pembahasan permasalahan tersebut bertujuan untuk memudahkan orang lain mengerti apa yang di teliti dalam permasalahan kali ini, serta terarah agar menghindari dari kemungkinan pembahasannya terlalu luas dan terhindar dari suatu kesalah pahaman dalam penelitian ini. Hal yang perlu di perhatikan antara lain, yaitu :\r\n1.7.1	Proses penelitian ini dilakukan untuk mengidentifikasi suatu kekurangan dan permasalahan dari Sistem Informasi Akademik (Siakad) Berbasis Website.\r\n1.7.2	Aplikasi ini adalah suatu hal yang berguna bagi banyak orang untuk pengolahan data akademik dan efisiensi waktu.\r\n1.7.3	Dan penganalisisan aplikasi ini untuk memenuhi Proyek I. \r\n\r\nMengingat luasnya sistem informasi akademik (Siakad) yang akan dianalisis, maka penulis membagi tugas dalam menganalisis sistem informasi akademik (Siakad).\r\n1.7.4	Esadhira Giovany Syuhada akan menganalisis pengelolaan data user, pengelolaan data mahasiswa, dan registrasi ulang mahasiswa.\r\n1.7.5	Muhammad Fahri Ramadhan akan menganalisis pengelolaan data program studi, pengelolaan data kelompok mata kuliah, dan sistem kartu rencana studi (KRS).', '[1]	Arief, M.Rudianto. 2011. Pemrograman Web Dinamis Menggunakan Php dan Mysql.\r\n[2]	Bethasidik, Ir.2003.MYSQL.BandungToko:Buku BI-Obses\r\n[3]	Fathansyah, Ir. 1999. Basis Data. Bandung : Infomatika Bandung.\r\n[4]	SIAKAD V 0.1 (2014), Softmediaservice.net.', 1, 4, '424038805', NULL, NULL, NULL, NULL, NULL, NULL, '1194055', 2, '1194044', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(28, 'ANALISIS SISTEM APLIKASI BOOKING TIKET BIOSKOP BERBASIS DESKTOP', 'Seiring berkembangnya zaman, perkembangan di bidang hiburan semakin meningkat, contohnya dalam bidang perfilman. Masyarakat pada zaman dahulu lebih suka menonton film Bersama dengan menggunakan layer tancap dan ditonton di dalam sebuah lapangan, namun seiring berjalannya waktu masyarakat menonton film nya dengan cara pergi ke bioskop\r\nBioskop merupakan sebuah tempat untuk menampilkan sebuah film dengan menggunakan layar lebar dan gambar diproyeksikan menggunakan sebuah proyektor. Ketika masyarakat ingin menonton bioskop mereka rela berdesakan untuk membeli sebuah tiket untuk menonton film. Tetapi setelah aplikasi booking tiket dibuat, masyarakat tidak harus berdesakan lagi di antrian loket tiket. Aplikasi ini merupakan aplikasi yang mempunyai sistem berbasis Java.', 'IDE, Sistem informasi, Java, Transaksi tiket', 'Menonton film merupakan sebuah hiburan yang sangat digemari oleh banyak masyarakat, pada saat ini sudah terdapat banyak film yang sudah ditayangkan di seluruh dunia. Penayangan ini biasanya dilakukan dalam sebuah tempat yang dinamakan bioskop. Bioskop merupakan tempat yang digunakan untuk memutar film yang akan ditonton. Di dalam bioskop terdapat proyektor dan layar lebar sehingga film dapat dinikmati banyak penonton.\r\nNamun dibalik hal tersebut ada proses yang harus di lewati saat akan menonton sebuah film, yaitu pembelian tiket. Berbeda dengan kondisi di tahun 90-an dimana proses penbelian tiket dilakukan secara langsung mengantri di loket, dengan aplikasi pemesanan tiket memungkinkan penonton mengklik menu pesanan tiket dan membayarnya tanpa harus mengantri di bioskop. Aplikasi menyediakan keterangan film apa yang akan di tonton, nama ruangan yang digunakan saat menonton, dan nomor kursi untuk menandakan posisi di mana kita akan duduk. Dalam proses pembelian\r\ntiket masyarakat rela mengantri secara panjang dan berdesakan demi menonton sebuah film yang disukainya. Oleh karena itu aplikasi ini mempunyai sistem yang akan mempermudah masyarakat dalam membeli sebuah tiket untuk menonton film.\r\nMaka dari itu, kami mengambil judul dengan “ANALISIS SISTEM APLIKASI BOOKING TIKET BIOSKOP BERBASIS DESKTOP”.', 'Pembagian Tugas Analisis:\r\nM. Yaqdhan Taqy Ariana, akan menganalisis proses CRUD (Create, Read, Update, Delete.), Relasi tabel, dan kodingan dalam:\r\n1. Data Film\r\nPada menu ini terdapat proses CRUD (Create, Read, Update, Delete.) untuk meng-Update, menghapus, atau menambah Data Film dan juga untuk dipilih atau diubah pilihan judul filmnya oleh pemesan. Data Film merupakan sebuah data master yang terdapat data berupa judul film, genre film dan kode film yang akan tampak di tiket film.\r\n2. Data Pemesan (Data Master)\r\nDalam menu ini terdapat sebuah proses CRUD, berupa penambahan, pengeditan, dan penghapusan data yang ada pada data master seperti data pemesan dan email pemesan yang ter-input saat pendaftaran oleh pemesan.\r\n3. Transaksional Pemesanan\r\nTransaksi pemesanan akan melibatkan data film, dan data pemesan sehingga bagaimana data film dan data pemesan diambil di proses pemesanan akan dinalisis..\r\nAhmad Fathoni Rizaldi, akan menganalisis proses CRUD (Create, Read, Update, Delete.), Relasi tabel, dan kodingan dalam:\r\n1. Pengolahan Data Film (Master Data)\r\nPada menu ini terdapat proses CRUD untuk mengelola daftar film yang nantinya akan dipilih dan ditampilkan dalam bentuk tabel yang akan ditampilkan kepada seorang pengguna seperti pemilihan lokasi pemutaran, daftar film, Bahasa dalam film, dan genre film. Pada menu ini hanya dapat diakses oleh user yang berlevel Admin.\r\n2. Booking Menu (Master Data)\r\nPada bagian ini terdapat proses CRUD berupa pemilihan tempat duduk, pemilihan waktu tayang, dan pemilihan tempat untuk menayangkan film yang nantinya akan disatukan dengan data pemilihan film menjadi sebuah tiket dan ditampilkan dalam bentuk tabel.\r\n3. Menu Konfirmasi Pembayaran\r\nPada bagian ini akan dianalisis kodingan transaksi pembayaran tiket bioskop dengan menganalisis kodingan serta relasi tabel database saat terjadi input otomatis di form pembayaran karena ada data yang tidak diulang penginputannya sebagai hasil input di pemesanan.', '1. A.S, Rossa.2018.Logika Algoritma dan Pemrograman Dasar.Bandung:Penerbit Modula.\r\n2. Hudiarto.2017.Apakah sistem informasi itu? https://sis.binus.ac.id/2017/09/12/apakah-sistem-informasi-itu-2/ diakses secara [online] pada 31 Maret 2020 pukul 15.55\r\n3. What is an IDE. https://www.codecademy.com/articles/what-is-an-ide diakses secara [online] pada 31 Maret 2020 pukul 16.23\r\n4. N, Sora.2014. Pengertian Transaksi Dan Bukti Transaksi Terlengkap. http://www.pengertianku.net/2014/12/pengertian-transaksi-dan-bukti-transaksi-terlengkap.html diakses secara [online] pada 31 Maret 2020 pukul 16.33\r\n5. Rocket Management. 2018. Pengertian Transaksi adalah: Jenisnya di Perusahaan. https://rocketmanajemen.com/pengertian-transaksi/ diakses secara [online] pada 31 Maret 2020 pukul 17.00\r\n6. http://library.binus.ac.id/eColls/eThesisdoc/Bab2HTML/2008100172KABAB2/page50.html. diakses secara [online] pada 31 Maret 2020 pukul 17.04', 12, 4, '402047205', NULL, NULL, NULL, NULL, NULL, NULL, '1194002', 2, '1194027', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(29, 'ANALISIS SISTEM APLIKASI G-POS', 'Pada saat  ini, konter pulsa merupakan tempat yang sering dikunjungi dikarenakan kebutuhan setiap orang akan pulsa dan paket internet yang semakin meningkat.Kegiatan yang sering dilakukan di konter pulsa salah satu nya adalah pengolahan data laporan penjualan ataupun pencatatan penjualan yang masing sering dilakukan secara manual, artinya masih ditulis tangan.\n	Proses pencatatan penjualan secara manual ini artinya melibat kan seorang kasir untuk menginput data-data penjualan dari mulai nama barang, stock barang, harga barang, total harga, tanggal penjualan sampai dengan untung maupun rugi. Akan tetapi proses ini masing sering terjadi kesalahan pada proses input data yang akan menyebabkan laporan yang dihasilkan tidak sesuai dengan data dilapangan. Maka dari itu, Aplikasi berupa website yang berguna untuk mempermudah kasir dan admin dalam kegiatan pengolahan data laporan penjualan ini agar tidak terjadi kesalahan pada proses input yang terjadi di metode manual atau tulis tangan.\n', 'Metode, Manual, Aplikasi, Website', 'Pada jaman sekarang ini, ternyata masing banyak konter-konter pulsa yang masih menggunakan metode manual dalam pencatatan penjualannya. Masih dapat ditemukan juga bahwa kegiatan pencatatan penjualan ini sering terjadi kesalahan pada proses input data . Metode ini malah akan menambah biaya pada pembelian buku dan juga alat tulis / catatan tersebut bisa sewaktu-waktu hilang.\nSelain itu, kegiatan pengecekan barang yang tersedia pada konter-konter pulsa saat ini masih juga secara manual. Artinya ada seseorang yang akan membuat list barang seperti menuliskan stock barang, jumlah minimal pembelian, harga asal barang dan satuan barang seperti pack dan pcs. Tentu saja hal ini bisa saja terjadi kesalahan pada saat listing barang.\nDengan adanya masalah tersebut, maka dari itu aplikasi G-pos dapat menyelasikan masalah tersebut. Aplikasi ini dapat digunakan sebagai pelengkap maupun alternatif dalam kegiatan pencatatan penjualan. Aplikasi ini akan mengurangi tingkat kesalahan pada saat pencatatan, mempermudah melihat list barang dan juga laporan keungan.\n', '1. Faisal Abdullah\n1.1 Data Barang\nPada menu ini terdapat proses CRUD( Creat, Read, Update, Delete) untuk memanpulasi data master barang yaitu dari mulai memanipulasi kode barang, nama barang, harga awal, harga jual, stok minimal, stok barang (yang tersedia) dan unit (PCS dan Pack)\n1.2 Master Data User\n\nDalam menu ini terdapat proses CRUD untuk menghapus user, mengedit user, dan menambahkan user. User disini terdapat 2 level yaitu Admin dan Kasir. Berikut merupakan master data yang ada pada menu ini yaitu: nama, username, password, level.\n1.3 Rekap dan Laporan\nPada pengolahan laporan dibagian admin ini merupakan laporan yang ditunjukan secara perbulan. Terdapat 2 table yang terlibat yaitu table Laporan Bulanan dan table data transaksi(nama bulan/tahun) sehingga sebuah laporan dapat tersusun.\n2. Ade Ilham Permadi\n2.1 Data Pegawai\nMenu ini terdapat fungsi CRUD untuk mengelola data pegawai seperti foto petugas, nama lengkap, alamat dan no telepon. Serta dapat menambahkan pegawai dan menghapus pegawai.\n2.2 Transaksi\nMenu ini berfungsi mengelola proses transaksi. Terdapat proses CRUD yaitu pada saat pembelian dengan cara mengiput nama barang, harga barang, dan jumlah barang yang dibeli(Qty) dan memasukannya ke dalam cart. Kemudian akan ditampilkan berupa table yang dapat dimanipulasi berupa menghapus.\n2.3 Laporan\nBerbeda dengan laporan pada bagian admin, laporan ini mencatat kegiatan transaksi secara per hari. Dalam laporan ini terdapat 2 table yang saling berkaitan sehingga dapat membentuk suatu laporan yaitu table Laporan Harian dan table Detail Laporan Perhari.\n', 'DAFTAR PUSTAKA\n[1]	Ristanto Tamba. 2014, Perancangan dan Pembuatan Aplikasi Kasir Berbasis Java,(Online),(https://www.academia.edu/31749396/PERANCANGAN_DAN_PEMBUATAN_APLIKASI_KASIR_BERBASIS_JAVA), diakses pada tanggal 31 Maret 2020 pukul 17:01\n[2]	Anwar Muthohari, Bunyamin, Sri Rahayu. 2016, Pengembangan Aplikasi Kasir Pada Sistem Informasi Rumah Makan Padang Ariung,(Online),( https://jurnal.sttgarut.ac.id/index.php/algoritma/article/view/319), diakses pada tanggal 31 Maret pukul 18:25\n[3]	Arief M Rudianto. 2011. Pemrograman Web Dinamis menggunakan PHP dan MySQL. C.V ANDI OFFSET. Yogyakarta\n[4]	Barakbah, Ali Ridho. 2018. Logika dan Algoritma. Jakarta: Media Pens LogikaAlgoritma\n[5]	HM  Jogiyanto. 1999. Analisis dan Desain Sistem Informasi : Pendekatan Terstruktur Teori dan Praktek Aplikasi Bisnis, ANDI Yogyakarta, Yogyakarta\n[6]	Agung, Gregorius. 2000. Microsoft Frontpage 2000 Webbot. Jakarta: PT. Elex Media Komputindo\n', 12, 4, '416048803', NULL, NULL, NULL, NULL, NULL, NULL, '1194014', 2, '1194001', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(30, 'ANALISIS SISTEM   APLIKASI KASIR JASA CUCI KENDARAAN BERBASIS WEB', 'ABSTRAK\r\nKasir dalam KKBI(Kamus Besar Bahasa Indonesia) adalah seseorang yang memegang uang(kas) dan bertugas untuk menerima dan membayar uang. Kasir merupakan petugas, sedangkan kassa ialah tempat bekerja seorang kasir. Profesi seorang kasir adalah seseorang yang menerima uang pembayaran ketika terjadi suatu transaksi jual beli dan mengembalikan uang sisa sekaligus menyerahkan barang atau jasa kepada pembeli diloket kasir di suatu toko, super market\r\nDikarenakan pengelolannya yang cukup banyak dan rumit serta untuk mengatasi beberapa masalah yang timbul di atas maka solusi yang dapat diterapkan adalah dengan menggunakan aplikasi Kasir Jasa Cuci  berbasis web yang dapat diakses . Agar mendapatkan aplikasi yang berfitur lengkap, maka kami menganalisis aplikasi tersebut dengan cara menganalisis menggunakan flowmap agar dapat mengetahui bagaimana algoritma yang berjalan pada aplikasi tersebut. Selain itu kami menganalisis proses bisnis dalam aplikasi tersebut, dengan tujuan untuk memudahkan proses transaksi.\r\nDengan adanya Kasir Jasa Cuci, diharapkan dapat mempercepat proses transaksi pada kasir sehingga dapat menghemat waktu dan memaksimalkan kinerja serta dapat meningkatkan mutu pelayanan yang lebih baik kepada pengguna jasa.\r\nKata kunci  : Aplikasi, Kasir , sistem, Kasir jasa cuci kendaraan.\r\n', 'Aplikasi, Kasir , sistem, Kasir jasa cuci kendaraan.', 'Kasir menurut kamus besar bahasa Indonesia merupakan seorang yang memegang uang atau seseorang yang memiliki tugas menerima dan membayarkan uang. Selain kasir, ada juga istilah kassa.Kasir dan kassa mempunyai perbedaan yaitu. Kasir adalah profesinya, sedangkan kassa adalah tempat dimana seorang kasir bekerja.Profesi kasir di toko atau minimarket adalah seseorang yang bekerja menerima uang pembayaran saat transaksi pembelian produk barang atau jasa dan memberikan kembalian uang sisa pembayaran, sekaligus memberikan produk barang atau jasa yang telah dibeli oleh pelanggan (customer) diloket kasir suatu toko, super market, mini market, hotel, mall, restoran, rumah sakit,ataupun departement store. Seorang kasir juga memiliki pekerjaan lain selain seperti diatas yaitu menghitung pendapatan yang didapat dari total penjualan per hari, per minggu hingga per bulan. Pastinya banyak masalah-masalah yang sering kita temukan pada kasir manual saat terjadinya transaksi.\r\nPermasalahan yang terjadi dapat mengakibatkan tidak efektifnya waktu dalam proses transaksi. Banyak juga petugas kasir yang kewalahan untuk menuliskan secara manual data hasil transaksi.  Setoran bulanan yang didata secara manual pastinya akan mengalami banyak masalah seperti, berkurangnya jumlah pendapatan, hilangnya nota transaksi yang berupa kertas atau apapun, dan masih banyak lagi.\r\n\r\nBerdasarkan permasalah ini maka dibuatlah sebuah “Analisis Aplikasi Kasir Jasa Cuci berbasis web”, sehingga dapat berguna untuk mempermudah petugas Kasir untu mendata hasil transaksi.  Dengan adanya Aplikasi Jasa Cuci ini juga petugas kasir mudah mengumpulkan penghasilan bulanan dan juga mengeffiensikan waktu bagi petugas kasir. Dan diharapkan kedepannya dengan adanya analisis dan sistem ini dapat memaksimalkan kinerja petugas kasir dan juga bisa mengurangi masalah masalah yang telah terjadi.\r\n', 'Pembagian tugas analisis :\r\nR. Bimantoro Putra, Disini akan menganalisis proses pengolahan data sesuatu yang ada pada petugas kasir, dimana dapat dilakukan nya proses CRUD yaitu proses transaksi yang terdiri dari (Create, Read, Update dan Delete), dan pada data master admin yaitu proses Data Master Biaya Jasa, dan untuk proses transaksionalnya akan menganalisis proses cetak pada bagian user biasa(petugas).\r\nDzul Jalali Wal Ikram, akan menganalisis bagian admin yang memiliki proses transaksi dan data master yaitu proses Daftar User, dan untuk proses transaksionalnya akan menganalisis proses laporan pada bagian admin. CRUD yang ada pada bagian admin adalah menghapus , mengedit, dan menambahkan akun, akun yang ditambahkan dapat dipilih menjadi 2 macam yaitu user biasa (petugas) dan admin.\r\n', '\r\nIlham, M. (2020, Januari 20). 20 Pengertian Website Menurut Para Ahli [ Lengkap ]. Retrieved from materibelajar.co.id: https://materibelajar.co.id/pengertian-website-menurut-para-ahli/\r\nN, S. (2014, Desember 01). Pengertian Transaksi Dan Bukti Transaksi Terlengkap. Retrieved from pengertianku.net: http://www.pengertianku.net/2014/12/pengertian-transaksi-dan-bukti-transaksi-terlengkap.html\r\nRohmah. (2016, November 21). Pengertian Kasir. Retrieved from scribd.com: https://www.scribd.com/document/331774706/Pengertian-Kasir\r\nRudianto, M. (2018, January 22). github.com. Retrieved from Aplikasi Sederhana Jasa Cuci Kendaraan dengan PHP MySQLi: https://github.com/m45rud/ajc\r\nZakky. (2020, Februari 23). Pengertian Analisis Menurut Para Ahli dan Secara Umum [Lengkap]. Retrieved from www.zonareferensi.com: https://www.zonareferensi.com/pengertian-analisis-menurut-para-ahli-dan-secara-umum/\r\nZakky. (2020, Februari 17). Pengertian Sistem | Definisi, Unsur-Unsur, Jenis-Jenis, dan Elemennya. Retrieved from zonareferensi.com: https://www.zonareferensi.com/pengertian-sistem/\r\n\r\n', 12, 4, '416048803', NULL, NULL, NULL, NULL, NULL, NULL, '1194031', 2, '1194011', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(31, 'ANALISIS APLIKASI PERPUSSMARAK', 'Perpussmarak adalah aplikasi digital berbasis web sebagai solusi mengolah data dapat memudahkan pengguna untuk mengelola data perpustakaan, mulai dari pencatatan transaksi peminjaman, pengelolaan data anggota, juga untuk pengelolaan data buku dan pengelolaan stok buku. \r\nDikarenakan pengelolannya yang cukup banyak dan rumit, untuk mengatasi beberapa masalah yang timbul di atas maka solusi yang dapat diterapkan adalah dengan menggunakan aplikasi perpussmarak tersebut.\r\nAgar mendapatkan aplikasi yang berfitur lengkap, maka kami menganalisis aplikasi tersebut dengan melakukan analisis menggunakan flowmap supaya dapat mengetahui bagaimana algoritma yang berjalan pada aplikasi perpussmarak. \r\nSelain itu kami melakukan analisis proses bisnis dalam aplikasi tersebut, dengan tujuan untuk memudahkan pengguna dalam mengakses data buku/peminjaman buku tanpa harus datang ke  perpustakaan terlebih dahulu dan dapat mengetahui proses bisnisnya serta mempelajari bagaimana algoritma yang dijalankan dalam sistem aplikasi tersebut.\r\n', 'Aplikasi, Perpustakaan, sistem, informasi', 'Perpustakaan suatu unit kerja yang mengelola bahan pustaka , baik berupa kitab maupun buku yang disusun secara matematis dengan kategori nya masing-masing. Namun, Pada saat ini perpustakaan mengalami penurunan pengunjung karena perkembangan teknologi yang semakin hari semakin meningkat menyebabkan tingkat minat siswa/i datang ke perpustakaan menjadi berkurang karena cara kerja di perpustakaan masih secara manual. Dengan pengelolaan data  dengan cara manual tentunya tidak efektif karena pengunjung harus datang langsung ke perpustakaan. Cara ini tentunya dapat menguras waktu dan tenaga. Selain itu, masih banyak lagi proses yang diperlukan untuk melakukan peminjaman karena masih menggunakan proses yang manual.\r\nPerpussmarak adalah aplikasi digital berbasis web sebagai solusi mengolah data yang memudahkan pengguna untuk mengelola data perpustakaan, mulai dari pencatatan transaksi peminjaman, pengelolaan data anggota, juga untuk pengelolaan data buku dan pengelolaan data petugas. \r\nDidalam aplikasi ini, khususnya di fitur pengelolaan  data anggota dan buku masih ada yang kurang, salah satu diantaranya adalah kurangnya siswa dalam melakukan pendaftaran harus datang ke perpustakaan langsung. Sehingga pengguna akan merasa disusahkan. Dengan masalah tersebut, maka kami akan menambahkan fitur yang kurang dalam aplikasi tersebut.\r\nAgar mendapatkan aplikasi yang berfitur lengkap, maka kami menganalisis aplikasi tersebut dengan cara menganalisis bagaimana algoritma yang berjalan dalam aplikasi perpussmarak. Selain itu kami menganalisis proses bisnis dalam aplikasi tersebut.\r\n', 'Untuk menghindari pembahasan yang terlalu luas, maka ruang lingkup ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut:\r\n1.Muhammad Syiarul Amrullah\r\n1.1 Pengolahan Data Anggota\r\nPada menu ini terdapat master data yaitu, sebagai berikut :\r\nData anggota, yaitu: dapat menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota.\r\nData Kelas, yaitu: dapat menambahkan data kelas, update data kelas menampilkan data kelas dan hapus data kelas. \r\nData Agama, yaitu: dapat menambahkan data agama, update data agama, menampilkan data agama dan hapus data agama.\r\n1.2 Pengolahan Data Buku\r\n	Menu ini berfungsi untuk memberikan keterangan pergerakan data-data mencakup buku yang terdapat di perpustakaan tiap harinya.\r\n•	Data Buku, yaitu: dapat menambahkan data buku, update data buku, menampilkan data buku dan hapus data buku.\r\n•	Data Kategori, yaitu: dapat menambahkan data kategori buku, update data kategori buku, menampilkan data kategori buku dan hapus data Kategori buku.\r\n•	Data Rak, yaitu: dapat menambahkan data rak buku, update data rak buku, menampilkan data rak buku dan hapus data rak buku.\r\n•	Data Pengarang, yaitu: dapat menambahkan data pengarang buku, update data pengarang buku, menampilkan data pengarang buku dan hapus data pengarang buku.\r\n•	Data Penerbit, yaitu: dapat menambahkan data penerbit, update data penerbit, menampilkan data penerbit dan hapus data penerbit.\r\n•	Data Provinsi, yaitu: dapat menambahkan data provinsi, update data provinsi, menampilkan data provinsi dan hapus data provinsi.\r\n1.3 Pengolahan Laporan Pengembalian\r\n	Yang terdapat di Pengolahan Laporan Pengembalian yang menampilkan kumpulan data dari table yang saling berelasi antara tb_kembali, tb_pinjam, tb_anggota, tb_denda, tb_detail _pinjam sehingga dapat tersusun menjadi laporan\r\n2. Nur Ikhsani Suwandy Futri\r\n2.1 Pengolahan Data Petugas\r\n	Dalam proses ini terdapat fungsi CRUD (Create, Read, Update, Delete) untuk mengelola data petugas dan admin\r\n•	Tambah Petugas, yaitu: dapat membuat akun petugas dan admin\r\n•	Manage Petugas, yaitu: dapat menampilkan data petugas/admin, update data petugas/admin dan juga delete data petugas/admin\r\n2.2 Pengolahan Data Peminjaman\r\nMenu ini berfungsi untuk mengelola data transaksi tiap harinya\r\n•	Data Peminjaman, yaitu: dapat menambahkan data kelas, update data kelas, menampilkan data anggota dan hapus data anggota.\r\n•	Data kembali, yaitu: dapat menampilkan anggota yang telah mengembalikan buku yang dipinjam.\r\n2.3 Pengolahan Data Kembali\r\n	Yang terdapat di Pengolahan Data Kembali yang menampilkan kumpulan data dari table yang saling berelasi antara tb_kembali, tb_pinjam, tb_anggota, tb_denda, tb_detail _pinjam sehingga dapat tersusun menjadi laporan.', '[1] 	D. P. Darminto and R. Julianty, Analisis Laporan Keuangan : Konsep dan Manfaat, Yogyakarta: AMP-YKPN , 2002. \r\n[2] 	s. and M. A. Nizar, in Kamus Istilah-istilah Akuntansi, Jakarta, Citra Harta Prima, 2000, p. 48.\r\n[3] 	B. D. Gordon, Kerangka Dasar Sistem Informasi Manajemen, Jakarta: PPM, 2002. \r\n[4] 	Indrajit, Analisis dan Perancangan Sistem Berorientasi Object, Bandung: Informatika, 2001. \r\n[5] 	K. C. Laudon and J. P. Laudon, Sistem Informasi Manajemen  Mengelola Perusahaan Digital., 8th ed., Yogyakarta: Andi Offset, 2005. \r\n[6] 	A. M. Moeliono, Kamus Besar Bahasa Indonesia, Jakarta: Balai Pusat, 1990, p. 33.\r\n[7] 	A. M. Moeliono, Kamus Besar Bahasa Indonesia, Jakarta: Balai Pusat, 1990, p. 187.\r\n[8] 	S. Basuki, \"Pemberian Motivasi Kepala Perpustakaan Dalam Meningkatkan Prestasi Kerja Pustakawan di UPT Perpustakaan IAIN Surakarta,\" Surakarta, 2013, p. 10.\r\n[9] 	N. Sutarno, Manajemen perpustakaan: suatu pendekatan praktik, Jakarta: Sagung seto, 2006. \r\n[10] 	Darmono, Manajemen Dan Tata Kerja Perpustakaan Sekolah, Jakarta: PT. Grasindo, 2001. \r\n', 12, 4, '402058005', NULL, NULL, NULL, NULL, NULL, NULL, '1194026', 2, '1194029', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(32, 'ANALISIS ROBOT ELEKTRONIK ITEUNG (ARENG)', 'Penelitian ini bertujuan untuk membangun sebuah virtual assistant yang berupa chat bot dimana Sistem ini bekerja untuk menggantikan peran Bagian Administrasi dan Akademik Kemahasiswaan (BAAK) dan petugas Bagian Administrasi Umum dan Keuangan (BAUK) di kampus Politeknik Pos Indonesia dengan memberikan pelayanan berinteraksi dengan para mahasiswa melalui percakapan teks secara otomatis. Selain itu, dengan adanya sistem ini, BAAK dan BAUK dapat menyediakan layanan yang aktif selama 24 jam mengenai permasalahan Akademik dan Keuangan Mahasiswa seperti pembayaran SPP, Dan pengisian KRS. Pemanfaatan chatbot ini diharapkan dapat menyelesaikan masalah tersebut sekaligus mempermudah mahasiswa untuk mendapatkan informasi dari data yang tersimpan pada sistem yang berisi informasi mengenai akademik dan keuangan mahasiswa program studi teknik informatika Politeknik Pos Indonesia (database) yang diinformasikan kepada mahasiswa.\r\nSistem ini dibangun menggunakan bahasa pemrograman python dan algoritmanya akan digambarkan dalam bentuk flowmap, Database Physical Data Model dan  Conceptual Data Model yang bertujuan untuk memudahkan perancangan serta pengguna untuk memahami aplikasi yang akan dirancang.\r\nKata Kunci : Virtual assistant, Database, Aplikasi\r\n', 'VIRTUAL ASSISTANT ', 'Dalam proses pembayaran serta administrasi mahasiswa, kampus memerlukan  staff yang bekerja pada bidang tersebut, di kampus Politeknik Pos Indonesia bidang tersebut dinamai dengan Bagian Administrasi Umum dan Keuangan (BAUK) dan Bagian Administrasi dan Akademik Kemahasiswaan (BAAK).  BAUK membantu mahasiswa dalam perihal pembayaran kuliah sedangkan BAAK memiliki tugas membantu mahasiswa dalam memasukkan Kartu Rencana Studi (KRS), jadwal perkuliahan serta permasalahan akademik lainnya. Di dalam suatu kampus tentunya jumlah mahasiswa dibandingkan staf lebih banyak mahasiswa, sehingga SDM menjadi kurang. Kurangnya SDM para staff merasa kesulitan dalam memberi informasi mengenai administrasi dengan cepat dan akurat, sehingga berdampak kerugian pada kedua belah pihak karena keterlambatan informasi. \r\nMaka dari itu  pada Proyek 1 ini, kami menganalisis tentang teknologi chatbot yang merupakan aplikasi robot yang bisa komunikasi melalui chatting. Sistem seperti ini sangat berguna dalam proses tanya jawab seputar administrasi di kampus, sehingga BAAK dan BAUK tidak merasa kesulitan dalam merespon chat mahasiswa dan tidak akan mengalami keterlambatan memperoleh informasi, sistem ini sangat menguntungkan kedua belah pihak. Sistem ini tentunya memerlukan database untuk mengisi kalimat” yang akan dijawab seputar perkuliahan , kalimat tersebut sudah dirancang dan disesuaikan dengan pertanyaan yang akan diajukan oleh penanya.\r\n', '1.	BAB I PENDAHULUAN, Bab ini membahas tentang latar belakang dibuatnya analisis system kerja pada fitur pembelian serta membahas gambaran system tersebut secara umum.\r\n2.	BAB II LANDASAN TEORI, Bab ini  diisi oleh penjelasan mengenai teori tentang analisis system  yang menjadi acuan pembuatan tugas ini. \r\n3.	BAB III ANALISIS DAN PERANCANGAN, Bab ini membahas tentang pembahasan analisis sistem yang akan dibuat termasuk seluruh alur proses analisis dari awal hingga akhir. \r\n4.	BAB IV IMPLEMENTASI DANPENGUJIAN, Pada bab ini menjelaskan setiap baris kode yang ada dengan penjelasan detail tentang aplikasi yang di analisis.\r\n5.	BAB V KESIMPULAN DAN SARAN, Kesimpulan, dan saran. Bab ini di isi dengan kesimpulan dari hasil yang didapatkan dalam penelitian ini.\r\n	\r\nNO	NAMA	TUGAS\r\n1.	Deriska Fadilla Musdalifa	•	Melakukan input data kedalam tabel notfound_message sebanyak 100 record untuk aplikasi chatbot ITeung.\r\n•	Insert data ke dalam tabel opening_message sebanyak 34 record\r\n•	Mengisi beberapa Module_name dari tabel Waiting_message diantaranya kelas_mulai , kelas_selesai, dan jadwal kelas sebanyak 34 record per modulenya.\r\n•	Perancangan dan pengembangan aplikasi chatbot iteung.\r\n•	Analisis sistem yang sedang berjalan.\r\n•	Melakukan update data pada tabel error_message dan tabel notfound_message.\r\n•	Pembuatan, perancangan laporan/proposal\r\n2.	Salsa Thalia Putri Nur Rochmani	•	Melakukan input data kedalam tabel notfound_message sebanyak 100 record untuk aplikasi chatbot ITeung.\r\n•	Insert data ke dalam tabel opening_message sebanyak 34 record\r\n•	Mengisi beberapa Module_name dari tabel Waiting_message diantaranya kelas_mulai, kelas_selesai, dan jadwal kelas sebanyak 34 record per modulenya.\r\n•	Perancangan dan pengembangan aplikasi chatbot iteung.\r\n•	Analisis Algoritma yang sedang berjalan.\r\n•	Melakukan update data pada tabel opening_message dan tabel waiting_message.\r\n•	Penulisan laporan harian\r\n\r\n', '1.	Pengertian, Kelebihan, dan Kekurangan Penggunaan Chatbot dalam Aplikasi untuk Bisnis pada https://www.dewaweb.com/blog/  (diakses tgl 1 april 2020).\r\n2.	Mengenal Chatbot dan Potensinya pada https://www.kompasiana.com/klikquick/ (diakses tgl 1 april 2020).\r\n3.	Pangkalan data pada https://id.wikipedia.org/wiki/Pangkalan_data (diakses tgl 1 april 2020).\r\n4.	Belajar Pemrograman Python: Pengenalan Dasar Python dan Persiapan Awal pada https://www.petanikode.com/python-linux/ (diakses tgl 1 april 2020).\r\n5.	Keunggulan Memahami Bahasa Pemrograman Python pada https://www.dewaweb.com/blog/  (diakses tgl 1 april 2020).\r\n6.	Python (bahasa pemrograman) pada https://id.wikipedia.org/wiki/ (diakses tgl 1 april 2020).\r\n', 5, 4, '410118609', NULL, NULL, NULL, NULL, NULL, NULL, '1194010', 2, '1194034', '2020-04-01 15:53:14', '2020-05-23 03:43:51');
INSERT INTO `proyek` (`id_proyek`, `judul_proyek`, `abstrak`, `keyword_abstrak`, `latar_belakang`, `identifikasi_masalah`, `daftar_pustaka`, `id_penelitian`, `id_kegiatan`, `id_dosen_pembimbing`, `id_dosen_penguji`, `tgl_sidang`, `tgl_sidang_ulang`, `nilai_pembimbing`, `nilai_penguji`, `ruangan`, `npm_ketua`, `status_proyek`, `npm_anggota`, `created_date`, `last_update`) VALUES
(33, 'MENGANALISIS APLIKASI MANEJEMAN KEUANGAN  BERBASIS WEB', 'ABSTRAK\r\n	Uang merupakan kebutuhan utama dalam kehidupan sehari-hari, oleh karena itu diperlukan sebuah sistem untuk mengelolanya semaksimal mungkin agar kondisi keuangan selalu terkendali. Kebanyakan orang mengelola keuangannya secara manual sehingga sering terjadi kesalahan dalam hal penulisan maupun pembuatan laporan keuangan mereka sendiri. Oleh karena itu diperlukan sebuah system yang bisa melakukan pemrosesan data secara terintegrasi dan terkomputerisasi dengan baik dengan penggunaan system berbasis WEB.\r\nSistem yang dirancang adalah Aplikasi Manajemen Keuangan berbasis WEB. Untuk membangun Aplikasi tersebut, diperlukan beberapa software antara lain dengan menggunakan, Database MySQL, serta menggunakan bahasa pemrograman PHP.\r\n', 'Aplikasi Manajemen Keuangan, MySQL, PHP.', 'Latar Belakang \r\n\r\n       Seiring dengan perkembangan zaman yang sangat cepat di era globalisasi ini,salah satunya adalah perkembangan teknologi .Teknologi saat-saat ini sudah menjadi bagian dari kehidupan manusia yang sangat bermanfaat,baik dalam bidang Kesehatan ,pendidika,ekonomi dan social budaya.Lebih-lebih dalam bidang Pendidikan seoramg pelajar atau mahasiswa sangat membutuhkan teknologi sebagai senjatanya ,dalam kehidupan ekonomi sebgai sarana mencari uang .pada saat ini “Kosan 54 “beranggotakan 10 orang yang masih dalam proses penggunaan manual,yaitu penggunaan system pembukuan dan system perhitungan yang masih mengunakan manual dalam proses pengolahan keuangan mereka.Sepeti pemasukan perbulan ,pengeluaran perbualan bahkan pengeluarn dan pemasukan pertahunya ,serta memperhitungkan juga berapa biaya yang harus dibeli untuk perlengkapan kamar kost setiap bulan bahkan setiap tahunya. Sehingga hal tersebut akan memunculkan kejadian dan kesalahan dalam perhitungan dan datanya akan ribet dalam proses pendataan manual yang di lakukan oleh mereka sendiri.\r\n\r\n	Dengan melakukan pemanfaatan teknologi yang sedang berkembang sekarang,salah satu satunya saran informasi “Internet “ segala hal bisa saja di lakukan melalui internet contonya seperti “pencarian infromasi ,transakksi penjualan,sarana Pendidikan ,dan forum diskusi.”. Melakukan transaksi melalui internet adalah salah satu pemanfaatan yang sangat penting dalam internet, dimana seorang pembeli atau pemesan kos (Temapat tinggal ),akan melakukan transaksi secara online tanpa harus datang ke tempat yang di tuju untuk melihat tempat dan barang-barang yang akan di gunakan .Pemesan tersebut cukup melakukan pemesanan melalui “website” yang brsangkutan dan melakukan pembayaran di krirm ke alamat pembeli.\r\n\r\n	Dalam mengelola sebuah keuangan merupakan suatu hal benar-bemar harus di perhatikan oleh setiap individu dan organisasi,yang akan membantu mencapai proses dan hal yang di inginkan mereka kemudian hari.\r\n\r\n	Dari uraian di atas ,maka kami dibuat suatu website ,yang akan menanggulangi permasalahan-permasalahn di atas.Website ini akan memberikan kemudahan kepada pengurus kosan 54 mereka kan dapat mengakses situs halamn ini untuk dapat mengatur keuangan mereka sehingga terkelola dengan baik sesuai yang di harapkan, tanpa harus menggunakan system manual lagi ,semua proses yang dilakuakn dengan manual sudah terkompeturasi dalam “Website”. \r\n\r\n\r\n', 'Ruang Lingkup\r\n\r\nBerdasarkan latar belakang, kami penulis membatasi pembahsan ini,karena sebagai berikut :\r\n\r\na.	Dalam system web ini hanya akan melayani pencatatan untuk pemsukan,pengeluaran,utang dan piutang oleh admin dan bendahara terkait dengan kosan 54.\r\nb.	Dalam informasi web hanya akan menampilakan informasi pengumuman info kamar kos, info tagihan bagi anggota-anggota yang ada dalam kosan 54 tersebut.\r\nBerdasarkan ruang lingkup diatas pada sistem informasi kosan 54 maka kami penulis akan membagi tugas kami masing-masing dalam proses analisis sistem informasi pada aplikasi Manejemen aplikasi berbentuk web. Berikut pembagian tugas serta nama yang menganalisis aplikasi :\r\n1.	Dellavianti Nishfi Ilmiah Huda, bertugas menganalisis data informasi pengumuman info kamar kos, info tagihan bagi anggota-anggota yang ada dalam kosan 54.\r\n2.	Ririn Indriyani, tugasnya menganalisis data pemasukan dan pengeluaran biaya kos seperti pembayaran kos  dan wifi,air dan listrik. \r\n	\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'DAFTAR PUSTAKA\r\n[1] HM, Jogiyanto.1991. Analisis & disain sistem informasi: pendekatan terstruktur 	teori dan praktik aplikasi bisnis. Yogyakarta: ANDI\r\n[2] Solikin, dan Suseno. 2002. UANG: Pengertian, Penciptaan, dan Peranannya dalam 	Perekonomian. Jakarta: Pusat Pendidikan dan Studi Kebanksentralan (PPSK) 	BANK INDONESIA\r\n\r\n', 12, 4, '427078401', NULL, NULL, NULL, NULL, NULL, NULL, '1194070', 2, '1194065', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(34, 'Analisis dan Desain Sistem Informasi Aplikasi Kasir (Point of Sale)', 'Kasir  adalah seorang pemegang kas (uang) atau orangyang bertugas menerima dan membayarkan uang. Selain istilah kasir, ada juga istilah kassa. Keduanya mempunyai perbedaan. Kasir adalah orangnya, sedangkan kassa adalah tempatnya. Profesi kasir di toko retail atau minimarket adalah seseorang yang pekerjaannya menerima uang pembayaran  dari pelanggan saat pembelian produk barang atau jasa dan melakukan pengembalian uang sisa pembayaran, sekaligus menyerahkan produk barang atau jasa kepada pelanggan (customer) diloket-loket kasir di suatu toko, super market, mini market, hotel, mall, restoran, rumah sakit,ataupun departement store. Selain itu, tugas kasir juga melakukan penghitungan jumlah total penjualan per hari, per minggu, ataupun per bulan serta mengenali barang yang paling laris terjual.\r\nPada umumnya sebuah toko ingin usahanya tetap eksis dan berkembang, untuk itu diperlukan strategi dan pengelolaan yang baik. Strategi yang dimaksud berupa peningkatan kualitas marketing, manajemen, pelayanan dan lain-lain termasuk penerapan teknologi informasi didalamnya. Berdasarkan observasi dan wawancara, adanya sistem informasi mempengaruhi berbagai aspek termasuk aspek penjualan, yang biasanya sistem penjulannya masih konvensional hanya menggunakan buku untuk perekapan data penjualan dan nota yang ditulis peetugas kasir. Petugas kasir terkadang melakukan kesalahan ketika banyak konsumen datang bersamaan. Maka dari suatu permasalahan tersebut dibuatkan sistem informasi penjualan. Dalam perancangan aplikasi ini dibutuhkan sebuah system komputerisasi untuk mempermudah proses rekapitulasi data – data transaksi penjualan dan pendataan penjualan secara efesien dan akurat . Dengan adanya sistem informasi penjualan tersebut dapat membantu petugas kasir dalam pengelolaan data penjualan yang lebih efisien dan akurat.pemodelan yang digunakan dalam perancangan aplikasi ini menggunakan UML. Bahasa pemograman adalah PHP dan HTML.\r\n       Agar mendapatkan aplikasi yang berfitur lengkap, maka kami menganalisis aplikasi tersebut dengan cara menganalisis menggunakan flowmap agar dapat mengetahui bagaimana algoritma yang berjalan pada aplikasi kasir. Selain itu kami menganalisis proses bisnis dalam aplikasi tersebut, dengan tujuan untuk memudahkan pemilik toko mengakses barang dengan mudah dan dapat mengetahui proses bisnisnya serta mempelajari bagaimana algoritma yang dijalankan dalam sistem aplikasi tersebut.Dengan adanya sistem informasi kasir, diharapkan dapat mempercepat proses penyelesaian pekerjaan bagian kasir sehingga dapat menghemat waktu dan memaksimalkan kinerja serta dapat meningkatkan mutu pelayanan yang lebih baik kepada para pelanggan.\r\n', 'Kasir, pembelian,  penjualan, aplikasi, point of sale.', 'Seiring dengan pertumbuhan ekonomi Indonesia yang maju  dan  berkembang pesat khususnya di kota-kota besar, telah terjadi perubahan diberbagai sektor,  termasuk  di  bidang industri retail dan produksi serta pada kegiatan  eceran  di  Indonesia.  Perkembangan bisnis eceran yang pesat ini tidak lepas  dan  faktor  meningkatnya  jumlah  penduduk  Indonesia dan juga meningkatnya pendapatan perkapita penduduk yang menyebabkan taraf hidup masyarakat semakin meningkat dengan  diiringi  kebutuhan  masyarakat  yang  semakin  tinggi pula.\r\nToko akan terus  dapat  berkembang   untuk  meningkatkan  penjualan apabila aktivitas penjualan dikelola dengan baik salah satunya  adalah  dengan  pencatatan penjualan yang cepat dan  tepat dalam upaya laporan penjualan.  Sistem  penjualan  yang digunakan pada toko   pengecer yaitu penjualan tunai yang diasumsikan bahwa pembeli akan mengambil barang setelah harga barang dibayar  di  kasir,  karena  dari  hasil  penjualan  itulah toko  memperoleh pendapatan untuk menutupi biaya -  biaya  operasional  lainnya yang telah dikeluarkan, dan  memaksimalkan laba, maka pengawasan terhadap  penjualan merupakan  hal  yang  penting untuk dilakukan, untuk itu toko sangat memerlukan suatu sistem informasi untuk memenuhi kebutuhan informasi yang berguna bagi pihak luar maupun dalam toko\r\n Pengelolaan data transaksi penjualan dan persediaan barang masih dilakukan dengan pencatatan dalam pembukuan, sehingga dapat menghalangi proses  pembuatan ringkasan  data barang saat ingin mengetahui persediaan barang dalam waktu singkat. Proses pembuatan laporan dan penyimpanan data yang belum terorganisir dengan baik dapat menyebabkan ringkasan data-data transaksi penjualan tidak tersusun dengan rapi.\r\nDengan demikian sangat diperlukan suatu sistem yang efisien dan efektif dalam mengelola toko. Dan dengan adanya sistem informasi ini, toko dapat mencatat, membuat dokumen yang berhubungan dengan penjualan untuk keperluan perusahaan maupun bagi pihak diluar perusahaan yang memerlukannya. Informasi memang menjadi unsur penentu dalam pengambilan keputusan, oleh sebab itu  penyusunan  informasi  penjualan  hendaknya selalu dilaksanakan untuk mencapai tujuan tertentu.\r\n', 'Topik pembahasan yang ada yaitu tentang aplikasi kasir penjualan, maka penulis membuat batasan penelitian, antara lain :\r\n1.	Aplikasi membahas pencatatan data barang, data pelanggan, data pengguna, data pembelian, data penjualan, dan proses rekapitulasi laporan penjualan;\r\n2.	Hak akses pengguna aplikasi penjualan adalah admin dan kasir;\r\n3.	Hak akses untuk admin terdapat menu home, menu barang, menu pelanggan, menu pengguna, menu pembelian, menu penjualan, dan menu laporan penjualan;\r\n4.	Hak akses untuk kasir terdapat menu home, menu penjualan, dan menu laporan penjualan;\r\n5.	Input barang penjualan tidak boleh lebih besar daripada stok; \r\n6.	Untuk menginputkan transaksi penjualan maka admin dan kasir harus mengetahui kode garis (Barcode) barang.\r\n        Dalam perancangan aplikasi ini kami membagi tugas masing-masing.analisis data barang dan analisis data pelanggan tugas Ayu Lestari dan analisis data penjualan dan data supplier tugas Audry Febrisa.\r\n', '1.	Maulana Kiki Rizki and Bunyamin, 2015. Rancang Bangun Aplikasi Sistem  Informasi Penjualan dan  Stok Barang di Toko Widari Garut. “Jurnal Algoritma”, ISSN :  2302-7339 Vol. 12 No. 1 : 1-6.\r\n2.	Mega, Mahar, 2013. Manajemen Pemasaran. Yogyakarta : CAPS (Center of   Academic Publishing Service).\r\n3.	Hayuningtyas Ratih Yulia, 2015. Rancang Bangun Sistem Informasi Penjualan Tas pada Toko Lokalop. “Jurnal dari Sistem Informasi STMIK antar Bangsa”, ISSN 2089- 8711 Vol. IV NO.2  : 160-167.\r\n4.	Nugroho, Bunafit, 2013, Membuat Aplikasi WEB Penjualan Pembelian dengan PHP,  MySQL dan Dreamweaver. Yogyakarta : Penerbit PT.Alif Media.\r\n', 12, 4, '0403117607', NULL, NULL, NULL, NULL, NULL, NULL, '1194006', 2, '1194007', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(35, 'ANALISIS  APLIKASI SISTEM INFORMASI PARKIR BERBASIS WEB', 'Dizaman ini sudah banyak yang menggunakan system parkir tekhnologi yang mana bisa memudahkan dan menjamin keamanan dari kendaraan pendatang, system nya menyimpan data plat dari kendaraan setelah itu diberikan tiket parkir. Sering terjadi kehilangan tiket parkir dari banyak pengguna kendaraan, entah itu tiket nya jatuh, lupa tempat dimana meletakkan nya, dan lain sebagainya. Aplikasi in memberikan keamanan kepada pengguna kendaraan dari kehilangan kendaraan, kerusakan kendaraan. Tekhnik pengumpulan data dalam analisis kali ini adalah melalui ovservasi ', 'Kendaraan, tiket, parkir', 'Parkir merupakan fasilitas yang harus terpenuhi dalam sebuah institusi. Dimana fasilitas ini mempunyai peranan penting demi kemajuan institusi tersebut. System parkir yang banyak dijumpai di berbagai tempat belum banyak yang menggunkan sistem aplikasi masih menggunakan jasa orang untuk menjaga keamanan dari kendaraan tersebut, tetapi jika menggunakan jasa orang akan susah kalua untuk menjaga yang kendaraan nya banyak yang membutuhkan banyak orang pula, dan belum bisa menjaminkan keamanan dari kendaraan baik dari kehilangan dan kerusakan.  Sistem parkir yang tertata dengan baik akan membuat pengguna kendaraan merasa nyaman. Para pengguna pun dapat melakukan aktifitas dengan maksimal.\r\nTanpa adanya suatu sistem parkir yang baik dapat menimbulkan berbagai masalah. Maka dengan adanya aplikasi ini bisa menjamin kendaraan dari pengguna aman dari kerusakan dan kehilangan. Maka dengan adanya system parkir menggunakan aplikasi ini yang membuat pengguna kendaraan percaya untuk menitipkan kendaraanya jika lagi berpergian aman dari kehilangan dan kerusakan.\r\n', 'Pembahasan permasalahan ini bertujuan untuk memudahkan pengguna (user) untuk mengontrol motor maupun mobil yang parkir di sebuah mall . Pembahasan hanya lah bertujuan untuk membuat kenyamanan pengguna. Permasalahan ini harus terarah agar menghindari dari kemungkinan pembahasannya terlalu luas dan terhindar dari kesalah pahaman dalam penelitian ini. Hal yang perlu di perhatikan antara lain yaitu:\r\na)	Penelitian ini dilakukan untuk mengidentifikasi suatu kekurangan dan permasalahan yang ada pada Sistem Informasi Akademik Berbasis Website.\r\nb)	Aplikasi ini merupakan suatu hal yang berguna bagi banyak orang untuk pengolahan data parkir dan efisiensi waktu dan juga penganalisisan aplikasi ini dibuat untuk memenuhi Proyek I\r\nMengingat luasynya sistem informasi parking (parkir) yang akan di analisis, maka penulis membagi tugas dalam  mnganalisis sistem informasi parking(parkir)\r\na)	Muhammad Nanda Fahriza akan menganalisis data list member dimana terdapat kode member, nama, plat kendaraan, tipe member , aksi. data list admin dimana terdapat kode admin, nama, plat kendaraan, tipe admin, aksi. Dan menganalisi data kendaraan masuk, dimana terdapat kode karcis, plat nomor, jenis, jam masuk, penjaga, aksi.\r\nb)	Rendi Baji Syadewo akan menganalisis data menganalisi data kendaraan keluar, dimana terdapat kode karcis, plat nomor, jenis, jam masuk, penjaga, aksi. Dan menganalisis data jenis kendaran  terdapat kode kendaraan, nama jenis, kategori, tarif, aksi.\r\n\r\n\r\nPembahasan permasalahan ini bertujuan untuk memudahkan pengguna (user) untuk mengontrol motor maupun mobil yang parkir di sebuah mall . Pembahasan hanya lah bertujuan untuk membuat kenyamanan pengguna. Permasalahan ini harus terarah agar menghindari dari kemungkinan pembahasannya terlalu luas dan terhindar dari kesalah pahaman dalam penelitian ini. Hal yang perlu di perhatikan antara lain yaitu:\r\na)	Penelitian ini dilakukan untuk mengidentifikasi suatu kekurangan dan permasalahan yang ada pada Sistem Informasi Akademik Berbasis Website.\r\nb)	Aplikasi ini merupakan suatu hal yang berguna bagi banyak orang untuk pengolahan data parkir dan efisiensi waktu dan juga penganalisisan aplikasi ini dibuat untuk memenuhi Proyek I\r\nMengingat luasynya sistem informasi parking (parkir) yang akan di analisis, maka penulis membagi tugas dalam  mnganalisis sistem informasi parking(parkir)\r\na)	Muhammad Nanda Fahriza akan menganalisis data list member dimana terdapat kode member, nama, plat kendaraan, tipe member , aksi. data list admin dimana terdapat kode admin, nama, plat kendaraan, tipe admin, aksi. Dan menganalisi data kendaraan masuk, dimana terdapat kode karcis, plat nomor, jenis, jam masuk, penjaga, aksi.\r\nb)	Rendi Baji Syadewo akan menganalisis data menganalisi data kendaraan keluar, dimana terdapat kode karcis, plat nomor, jenis, jam masuk, penjaga, aksi. Dan menganalisis data jenis kendaran  terdapat kode kendaraan, nama jenis, kategori, tarif, aksi.\r\n\r\n\r\n', 'Aplikasi 	: https://github.com/bahyusanciko/ci-parking\r\nPHP 		: https://phpdanmysql.com/pengertian-php-mysql-html-css-dan-web/\r\n\r\nMySQL 		: https://phpdanmysql.com/pengertian-php-mysql-html-css-dan-web/\r\n\r\nBasis Data 	: https://www.maxmanroe.com/vid/teknologi/komputer/pengertian-database.html\r\n', 1, 4, '420058801', NULL, NULL, NULL, NULL, NULL, NULL, '1194057', 2, '1194064', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(36, 'ANALISIS APLIKASI PEMESANAN TIKET BUS BERBASIS WEBSITE', 'Shuttle bus adalah salah satu transportasi darat yang sering digunakan untuk bepergian antara kota, untuk itu perlu dibuatkan sistem yang dapat mengelola transaksi pembelian tiket secara sistematis. Beberapa penyedia transportasi shuttle bus masih menggunakan cara manual untuk mengelola penjualan tiketnya, hal ini menyebabkan munculnya penjualan tiket secara illegal juga penipuan yang dilakukan oleh pihak yang tidak bertanggung jawab. Oleh karena itu di perlukan sistem yang dapat mengatur penjualan tiket yang terkomputerisasi dengan baik dan berjalan dengan berbasis website. Untuk mengatasi masalah diatas, dibangunlah sebuah sistem penjualan tiket berbasis website. Yang di bangun menggunakan Bahasa pemrograman PHP(Hypertext Preprocessor) dan MySQL sebagai database.\r\n', 'PHP, MySQL, Sistem Penjualan Tiket', 'Tidak bisa kita pungkiri, bahwa perkembangan teknologi di zaman ini berkembang sangat pesat. Kita dapat melakukan apapun dengan kemajuan teknologi sekarang seperti memesan tiket nonton yang akan tayang besok, membeli makanan & minuman, melakukan transaksi jual beli, dan masih banyak lagi. Perkembangan teknologi ini harusnya dapat kita manfaatkan dengan baik dalam segala aspek kehidupan, termasuk kedalam aspek transportasi sehingga dapat memperlancar dan memudahkan kehidupan kita sehari-hari. Transportasi darat merupakan transportasi yang paling banyak digunakan di Indonesia. Salah satunya yang sering digunakan yaitu transportasi shuttle bus. Umumnya, shuttle bus digunakan untuk perjalanan yang lumayan jauh dengan jumlah penumpang yang banyak, seperti Bandung ke Jakarta misalnya. Biasanya, frekuensi penggunaan shuttle bus paling tinggi terjadi ketika musim mudik. Banyak sekali orang yang memesan tiket transportasi ini agar mereka dapat kembali ke kampung halaman tercinta untuk merayakan idul fitri bersama keluarga. Ada yang rela mengantri berjam-jam, bahkan ada yang sampai menginap di tempat penjualan tiket karena takut kehabisan. Dengan banyaknya pemesanan tiket ketika mudik, bukan hal yang mengejutkan lagi jika ada orang yang gagal untuk mudik dikarenakan kehabisan tiket. Tak hanya itu, ketika mudik pun harga tiket shuttle bus dan tiket transportasi lainnya melonjak naik karena banyak pihak transportasi yang ingin mengambil keuntungan dari fenomena ini. Harga tiket yang seharusnya Rp.100.000 dinaikkan menjadi 3 kali lipat. Dan orang-orang mau tak mau membelinya karena memang dibutuhkan. Dari penjelasan diatas, penting membuat suatu sistem yang dapat meminimalisir masalah-masalah yang terjadi diatas. Dibutuhkan sistem yang bisa mempermudah pembelian tiket serta menawarkan harga yang masuk akal dan transparan. Untuk itu, penulis memutuskan untuk mengambil topik penelitian dengan judul “Analisis Aplikasi Pemesanan Tiket Bus Berbasis Web” yang pastinya dapat mempermudah pemesanan tiket sehingga pembeli tak perlu lagi mengantri berjam-jam atau bahkan menginap di tempat penjualan tiket agar bisa mendapatkan tiket. Pembeli bisa langsung membeli tiket dimana saja selama mempunyai koneksi internet dan pembeli juga akan ditawari dengan harga yang transparan agar bisa mempererat kepercayaan diantara penjual dan pembeli.', 'Pembatasan masalah di lakukan untuk menjaga pembahasan agar tidak terlalu luas. Berikut dibawah ini merupakan batasan masalah dari penelitian ini :\r\n1.7.1 Penelitian ini di lakukan untuk menganalisis kekurangan dari sistem Pemesanan Tiket Shuttle Bus Berbasis Website \r\n1.7.2 Aplikasi ini berguna untuk Memaksimalkan proses pembelian tiket sehingga menghemat waktu\r\n1.7.3 Untuk memenuhi Proyek I\r\nDari poin poin sebelumnya, agar masing masing siswa mempunyai tugas dan tanggung jawab masing masing, maka kami membagi tugas kami masing masing. Berikut pembagian tugas :\r\n1.	Muh Fariz Syafiq Bempah akan menganalisis pengelolaan data pengguna, pengelolaan data admin, pengelolaan jadwal.\r\n2.	Alvaro Daniel Bamba akan menganalisis pengelolaan data pemesanan, pengelolaan data laporan pemesanan tiket, pengelolaan proses pembayaran. ', 'Guntoro. 2019. Apa Itu PHP?\r\nM Fikri. 2018. Konsep Dasar Sistem Basis Data Untuk Pemula.', 12, 4, '427078401', NULL, NULL, NULL, NULL, NULL, NULL, '1194052', 2, '1194038', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(37, 'Analisis Aplikasi Berbasis Web Amanuba Hotel', 'Hotel merupakan suatu tempat perusahaan yang bergerak pada bidang jasa. Pelayanan hotel memiliki layanan 24 jam, restoran, ruang seminar dan ruang rapat, WI-FI, dan tempat olahraga. Suatu kondisi bangunan hotel, jika tidak didukung oleh pelayanan yang maksimal dari hotel, pelanggan tidak merasa puas. Oleh karena itu, penelitian dibuat untuk membangun informasi web hotel yang ada di Bogor, pelanggan dapat membandingkan sejumlah  hotel-hotel, dari mulai fasilitas dan harga. Biasanya hotel identik dengan berbagai kalangan yang dapat memilih untuk melanjutkan menginap atau berwisata. Hotel yang dekat dengan tempat yang ingin dikunjungin dan banyak dari kalangan yang ingin berwisata dan memilih hotel sesuai dengan kebutuhan. Penelitian ini bertujuan untuk mengetahui kepuasaan pelanggan atas kualitas pelayanan yang diberikan oleh Hotel. Dengan adanya pertumbuhan mengakibatkan persaingan dalam usaha perhotelan semakin meningkat. Dimana hotel mempunyai populasi yang cukup besar yang berbeda diantara hotel yang lain dan setiap hotel harus memenuhi standar pelayanan. \r\nKarena adanya informasi yang disediakan di web supaya meningkatkan penghasilan utama dan memiliki pengaruh besar terhadap keberhasilan hotel juga meningkatkan kualitasnya. Informasi tersebut hanya terkhusus di daerah Bogor. \r\nAgar aplikasi berfitur  lengkap, kami menganalisis menggunakan flowmap agar mengetahui jalannya suatu Algoritma dari Amanuba Hotel. Dan kami menganalisis proses aplikasi tersebut, agar dapat memudahkan pelanggan dalam mengakses informasi-informasi hotel tanpa harus datang ke hotel. \r\nDengan adanya penggunaan sistem informasi tentang hotel di Bogor, diharapkan menambah proses kerja dan mempercepat penyelesaian bagian hotel sehingga dapat menghemat waktu dan melakukan kinerja semaksimal mungkin meningkatkan informasi yang lengkap. \r\n	\r\nKata Kunci : Aplikasi, Kualitas Pelayanan, Hotel, Bogor, Analisis, Web.\r\n', 'aplikasi, kualitas pelayanan, bogor, analisis, web', 'Hotel adalah usaha akomondasi atau perusahaan yang menyediakan pelayanan bagi masyarakat umum dengan fasilitas makan dan minum, jasa penginapan, penyedian kamar, dan cuci pakaian. Hotel juga merupakan tempat untuk menginap bagi sebagian orang yang tidak memiliki rumah di suatu daerah atau Negara. Semakin banyaknya perhotel yang ada maka semakin tinggi persaingan antar hotel. Dengan tingginya persaingan antar hotel maka mereka berlomba-lomba dalam fasilitas yang disediakan disetiap hotel berbeda-beda, pelayanan disetiap hotel berbeda-beda, tema disetiap hotel juga berbeda-beda, bentuk bangunan hotel juga beraneka ragam, pemandangan yang disediakan hotel juga berbeda-beda, keunikan setiap hotel juga berbeda-beda, dan lokasinya juga strategis. Dengan semua itu mereka berlomba-lomba dalam mencari perhatian masyarakat untuk tertarik pada hotel mereka.\r\nPermasalahan yang terjadi kemudian hotel juga promosi lewat aplikasi berbasis web untuk memudah masyarakat dalam memilih hotel yang mereka butuhkan dan juga terkadang mereka memberikan potongan harga. Meraka juga merincikan decara detail hotel mereka dan fasilitas yang tersedia, pelayanan, dan lokasi. Dengan ini memudah masyarakat dalam memesan kamar hotel dan tidak perlu repot lagi dalam memilihnya.\r\nBerdasarkan permasalahan ini maka dibuat  sebuah “Analisis system informasi aplikasi hotel berbasis web” dengan masalah-masalah yang terjadi seperti dulu jika kita ingin memasan kamar hotel kita harus mengujungi hotel tersebut dan itu belum tentu kamar yang kita inginkan tersedia atau tidak. Dengan aplikasi ini kita lebih irit biaya dan waktu. Lebih memudah mencari dan tidak perlu khawatir jika kamar kita ingin tidak tersedia. \r\nDan diharapkan kedepannya denga adanya analisi dan system ini dapat mengurangi masalah yang terjadi di hotel-hotel seperti berebut kamar hotel, kurangnya fasilitas yang tersedia, dan pelayanan yang diterima kurang baik. Semoga dikedepanya lebih baik lagi.\r\n', 'Untuk menghindari bahasan laporan terlalu luas, maka ruang lingkup laporan ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut :\r\n1.	Nur Raisa\r\n1.1	Pengelohan Data Anggota\r\nPada  menu ini admin, berikut :\r\nData anggota, yaitu: dapat menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota.\r\n1.2	Pengelohan Sistem Reservasi\r\nPada menu ini sistem reservasi, sebagai berikut :\r\nPengecekan setiap menu seperti : cek-in, cek-out, pemesanan menu, dan data kamar kosong.\r\n\r\n2.	Natalya Br Sidauruk \r\n2.1 Pengelohan Kamar\r\n	     Pada menu ini dibagi menjadi 2, yaitu:\r\nPada menu kelas kamar ada jenis kamar yang tersedia dan menu kamar yaitu no kamar yang ada.\r\n2.2 Pengelohan Pemesanan\r\n      Pada menu ini dibagi menjadi 2, yaitu:\r\nPadUntuk menghindari bahasan laporan terlalu luas, maka ruang lingkup laporan ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut :\r\n1.	Nur Raisa\r\n1.1	Pengelohan Data Anggota\r\nPada  menu ini admin, berikut :\r\nData anggota, yaitu: dapat menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota.\r\n1.2	Pengelohan Sistem Reservasi\r\nPada menu ini sistem reservasi, sebagai berikut :\r\nPengecekan setiap menu seperti : cek-in, cek-out, pemesanan menu, dan data kamar kosong.\r\n\r\n2.	Natalya Br Sidauruk \r\n2.1 Pengelohan Kamar\r\n	     Pada menu ini dibagi menjadi 2, yaitu:\r\nPada menu kelas kamar ada jenis kamar yang tersedia dan menu kamar yaitu no kamar yang ada.\r\n2.2 Pengelohan Pemesanan\r\n      Pada menu ini dibagi menjadi 2, yaitu:\r\nPada menu pesanan baru adalah pesanan yang baru masuk dan menu pesanan selesai adalah dimana data pemesanan yang yang telah selesai mengisi data dan membayar. \r\na menu pesanan baru adalah pesanan yang baru masuk dan menu pesanan selesai adalah dimana data pemesanan yang yang telah selesai mengisi data dan membayar. \r\n\r\n', '•	Handra, 2015, Jenis-jenis hotel, 30 Maret 2020, https://jenishotel.info/pengertian-hotel\r\n•	Maxmanroe.com, 2020, Pengertian Analisis: Arti, Turunan Kata, dan Contoh Penggunaannya, 30 Maret 2020, Maxmanroe.Com\r\n•	Ashkaf Harif, 2015, Pengertian sistem dan contohnya (softskill), 30 Maret 2020, https://arifashkaf.wordpress.com/2015/10/14/pengertian-sistem-dan-contohnya-softskill/\r\n•	hotels sahic, 2020, Penjelasan tentang layanan hotel berbintang, 30 Maret 2020 sahid hotels\r\n•	Maxmanroe.com, 2020, Pengertian Informasi: Definisi, Fungsi, Jenis, dan Contohnya, 30 Maret 2020, Maxmanroe.Com\r\n', 12, 4, '402058005', NULL, NULL, NULL, NULL, NULL, NULL, '1194061', 2, '1194060', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(38, 'ANALISIS FITUR LOKET TRANSAKSI PADA APLIKASI ANTRIAN BERBASIS WEB', 'Di zaman sekarang ini lokasi pelayanan umum perbankan banyak customer yang mengantri dengan berdesakan untuk mendapatkan pelayanan dari customer service terkait kebutuhan dari individu. Dalam sebuah instansi pelayanan umum, kenyamanan dan kepuasan customer merupakan hal penting. Bagi beberapa customer, mengantri menjadi hal kurang mengenakkan, dikarenakan jika antrian itu sangat panjang dan tidak dapat ditinggal. Hal itu, mengakibatkan kurangnya efisien waktu untuk melakukan kegiatan lain dikarenakan untuk menunggu tersebut.\r\n\r\nOleh karena itu, penelitian ini dibuat untuk membangun web berupa bantuan dalam melakukan antrian. Di aplikasi web ini terdapat beberapa fitur untuk memudahkan para customer mengambil nomor antrian dalam memilih pelayanan atas kunjungannya di bank tersebut, customer juga mempunyai pilihan yang cukup fleksibel pada saat mereka mengantri dan mendapat kepastian bahwa tempat mereka terjamin dalam antrian. Di web ini pihak pelayanan umum perbankan dapat menampilkan informasi terkait panggilan nomor antrian berikutnya dan berfungsi juga sebagai printer yang menghasilkan cetakan tiket antrian. Kemuadian customer dapat melihat dan memantau antriannya dengan adanya panggilan antrian dari pihak customer service.', 'Antri, Bank, Customer, Web', 'Di zaman sekarang ini lokasi pelayanan umum perbankan banyak customer yang mengantri dengan berdesakan untuk mendapatkan pelayanan dari customer service terkait kebutuhan dari individu. Dalam sebuah instansi pelayanan umum, kenyamanan dan kepuasan customer merupakan hal penting. Bagi beberapa customer, mengantri menjadi hal kurang mengenakkan, dikarenakan jika antrian itu sangat panjang dan tidak dapat ditinggal. Hal itu, mengakibatkan kurangnya efisien waktu untuk melakukan kegiatan lain dikarenakan untuk menunggu tersebut.\r\n\r\nOleh karena itu, penelitian ini dibuat untuk membangun web berupa bantuan dalam melakukan antrian. Di aplikasi web ini terdapat beberapa fitur untuk memudahkan para customer mengambil nomor antrian dalam memilih pelayanan atas kunjungannya di bank tersebut, customer juga mempunyai pilihan yang cukup fleksibel pada saat mereka mengantri dan mendapat kepastian bahwa tempat mereka terjamin dalam antrian. Di web ini pihak pelayanan umum perbankan dapat menampilkan informasi terkait panggilan\r\nnomor antrian berikutnya dan berfungsi juga sebagai printer yang menghasilkan cetakan tiket antrian. Kemuadian customer dapat melihat dan memantau antriannya dengan adanya panggilan antrian dari pihak customer service.\r\n\r\nDan diharapkan dengan adanya analisis pada fitur Loket Transaksi pada Aplikasi Antrian Bank Ini ini dapat membuat aplikasi ini lebih baik lagi. Maka dari itu kami mengambil judul dengan “ANALISIS FITUR LOKET TRANSAKSI PADA APLIKASI ANTRIAN BERBASIS WEB”.', 'Untuk menghindari bahasan laporan analisis yang terlalu luas, maka ruang lingkup laporan ini terbatas pada pembuatan sebagai berikut :\r\n\r\n1.	Data Customer Transaksi\r\nFitur ini yang menganalisis adalah Rachmatika Intan Sari. Pada fitur ini, admin dapat melihat dan mengelola data antrian para customer bank. Hanya admin yang sudah terdaftar di aplikasi ini yang dapat mengakses fitur tersebut. Fitur ini terhubung langsung dengan panel loket transaksi.\r\n2.	Panel Loket Transaksi\r\nFitur ini yang menganalisis adalah Aufarrifqi Muthahhari Aziz. Pada fitur ini admin dapat mengatur tampilan pada Layar LCD untuk menampilkan urutan customer. Pada panel loket transaksi, admin dapat mengatur urutan customer, mengontrol suara untuk memanggil customer dan dapat melompati nomor antrian. Fitur ini juga hanya admin yang sudah terdaftar di aplikasi ini yang dapat mengakses fitur tersebut. Fitur ini terhubung langsung dengan data customer transaksi.', '• ZonaReferensi.com, 2019, Pengertian Analisis, 1 April 2020, https://www.zonareferensi.com/pengertian-analisis-menurut-para-ahli-dan-secara-umum/\r\n\r\n• Seputarpengetahuan.com, 2015, Pengertian Sistem, 1 April 2020, https://www.seputarpengetahuan.co.id/2015/06/26-pengertian-sistem-menurut-para-ahli.html\r\n\r\n• Ruangguru.com, 2018, Pengertian Informasi, 1 April 2020, https://www.ruangguru.co.id/17-pengertian-informasi-menurut-para-ahli-dan-contohnya-lengkap/\r\n\r\n• Gurupendidikan.com, 2014, Pengertian Bank, 1 April 2020, https://www.gurupendidikan.co.id/pengertian-bank-menurut-para-ahli/\r\n\r\n• Adityo, Sutrisno, 2013, Teori Antrian, 1 April 2020, https://sutrisnoadityo.wordpress.com/2013/10/12/teori-antrian/', 12, 4, '407117405', NULL, NULL, NULL, NULL, NULL, NULL, '1194041', 2, '1194063', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(39, 'ANALASIS SYSTEM SETTING PADA APLIKASI ANTRIAN BANK', 'Sistem antrian Aplikasi Antrian Bank adalah saluran ganda (multichannel), sedangkan proses seorang nasabah yang akan melakukan transaksi pada teller menunjukkan hanya ada satu tahap (single phase). Jalur antrian teller dibedakan berdasarkan jenis transaksinya yaitu jalur umum, setoran tunai dan khusus. Hal ini difungsikan untuk efisiensi kecepatan transaksi. Pola tingkat kedatangannya adalah bersifat acak (random), Pengolahan data dengan POM- QM for Windows, hasilnya adalah setiap nasabah menghabiskan waktu 2,64 menit dalam setiap system yaitu waktu antri hingga selesai dilayani. ', 'Queuing Systems, Multichannel Single Phase, speed the efficiency', 'Pada jaman sekarang ini, menabung di Bank sangat diminati, dikenal dan dibutuhkan oleh banyak perusahaan dan masyarakat. Bank Merupakan sebuah lembaga intermediasi keuangan umumnya didirikan dengan kewenangan untuk menerima simpanan uang, meminjamkan uang, dan menerbitkan promes atau yang dikenal sebagai banknote. Dan pada saat kita ingin pergi ke Bank maka kita akan di tuntut untuk mengantri demi mendapatkan pelayanan yang sesuai dengan kebutuhan kita terhadap Bank tersebut.\r\n	Antrian pada Bank merupakan suatu fasilitas yang diberikan oleh pihak Bank yang di peruntukan untuk mengatur para nasabah agar lebih terteib, kondisional, dan upaya untuk meningkatkan efiseinsi kecepatan transaksi. Dengan demikian maka dibutuhkannya system untuk mengatur nomor antrian dari kebutuhan yang di perlukan. Maka dari itu, Aplikasi ini memiliki sistem yang berfungsi untuk mempermudah para nasabah untuk bisa mengantri sesuai dengan antrian yang ada.\r\n', 'Dari fitur setting yang ada pada aplikasi antrian bank kami akan menganalsis fitur-fitur yang ada di dalamnya dan untuk menghindari bahasan laporan terlalu luas, maka ruang lingkup laporan ini terbatas pada pembuatan sebagai berikut:\r\n1.	Aris Febriansyah Bertugas untuk menganalisis data sebagai berikut : \r\n•	Menganalisis data pengguna akun di mana pada data pengguna akun terdapat master data sebagai fungsi CURD yang bisa menambahkan akun, mengubah akun, dan meng update akun. Pengguna akun meliputi Id, username, dan nama lengkap pengguna \r\n•	Menganalisis data pengaturan menu di mana didalamnya bisa menambahkan menu, mengubah menu, meng update menu dan menampilkan menu\r\n•	Menganalisis pengaturan running text di mana di dalamnya bisa menambahkan tulisan running text, mengubah tulisan running text dan menampilkan tulisan running text\r\n2.	Ardhila Pudjaningrum Bertugas untuk mennganalsis data sebagai berikut\r\n•	Menganalisis data loket di mana terdapat fungsi CRUD yng bisa menambahkan data loket, mengubah data loket,meng update data loket, dan di dalam data loket meliputi Id loket, nama loket, no.loket, dan status loket\r\n•	Menanalisis pengaturan video LCD di mana bisa menambahkan video, mengubah video, mengupdate video  dan menampilkan video \r\n•	Menganalisis data pengaturan di mana bisa menambahkan data akun,mengubah data loket, mengupdate video LCD dan menampilkan tulisan running text.\r\n', 'https://id.wikipedia.org/wiki/Bank\r\nhttps://irnasianipar.wordpress.com/2014/12/04/pengertian-teori-antrian/\r\nhttp://repository.usu.ac.id/bitstream/handle/123456789/60620/Chapter%20II.pdf?sequence=4&isAllowed=y\r\nhttps://dspace.uii.ac.id/bitstream/handle/123456789/5624/skripsi%20fix.pdf?sequence=1\r\nhttps://id.scribd.com/doc/43903687/Makalah-Simulasi-Antrian-Bank\r\nAshkaf Harif, 2015, Pengertian sistem dan contohnya (softskill), 30 Maret 2020, https://arifashkaf.wordpress.com/2015/10/14/pengertian-sistem-dan-contohnya-softskill/\r\n', 12, 4, '407117405', NULL, NULL, NULL, NULL, NULL, NULL, '1194040', 2, '1194039', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(40, 'judul pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw ', 'abstrak pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo  ', 'keyword pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw ', 'latarbelakang - pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpo', 'ruang lingkup tugas - pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpopqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw mpoqwmpo mqwpo', 'daftar pustaka pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw pqnfqpw nqpw mqwp qw poqwmfpo qwmpoqw ', 1, 4, '424038805', NULL, NULL, NULL, NULL, NULL, NULL, '1234567', 3, '7654321', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(41, 'ANALISIS SISTEM INFORMASI PERPUSTAKAAN', 'Perpustakaan merupakan bagian dari sumber belajar yang harus dimiliki oleh setiap sekolah atau perguruan tinggi. Karena peserta didik dengan mudah mencari informasi atau ilmu pengetahuan melalui perpustakaan. Dengan adanya perkembangan teknologi membuat manusia berfikir untuk dapat bekerja lebih efektif dan efisien. Salah satunya yaitu membuat sistem konvensional menjadi sistem yang terkomputerisasi. Dengan memanfaatkan fasilitas website yang terhubung ke internet, perpustakaan dapat lebih efektif dan efisien dalam peminjaman dan pengembalian buku.\r\nPada penelitian ini dirancang suatu sistem informasi berbasis web menggunakan bahasa pemrograman PHP MySQL. Dengan sistem ini, diharapkan mampu mengatasi berbagai kebutuhan dari user untuk mencari buku dan melakukan pemesanan serta memudahkan administrasi sekolah dalam sirkulasi peminjaman buku dan pembuatan laporan.\r\nDari hasil penelitian yang telah dilaksanakan penulis mengimplementasikan hasil penelitian tersebut kedalam Perancangan Sistem Informasi Perpustakaan Berbasis Web\r\n', 'Perpustakaan', 'Membaca buku adalah sebuah kebiasaan yang baik yang banyak di gemari oleh banyak orang di seluruh dunia, membaca buku ini dapat di lakukan dimana saja. Membaca buku adalah point penting dalam pendidikan di negara manapun untuk meningkatkan sumber daya manusia agar menciptakan manusia yang berkualitas, namun selain di sekolah membaca buku juga dapat di lakukan dimana saja misalnya di halte pada saat meunggu bis atau mengisi waktu luang ketika santai. \r\n\r\nMembaca buku adalah jendela dunia, membaca buku juga sering di sebut jalan menuju kesuksesan, namun pada era ini budaya membaca sudah mulai pudar karena pada generasi saat ini banyak anak muda yang lebih suka bermain gadget karena telah menjadi trend di masa sekarang ini. Oleh karena itu aplikasi ini di buat untuk meingkatkan kembali semangat membaca khusunya di indonesia karena memiliki system yang efisien untuk mempermudah pembaca untuk meminjam sebuah buku.\r\n', '     Pada pengerjaan ini analisis aplikasi sistem informasi perpustakaan yang dibuat berbasis website dengan framework codeigniter berbasisbahasa pemrograman PHP.\r\n     Proses ini menggunakan CRUD(Create,Read,Update,Delete) yang akan dianalisis masing masing anggota kelompok yang dibagi bagi.\r\n     Setiap anggota akan menganalisis 2 modul CRUD (Create, Read, Update, Delete) dan 1 modul transaksional (melibatkan banyak tabel didalam prosesnya) jadi setiap kelompok minimal ada 4 modul CRUD dan 2 modul transaksi. Transaksi disini maksudnya proses pengolahan data yang melibatkan banyak tabel didalamnya contohnya penjadwalan perkuliahan pasti melibatkan tabel anggota dengan tabel buku,dll\r\nAnalisis yang akan dilakukan anggota kelompok:\r\nLinggo Prasetyo : Transaksional (Peminjaman) ,Crud(Anggota,Buku,User)\r\nMuhammad Al Farrabi: Transaksional(Pengembalian), CRUD(Buku,Anggota,User)\r\n     Aplikasi ini yang akan dianalisis ialah aplikasi sistem informasi perpustakaan yang berbasis web yang dapat menjelaskan sistem pinjam buku di perpustakaan menggunakan aplikasi ini.', '\r\n1.	Panjiasmoroart, May,17,2018 aplikasi sistem informasi perpustakaan berbasis web dengan framework CI diambil dari: https://github.com/panjiasmoroart/perpustakaan-codeigniter3\r\n\r\n2.	Penjelasan Materi PHP diambil dari : https://alan.co.id/pengertian-dan-fungsi-pemrograman-php/ ', 12, 4, '423127804', NULL, NULL, NULL, NULL, NULL, NULL, '1194054', 2, '1194047', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(42, 'ANALISIS APLIKASI SISTEM INFORMASI AKADEMIK  (SIAKAD) MODUL BIAYA KULIAH DAN KHS', 'ABSTRAK\r\nMasalah yang terjadi pada saat menggunakan website system informasi akademik adalah kurangnya pemahaman tentang bagaimana cara menggunakan dan mengakses website system akademik yang digunakannya. Tujuan kami menganalisis website system operasi akademik adalah untuk melaksanankan tugas dari proyek 1,lalu memahami bagaimana cara kerja system yang digunakan didalam website yaitu CRUD (Creat,Read,Update dan Delete) dan apa saja kekurangan yang ada pada system operasi akademik website yang kita akan analisis.\r\n	Landasan teori yang kita gunakan adalah pengertian dari sistem informasi akademik dan manfaatnya. Lalu pengertian PHP, web server yang mendukung PHP dan DBMS. Kemudian pengertian MySQL dan keungulaan dari MySQL itu sendiri.Yang terakhir adalah pengertian dari pengembangan system dan 3 siklus pengembangan sistemnya. Cara pelaksanaan dalam menganalisis sistem operasi akademik adalah pertama-tama kita memilih apa yang harus kita analisis, yang kedua kita mempelajari apa saja sistem yang digunakan, dan yang ketiga adalah kita mempelajari bagaimana sistem CRUD pada sistemnya.\r\n', 'PHP(Hypertext Preprocessor) ,Code Igniter, Sistem Informasi Akademik, web server, MySQL.', 'Memasuki era globalisasi ini, pemakaian teknologi komputer dalam bidang kehidupan sehari-hari tidak dapat dihindari. Bahkan, penggunaan teknologi komputer tersebut menjadi syarat utama untuk menunjukkan kualitas sesuatu bidang dan menjadi modal terpenting dalam memenangkan persaingan. \r\n	Diperlukan sebuah Sistem infomasi berbasis website di Jurusan yang mampu menunjang kinerja Dosen dan bagian Administrasi Akademik Jurusan dan juga dapat meningkatkan pelayanan terhadap Mahasiswa. Terutama suatu media informasi yang dapat mendukung dan meningkatkan komunikasi antara Dosen dan Mahasiswa, dan tentunya media komunikasi ini memberikan kemungkinan untuk meningkatkan potensi daripada Dosen dan Mahasiswa.\r\n	Menyadari pentingnya arus informasi yang berkembang pada saat ini maka penulis tertarik melakukan penelitian dengan judul : “Analisis Aplikasi Sistem Informasi Akademik (SIAKAD) Modul Biaya Kuliah dan KHS ”.\r\n', 'Mengingat luasnya cangkupan dalam pembahasan permasalahan yang bertujuan agar memudahkan orang lain mengerti apa yang diteliti dalam permasalahan kali ini,serta terarah agar menghindari dari kemungkinan pembahasan yang terlalu luas dan juga terhindar dari suatu kesalahpahaman dalam penelitian ini. Hal yang perlu di perhatikan antara lain, yaitu :\r\n1.7.1	Penelitian ini dilakukan untuk mengidentifikasi suatu kekurangan dan permasalahan yang ada pada Sistem Informasi Akademik Berbasis Website.\r\n1.7.2	Aplikasi ini merupakan suatu hal yang berguna bagi banyak orang untuk pengolahan data akademik dan efisiensi waktu dan juga penganalisisan aplikasi ini dibuat untuk memenuhi Proyek I. \r\n\r\n		Mengingat luasnya ruang lingkup sistem informasi akademik dari aplikasi tersebut, maka penulis membagi tugas masing-masing anggota dalam menganalisis sistem informasi akademik tersebut (SIAKAD). Berikut pembagian nama beserta tugasnya:\r\n1.	Muhammad Rizal Supriadi, menganalisis data dosen, data ruangan, biaya kuliah.\r\n2.	Danang Ari Subarkah, menganalisis matakuliah, jadwal kuliah dan KHS.\r\n', 'DAFTAR PUSTAKA\r\n\r\nAri, Angga. (2007). Contoh Abstrak. [Online]. Tersedia:               	http://repository.dinamika.ac.id/id/eprint/1990/5/BAB_III.pdf . Diakses pada 1        	April 2020\r\nHadi, Diki Alfarabi. (2015). Belajar PHP Dasar Pengenalan dan Kegunaan PHP.          	[Online]. Tersedia: https://www.malasngoding.com/belajar-php-dasar-	pengenalan-dan-kegunaan-php/ .  Diakses pada 1 April 2020.\r\nSIAKAD V 0.1 (2014), Softmediaservice.net.\r\nFikri, Muhammad. (2018). Konsep Dasar Sistem Basis Data. [Online]. Tersedia:\r\n	http://mfikri.com/artikel/konsep-basis-data. Diakses pada 1 April 2020\r\n', 12, 4, '424038805', NULL, NULL, NULL, NULL, NULL, NULL, '1194059', 2, '1194042', '2020-04-01 15:53:14', '2020-05-23 03:43:51');
INSERT INTO `proyek` (`id_proyek`, `judul_proyek`, `abstrak`, `keyword_abstrak`, `latar_belakang`, `identifikasi_masalah`, `daftar_pustaka`, `id_penelitian`, `id_kegiatan`, `id_dosen_pembimbing`, `id_dosen_penguji`, `tgl_sidang`, `tgl_sidang_ulang`, `nilai_pembimbing`, `nilai_penguji`, `ruangan`, `npm_ketua`, `status_proyek`, `npm_anggota`, `created_date`, `last_update`) VALUES
(43, 'ANALISIS APLIKASI CHATBOT MENGGUNAKAN MEDIA CHAT WHATSAPP DALAM MELAKUKAN PELAYANAN INFORMASI AKADEMIK DI LINGKUNGAN POLITEKNIK POS INDONESIA', 'ITeung merupakan aplikasi chatbot yang dibangun menggunakan bahasa pemrograman phyton. Aplikasi ini digunakan sebagai solusi pelayanan informasi mahasiswa dan memudahkan Admin untuk mengelola data, mulai dari merespon pesan pengguna, mengirim pesan pemberitahuan error, mengirim jadwal kuliah, hingga mengirim pemberitahuan kuliah akan dimulai dan selesai. \r\nDi dalam aplikasi ini, pengguna dapat berinteraksi dengan chatbot melalui pesan yang telah diidentifikasi dan digolongkan berdasarkan jenisnya pada database yang sudah dibuat. Selain itu, ITeung juga melakukan pencatatan daftar hadir mahasiswa yang mengikuti perkuliahan secara online. Namun aplikasi ini masih memerlukan pengembangan lebih lanjut. Maka dari itu, dalam analisis ini kami akan menganalisis dan menambahkan fitur yang kurang dalam aplikasi ITeung tersebut.\r\nAgar kami dapat melengkapi fitur dalam aplikasi ini, maka kami akan menganalisis aplikasi tersebut terlebih dahulu. Cara yang kami gunakan untuk menganalisis yaitu menggunakan flowmap. Tujuan penggunaan flowmap yaitu untuk mengetahui bagaimana algoritma yang berjalan dalam aplikasi ITeung. Selain itu, kami juga akan menganalisis proses bisnis dari aplikasi Iteung tersebut. Tujuannya yaitu untuk memudahkan pengguna mengetahui algoritma yang dijalankan pada aplikasi tersebut dan proses bisnisnya.', 'Aplikasi, Phyton, Pengguna, Chatbot, Database', 'Informasi dan komunikasi merupakan suatu aktivitas yang sering dilakukan oleh manusia. Bahkan setiap hari manusia membutuhkan dengan namanya informasi dan komunikasi tersebut. Namun, di era digital saat ini dalam proses pelayanan informasi dilingkungan politeknik pos Indonesia masih kurang efektif dan masih manual karena kita harus mencari data sendiri diwebsite kampus atau harus mengunjungi pusat informasi untuk mengambil data. Hal tersebut tentunya menguras waktu dan tenaga bagi dosen atau tenaga kerja lainnya dilingkungan Politeknik Pos Indonesia. Maka dari itu, mahasiswa memiliki terobosan dalam mengatasi hal tersebut dengan menciptakan aplikasi chatbot “Iteung” pada platform whatsapp. \r\n\r\nIteung merupakan sebuah program dari komputer berupa layanan pesan yang menggunakan teknologi AI (Artificial Intelegence) dalam melakukan percakapan virtual. Iteung dapat menerima dan menjawab pesan dari manusia sehingga terjadilah percakapan virtual tersebut. Aplikasi ini memiliki kemampuan menjawab pesan berupa sapaan, error message, dan not found message dari manusia. \r\n\r\nPada aplikasi chatbot ini masih terdapat kekurangan, salah satunya yaitu aplikasi ini belum sepenuhnya user friendly sehingga pengguna merasa bosan. Selain itu, layanan informasi pada aplikasi ini belum terlalu lengkap. Aplikasi ini masih melakukan layanan hanya seputar akademik saja.\r\n\r\nDengan hal tersebut, maka kami akan melakukan analisis guna menambah fitur-fitur yang kurang dalam aplikasi tersebut. Kami akan melakukan beberapa analisis mengenai analisis sistem yang berjalan, analisis algoritma yang digunakan, dan menganalisis proses bisnis dalam aplikasi chatbot ini.\r\n\r\nHal-hal yang melatarbelakangi aplikasi chatbot Iteung ini dibuat, yaitu antara lain:\r\n1.	Belum adanya asisten pribadi dalam media chat guna membantu pengguna dalam mengambil data atau mencari informasi mengenai bidang akademik di lingkungan Politeknik Pos Indonesia.\r\n2.	Belum tersediannya alat bantu untuk admin dalam merekap data guna kebutuhan bidang akamedik seperti absen.\r\n3.	Kurangnya ketertarikan manusia kepada chatbot yang menggunakan bahasa baku dalam penulisan pesan.\r\n4.	Belum adanya chatbot yang menggunakan bahasa kekinian yang lebih mudah dipahami saat berinteraksi dengan manusia.\r\n', '1.	BAB I PENDAHULUAN, bab ini menjelaskan tentang deskripsi dari aplikasi ITeung, identifikasi masalah, tujuan dibuatnya aplikasi tersebut, dan juga ruang lingkup dokumentasi.\r\n2.	BAB II  LANDASAN TEORI, bab membahas dibahas teori-teori yang mendukung pada aplikasi ini yang berdasarkan sumber-sumber yang faktual .\r\n3.	BAB III ANALISIS DAN PERANCANGAN,  bab ini akan menjelaskan mengenai analisis dan alur dari perancangan aplikasi chatbot yang akan disajikan berupa diagram-diagram alur yang bisa menjelaskan alur proses dari awal sampai akhir. \r\n4.	BAB IV IMPLEMENTASI DAN PENGUJIAN,  bab ini akan membahas dan memaparkan hasil implementasi aplikasi yang dijalankan dan pengujian terhadap aplikasi yang dihasilkan untuk mengukur sejauh mana aplikasi tersebut dapat digunakan. \r\n5.	BAB V KESIMPULAN DAN SARAN, bab ini menjelaskan kesimpulan setelah menganalisis system aplikasinya dan saran berupa perbaikan-perbaikan kedepannya.\r\n\r\nPembagian Tugas\r\n1	Alwizain Almas Trigreisian	\r\n•	Pembuatan respon opening message\r\n•	Pembuatan respon error message\r\n•	Pembuatan respon not found message\r\n•	Pembuatan respon kelas dimulai\r\n•	Pembuatan respon kelas selesai\r\n•	Pembuatan respon menunggu untuk permintaan jadwal kelas\r\n•	Perancangan pengembangan aplikasi chatbot  \r\n•	Analisis sistem yang sedang berjalan\r\n•	Analisis proses bisnis dalam aplikasi\r\n\r\n2	Burhanudin Zuhri	\r\n•	Pembuatan respon opening message\r\n•	Pembuatan respon error message\r\n•	Pembuatan respon not found message\r\n•	Pembuatan respon kelas dimulai\r\n•	Pembuatan respon kelas selesai\r\n•	Pembuatan respon menunggu untuk permintaan jadwal kelas\r\n•	Perancangan pengembangan aplikasi chatbot  \r\n•	Analisis algoritma yang sedang digunakan\r\n•	Analisis proses bisnis dalam aplikasi', 'Pengertian Chatbot https://docplayer.info/50849716-Pattern-matching-dalam-aplikasi-simsimi.html diakses secara [online] pada 31 Maret 2020 pukul 20.55\r\n\r\nAkhsan, Ahmad Alim dan Faizah.2017. ANALISIS DAN PERANCANGAN INTERAKSI CHATBOT REMINDER DENGAN USER-CENTERED DESIGN https://jsi.cs.ui.ac.id/index.php/jsi/article/view/555/347 diakses secara [online] pada 31 Maret 2020 pukul 21.03\r\n	\r\nPengertian chatbot https://id.wikipedia.org/wiki/Chatterbot diakses secara [online] pada 31 Maret 2020 pukul 23.52\r\n\r\nPegertian database https://id.wikipedia.org/wiki/Pangkalan_data diakses secara [online] pada 31 Maret 2020 pukul 23.55\r\n\r\nPengertian phyton https://id.wikipedia.org/wiki/Python_(bahasa_pemrograman) diakses secara [online] pada 1 April 2020 pukul 10.56\r\n\r\nPengertian selenium pyton https://skillplus.web.id/web-scraping-menggunakan-python/diakses secara [online] pada 1 April 2020 pukul 11.16', 5, 4, '410118609', NULL, NULL, NULL, NULL, NULL, NULL, '1194004', 2, '1194008', '2020-04-01 15:53:14', '2020-05-23 03:43:51'),
(44, 'Analisis sistem aplikasi montir.id', 'Bengkel mobil merupakan sarana bagi pengguna mobil baik untuk melakukan servis mobil, mengganti spare part mobil nya dengan yang baru ataupun melakukan perawatan terhadap mobilnya. \r\nPemesanan spare part mobil, booking servis mobil atau pun memanggil montir untuk servis mobil yang mogok menggunakan website supaya lebih baik dalam penggunaannya dan lebih membantu pengguna untuk menggunakannya. Dengan adanya website ini pengguna tidak lagi bingung ingin pergi kemana untuk melakukan servis mobilnya ataupun membeli spare part yang tersedia.', 'Bengkel, montir, aplikasi, website, layanan elektronik', 'Pada jaman sekarang, perindustrian sudah semakin meningkat sehingga perekonomian juga semakin meningkat, maka akan semakin banyak pengguna mobil. Hal tersebut akan menimbulkan semakin banyaknya persaingan dalam hal jasa perbaikan mobil atau bengkel mobil yang akan berdampak terhadap perusahaan. Perusahaan bengkel mobil saat ini masih mengutamakan kualitas perbaikan mobil tersebut tanpa mempertimbangkan pelayanan lainnya yang dapat membuat pelanggan nyaman dengan pelayanan tersebut.\r\nDengan adanya web montir.id ini maka masalah masalah tersebut dapat diatasi dengan baik. Dengan begitu pengguna kendaraan mobil dapat dengan baik menggunakan kendaraannya karena berbagai masalah yag dialami dapat segera diatasi, dan juga pelanggan juga dapat berkonsultasi dengan pihak bengkel mobil untuk mengetahui apa yang harus diperbaiki. \r\nDalam website ini juga terdapat fitur emergency yang dapat digunakan untuk melakukan derek bagi mobil yang mempunyai kendala mogok. Sehingga tidak lagi bingung jika mengalami mobil mogok. Dengan begitu pelanggan akan nyaman dengan perusahaan bengkel mobil ini dan pastinya akan menambah pelanggan dan meningkatkan kualitas perusahaan bengkel mobil ini.', 'Dalam pembuatan proyek ini kami membuat proposal terlebih dahulu dan mengajukannya. dalam hal proyek 1 kami membagi dua tugas tugas yang harus dilakukan untuk menyelesaikan tugas proyek 1, kami melakukannya supaya tugas proyek 1 cepat diselesaikan. Tugas dibagi sedemikian rupa supaya adil dan juga memastikan agar setiap anggota bekerja dalam pembuatan proyek 1 tersebut, dilakukan demi kebaikan setiap anggota\r\nAdapun tugas tersebut adalah :\r\nKhoirul aziz, disini akan bertugas untuk menganalisis proses CRUD pada menu servis berkala dan servis umum.\r\nFarhan ali syahbana, disini akan bertugas untuk menganalisis proses CRUD pada menu Ganti spare part dan Detailing\r\nDalam hal laporan kami akan mengerjakannya bersama agar lebih mudah dalam pengerjaannya.', 'https://jurnal.sttgarut.ac.id/index.php/algoritma/article/view/381\r\n264525 aplikasi pelayanan dan pengelolaan data bengkel secara elektronik berbasis web\r\n', 12, 4, '0403117607', NULL, NULL, NULL, NULL, NULL, NULL, '1194016', 2, '1194019', '2020-04-01 15:55:59', '2020-05-23 03:43:51'),
(45, 'ANALISIS SISTEM INFORMASI INVENTORI & PEMESANAN', 'Saat ini teknologi informasi sudah berkembang pesat, sehingga masyarakat semakin membutuhkan sistem informasi yang didukung oleh teknologi yaitu internet, apalagi persaingan di dunia bisnis saat Ini berkembang pesat juga,\r\n sehingga menuntut para pelaku bisnis harus selalu mengikuti perkembangan pasar. Sekarang sudah banyak pelaku bisnis yang sudah menggunakan website sebagai media penjualan, bahkan sebagai media pengelola persediaan barang . Maka dari itu penulis ingin melakukan penelitian yang bertujuan untuk mengetahui proses kerja dari suatu website yang digunakan untuk pemesanan dan inventori di sebuah supermarket. \r\nKata kunci : website, inventori, Teknologi Informasi, dan Bisnis\r\n', 'Kata kunci : website, inventori, Teknologi Informasi, dan Bisnis', '             Meningkatnya pendapatan masyarakat dan perubahan gaya hidup masyarakat serta perkembangan teknologi dunia menjadikan persaingan dalam dunia usaha semakin ketat. Ketatnya persaingan dalam dunia usaha berlaku bagi usaha apapun termasuk usaha supermarket. Supermarket di Indonesia mengalami peningkatan yang sangat pesat, dikarenakan banyak nya pengusaha yang memilih untuk membuka bisnis supermarket.\r\nDengan pesatnya perkembangan bisnis supermarket yang terjadi ini membuat perusahaan untuk lebih memikirkan cara agar bisnis ini tetap berjalan tidak berhenti ditengah jalan atau mengalami kebangkrutan. Semakin banyak pengusaha yang membuka bisnis supermarket akan semakin sulit untuk memikirkan cara agar perusahaannya itu tetap berjalan sesuai keinginannya.\r\nDengan begitu supermarket yang ingin bertahan harus benar-benar memikirkan perubahan apa yang harus diterapkan pada supermarket masing-masing. Salah satu caranya yaitu dengan menajadikan website sebagai media pemesanan barang yang diharapkan membuat supermarket mengalami peningkatan pembeli.dan pengelola persediaan barang agar admin lebih mudah dalam memantau persedian barang.\r\nOleh karena itu, dibangunlah aplikasi berbasis web ini yang dinamai superindo. Aplikasi ini yang digunakan untuk pemesanan produk yang ingin dibeli oleh konsumen dan sebagai pengelolaan persediaan barang bagi admin untuk memantau persediaan barang di supermarket tersebut.\r\n', '            Penyusunan laporan dibatasi pada system pembelian barang dan system keranjang, sehingga konsumen bisa menyimpan apa saja yang ingin di beli oleh konsumen nantinya dan juga kami akan menganalisis cara kera dari website yang sudah ada sebelumnya, sehingga dalam analisis lebih terfokus, terarah dan menghindari pembahasan yang sangat luas.\r\n	Mengingat luasnya ruang lingkup sistem inventory dan pemesanan dari aplikasi tersebut, maka penulis membagi tuga masing-masing anggota dalam menganalisis sistem informasi tersebut. Berikut pembagian nama beserta tugasnya :\r\n1 . Oktaviami Manullang bertugas menganalisis bagian data master dan data transaksi yaitu :\r\n•	Data Barang\r\nPada data barang ini berfungsi untuk mengetahui barang yang masuk dan barang yang keluar. Data barang ini juga akan menampilkan berapa stok barang yang masih ada disupermarket.\r\n•	Jenis Barang\r\nberfungsi untuk memberikan informasi jenis barang apa saja yang ada di supermarket.\r\n•	Purchase Order\r\nBagian ini yaitu menampilkan kumpulan daftar yang akan dipesan yang barangnya belum ready di supermaket dan nantinya akan dipesan oleh supermarketnya.\r\n2. Salsabila Vebi Natasya bertugas menganalsisis data master dan data transaksi yaitu :\r\n•	Data merk barang dalam proses ini terdapat fungsi CRUD (create,Read,Update,Delete) untuk mengelola data merk barang yang tersedia, menambah data merk barang, menampilkan data merk barang, update merk barang, delete data merk barang.\r\n•	Data supplier yang berfungsi untuk menampilkan data-data supplier supermarket proses ini juga terdapat fungsi CRUD(Create,Read,Update,Delete) yaitu Menambah data supplier, Menampilkan data supplier, Mengupdate data supplier, Menghapus data supplier.\r\n•	Data faktur yang berfungsi sebagai bukti transaksi pemesanan yang didalam nya terdapat yang didalam nya terdapat data barang, data supplier.\r\n', 'Puspitasari, Dayuk. 2016, Bab 1 pendahuluan. Eprintd perbanas, 1-2. http://eprints.perbanas.ac.id/2546/3/BAB%20I.pdf\r\nHeryanto, Agus, dkk. 2014, Rancang bangun sistem inventory barang berbasis web, jurnal sisfotek global, 2014, 32-33. \r\nhttps://stmikglobal.ac.id/journal/index.php/sisfotek/article/view/48/50\r\nEvelina Nela, dkk. 2012,Pengaruh citra merek,kualitas produk,harga,dan promosi terhadap keputusan pembelian kartu perdana telkomflexi, Diponegoro journal of social and politik, 2012, 6. https://ejournal3.undip.ac.id/index.php/jiab/article/view/1636\r\nSuryana, Dayat. 2012. mengenal Teknologi: Teknologi informasi, createSpace Independent PublishingPlatform,2012,8.  https://books.google.co.id/books?hl=en&lr=&id=F4hyDwAAQBAJ&oi=fnd&pg=PA5&dq=pengertian+teknologi&ots=63WrJu6YE4&sig=tljQQmy9c-Z95lWs27Yxegd5E-s&redir_esc=y#v=onepage&q=pengertian%20teknologi&f=false\r\nJunaidi, Agus, dkk. 2018, Aplikasi persediaan barang PT. CAD Solusindo menggunakan metode waterfall, jurnal sisfokom, vol 07, no 01, 2018. \r\nhttps://media.neliti.com/media/publications/265613-aplikasi-persediaan-barang-pt-cad-solusi-6425e8e0.pdf\r\n', 12, 4, '415107901', NULL, NULL, NULL, NULL, NULL, NULL, '1194062', 2, '1194066', '2020-04-01 16:02:41', '2020-05-23 03:43:51'),
(46, 'ANALISIS SISTEM WEB PENJUALAN TIKET PESAWAT DENGAN BAHASA PEMROGRAMAN PHP', 'ABSTRAK \r\n\r\nPada zaman kemajuan teknologi ini tidak susah dalam hal membeli suatu tiket pesawat untuk bepergian baik perjalanan ke luar negeri ataupun hanya perjalanan lokal saja. Tidak seperti zaman dahulu ketika belum berkembangnya teknologi pembelian tiket pesawat hanya bisa di lakukan langsung ke bandara atau melalui agen dengan persyaratan yang begitu rumit, dan mempunyai kekurangan lainnya. \r\nDalam penelitian ini kami akan menganalisis bagaimana suatu system di bangun, dan terdapat pengimplementasian algoritma yang di pakai pada Sistem Web Penjualan Tiket Pesawat dengan Bahasa Pemrogramman PHP. Serta akan mengkaji Crud dan table-table database yang saling berelasi dengan DBMS MySql.\r\nTidak ada penggunaan framework dari sitem web ini, dengan design masih sederhana karena menggunakan cara native yang masih sangat manual tanpa bantuan framework. Akan tetapi di web ini masih berjalan fungsi transaksi dari pemakaian algoritma dan Crud serta table yang saling berelasi dalam membangun database agar sistem tersebut berjalan dengan baik.\r\n', 'native, framework, database, DBMS, MySql.', '1.3.	Latar Belakang Masalah \r\n 	Jual beli adalah suatu jenis bisnis ekonomi yang kerap kali dilakukan oleh banyak orang baik itu barang atau layanan jasa untuk memenuhi suatu kebutuhan yang mereka perlukan, akan tetapi, di dalam suatu proses jual beli tersebut tidak boleh merugikan seseorang atau kedua belah pihak.Selain kedua belah pihak tidak boleh dirugikan dalam suatu proses jual beli. Di dalam suatu web jual beli itu harus ada proses transaksi yang jelas agar dalam prosesnya konsumen sebagai pembeli tidak merasa kebingungan.\r\n	Oleh sebab itu kami harus dapat menganalisis bagaimana cara program itu berjalan dengan baik walaupun dengan tampilan yang cukup sederhana. Namun memiliki fungsi yang sangat bermanfaat untuk banyak orang, baik itu konsumen ataupun pihak maskapai.\r\n	Maka dari itu, kami putuskan untuk mengambil judul “Analisis Sistem Web Penjualan Tiket Pesawat Dengan Bahasa Pemrogramman PHP”.\r\n', '1.7.	Ruang Lingkup Dokumentasi\r\nPembatasna dari pembahasan permasalahan tersebut bertujuan untuk memudahkan orang lain mengerti apa yang di teliti dalam permasalahan kali ini, serta terarah agar menghindari dari kemungkinan pembahasannya terlalu luas dan terhindar dari suatu kesalah pahaman dalam penelitian ini. Hal yang perlu di perhatikan antara lain, yaitu :\r\n1.	Proses penelitian ini adalah untuk kita dapat mengidentifikasi suatu web Penjualan Tiket Pesawat mulai dari algoritma, dan table databse yang saling berelasi.\r\n2.	Dan penganalisisan aplikasi ini untuk memenuhi Proyek I.\r\nMengingat luasnya ruang lingkup system informasi akademik dari aplikasi tersebut, maka penulis membagi tugas masing masing anggota dalam menganalisis aplikasi penjualan tiket berbasis web. Berikut pembagian nama beserta tugasnya :\r\n1. M. Ilyas Tri Khaqiqi, menganalisis menu konsumen, menu tujuan, dan transaksi pembayaran \r\n2. M. Rafly Fachrian A, menganalisis menu pegawai, menu   tiket dan transaksi tiket \r\n', '•	DewaWeb.com, 2018, Pengertian Web, 1 April 2020\r\nhttps:// www.dewaweb.com/blog/pengertian-website/ \r\n•	IdCloudHost.com, 2017, Pengertian Framework, 1 April 2020\r\nhttps://idcloudhost.com/mengenal-apa-itu-framework-beserta-jenisnya/\r\n•	IdCloudHost.com, 2016, Pengertian Laravel, 1 April 2020\r\nhttps://idcloudhost.com/pengertian-dan-keunggulan-framework-laravel/\r\n•	WebHostingTerbaik.com, 2019, JavaScript, 1 April 2020\r\nhttps://www.webhostingterbaik.id/tips-dan-peralatan/javascript-adalah/\r\n•	Ubaya.ac.id, 2014, PHP, 1 April 2020\r\nhttp://www.ubaya.ac.id/2014/content/articles_detail/144/Bahasa-Pemrograman-populer-PHP.html\r\n•	ProWeb.co.id, 2012, RDBMS, 1 April 2020\r\nhttps://www.proweb.co.id/articles/web_application/rdbms.html\r\n•	Upyes.wordpress.com, 2013, Pengertian MySQL, 1 April 2020\r\nhttps://upyes.wordpress.com/2013/02/06/pengertian-dan-sejarah-mysql/\r\n', 12, 4, '402047205', NULL, NULL, NULL, NULL, NULL, NULL, '1194050', 2, '1194058', '2020-04-01 16:10:49', '2020-05-23 03:43:51'),
(47, 'Aplikasi Ruang Diskusi Online', 'Pada era globalisasi saat ini pengaruh perkembangan teknologi informasi sangatlah pesat. Pengaruh perkembangan teknologi yang sangat pesat salah satunya dalam dunia pendidikan yang telah menerapkan sistem pembelajaran online. Pembelajaran yang menarik tentu akan menarik minat dan bakat mahasiswa untuk terus belajar serta mencapai sebuah target. Dengan adanya sistem pembelajaran online, mahasiswa/i diharapkan memiliki wawasan yang lebih luas. Dan dengan didukung sistem yang menerapkan sebuah konsep gamifikasi, mahasiswa/i dapat merasakan sensasi belajar sambil bermain. Untuk itu, dengan adanya sistem pembelajaran yang sudah berbasis online tersebut, maka pada pembelajaran entrepreneurship pun diharapkan dapat dilakukan secara online dengan mengembangkan sebuah forum/komunitas ZPreneur berkonsep gamifikasi yang dapat menampung semua kreativitas mahasiswa/i dalam berwirausaha serta membuat mahasiswa/i tidak jenuh dalam proses pembelajaran tersebut. Dengan permasalahan-permasalahan yang ada di era teknologi seperti ini, sistem pembelajaran yang baik adalah sistem yang mampu membuat mahasiswa/i lebih nyaman pada proses belajarnya, interaktif, serta inovatif. Maka itu, dengan adanya forum/komunitas Zpreneur, mahasiswa/i diharapkan mampu memperluas ilmu mereka dalam bidang entrepreneur dan mencoba pembelajaran baru dengan konsep gamifikasi yang cenderung mengajak mereka untuk tidak hanya sekedar belajar, namun juga dapat bermain.\r\nKata Kunci: Pembelajaran Online, Gamifikasi, Zpreneur, Komunitas.\r\n', 'Pengaruh perkembangan teknologi yang sangat pesat salah satunya dalam dunia pendidikan yang telah menerapkan sistem pembelajaran online. ', '           Diskusi adalah pertemuan ilmiah untuk bertukar pikiran mengenai suatu masalah yang dilakukan sekelompok orang yang membahas suatu topik yang menjadi perhatian umum dihadapan khalayak, pendengar (siaran radio), atau penonton (siaran televisi), khalayak diberi kesempatan untuk bertanya dan memberikan pendapat (KBBI). Disamping pembelajaran di ruang kelas, diskusi merupakan proses belajar mengajar yang wajib dilakukan pelajar khususnya mahasiswa untuk menambah wawasan, bertukar ilmu dan ide serta jajak pendapat yang mungkin jarang didapatkan di ruang kelas.\r\n           Seiring dengan perkembangan teknologi, diskusi pun ikut berkembang. Telah banyak dijumpai media berdiskusi dengan menerapkan teknologi. Salah satunya adalah diskusi berbasis online atau website. Dalam sebuah media diskusi online biasanya ada topik dan subtopik dari apa yang ingin dibahas. Dalam forum diskusi semua pengguna dapat melihat postingan, memberi pertanyaan atau saran serta memberikan komentar. Pengguna juga bisa melihat profil dari pengguna lainnya.\r\n            Tidak hanya itu, pengguna juga bisa mengirimkan pesan pribadi kepada sesama pengguna.Rata-rata di program studi fakultas teknikUniversitas Muhammadiyah Yogyakarta, khususnya jurusan Teknologi Informasi media yang digunakan untuk berdiskusi adalah Learning Management System (LMS) yang berbasis Moodel dan Facebook. Dalam LMS sendiri, ada beberapa kekurangan yang dirasakan saat menggunakannya untuk media berdiskusi, yaitu:\r\n-Dalam ruang diskusi ini, tidak semua user atau mahasiswa bisa melihat isi diskusi dan memberikan komentar pada diskusi tersebut. Disini user atau mahasiswa hanya bisa melihat diskusi pada semester, kelas dan mata kuliah yang diambil saja.\r\n\r\n           -Topik dan subtopik yang diangkat dalam forum diskusi ini hanya terpaku pada matakuliah yang telah disusun dalam kurikulum.Selain menggunakan LMS, media untuk berdiskusi juga menggunakan Facebook. \r\n            Dalam media Facebook juga didapati kekurangan ketika dipakai dalam menggunakan diskusi, yaitu:\r\n            -Kategori dan sub kategoriuntuk berdiskusi tidak ada dalam fasilitas. Sehingga topik, ide atau gagasan yang mau diangkat dalam sebuah diskusi tidak teratur.\r\n    \r\n  Latar Belakang Masalah Forum diskusi online merupakan media penyalur aspirasi masyarakat. berupa ide, gagasan, maupun pertanyaan. Ide, gagasan maupun, \r\n\r\npertanyaan tersebut lebih dikenal dengan istilah informasi. Dalam informasi berisi data teks, suara, maupun gambar. Dengan beragamnya bentuk infomasi ini perlu adanya  media penyampaian informasi yang informatif. Untuk hal informasi yang informatif dengan grafis yang menarik digunakan suatu framework yang mendukung berbagai teknologi yang disebut JQuery UI.\r\n          \r\n\r\nJQuery UI merupakan pengembangan dari JQuery yang memudahkan kita untuk membuat UI ( User Interface) web yang interaktif dengan berbagai fitur dan theme. Dengan penggunaan JQuery UI menyediakan berbagai interaksi, widget, animasi, effect, transisi yang memudahkan kita untuk membuat UI yang interaktif. JQuery UI menyediakan berbagai plug –ins yang didalamnya dalam mendukung interaktifitas web.\r\n             Didasari alternatif diatas, maka dalam penelitian ini akan dibangun suatu aplikasi berbasis web yang menggunakan JQuery UI yang diintegrasikan dengan bahasa pemrograman ASP.Net. penelitian dilakukan dengan menganalisis penerapan ASP.Net dengan dukungan JQuery UI dalam pembuatan forum diskusi online. Forum diskusi online yang akan dibangun adalah forum diskusi online pada Sragen online community. \r\n         Berdasarkan latar belakang yang terurai di atas, penulis tertarik untuk menganalisis aplikasi ruang diskusi yang berjudul “ARTIKEL ANALISIS APLIKASI RUANG DISKUSI ONLINE ”.\r\n', 'Dari latar belakang masalah tadi, memberikan identifikasi masalah yang akan di jadikan bahan penelitian sebagai berikut :\r\n\r\n 	Pengguna diskusi dari media sosial tidak diberikan ruang untuk mengutarakan pendapat terkait informasi yang didapat diperkulihan.\r\n 	Tidak ada forum khusus bagi mahasiswa fakultas teknik, sehingga menyulitkna mahasiswa antar fakultas teknik bertukar informasi.\r\n 	Fitur tambahan untuk aplikasi brainly agar aplikasi ini nantinya akan menjadi lebih baik ke depannya.\r\n\r\nDalam proses analisis, penulis membuat batasan sebagai berikut: \r\no	Aplikasi system informasi yang akan dianalisis adalah Brainly.\r\no	Database pada admin, user.\r\no	Sistem informasi yang digunakan pada aplikasi yang dianalisis.\r\nPembagian tugas proyek 1:\r\no	Muhamad Rizki Maulana Y.\r\n-	Menganalisis crud admin pada database.\r\n-	Menganalisis database Pertanyaan.\r\n-	Menganalisis tampilan aplikasi yang sedang dianalisis.\r\n-	Menganalisis Proses Sistem Jawab Get Koin.\r\no	Naurah Nazifah\r\n-	Menganalisis crud user pada database.\r\n-	Menganalisis database jawaban.\r\n-	Menganalisis system yang akan di bangun pada aplikasi.\r\n-	Menganalisis system yang sedang berjalan pada aplikasi.\r\n', '                                          https://www.bersosial.com/forums/\r\nhttps://ads.id/forums/index.php?forums/\r\nwww.academia.edu\r\n\r\nhttp://agussaputra.com/read-book-28-proyek+membuat+aplikasi+forum+diskusi+dengan+php+dan+mysql.html\r\n\r\nhttps://www.academia.edu/23801637/PERANCANGAN_APLIKASI_FORUM_DISKUSI_PADA_MEDIA_E-LEARNING_BERBASIS_WEB\r\n\r\nhttps://members.phpmu.com/forum/read/membuat-aplikasi-forum-diskusi\r\n', 12, 4, '415107901', NULL, NULL, NULL, NULL, NULL, NULL, '1194023', 2, '1194028', '2020-04-01 16:19:36', '2020-05-23 03:43:51'),
(48, 'ANALISIS APLIKASI RENI JAYA TRAVEL PADA SISTEM  E-BOOKING TICKET PESAWAT & KAPAL ', 'Perkembangan zaman pada era sekarang sangat modern dan lebih praktis serta lebih mudah dalam mengaksesnya atau menggunakanya khususnya dalam bidang tiket E-Booking (pemesanan online). Pemesanan tiket pada zaman dulu dengan pemesanan tiket zaman sekarang  sangatlah jauh perbeda, dimana dulu orang-orang harus mendatangai tempat pembelian tiket, setelah itu harus mengantri, dan menunggu, belum lagi sudah lama menunggu ternyata tiket yang ingin di pesan sudah habis, sehingga masyarakat kecewa dalam hal ini. Pemesanan tiket pada zaman sekarang sangatlah mudah, cepat, praktis, dan terjangkau hanya dengan memiliki ponsel pintar dan internet untuk melakukanya. Sehingga masyarakat tidak lagi harus cape-cape datang ketempat tersebut untuk membeli tiket serta tidak lagi kehabisan tiket.\r\nSekarang ini banyak sekali aplikasi-aplikasi yang digunakan untuk mempermudah dan  mempercepat proses pemesanan tiket yang dapat dijangkau oleh masyarakat salah satunya adalah Reni Jaya Travel. Pada saat proses E-Booking juga membutuhkan suatu system yang dapat menampung semua data yang diinputkan oleh user ataupun admin pada Reni Jaya Travel. Suatu sistem database dan Bahasa Pemrograman yang dapat merancang sistem aplikasi tersebut.\r\n', 'Registrasi,  E-Booking, Transaksi, Reni Jaya Travel', 'Pada zaman ini semakin hari semakin modrn dalam sistem informasinya, semua orang dapat dengan mudah dan cepat dalam melakukan kegiatan online. Hampir semua kegiatan dapat dijadikan online yang dapat meringankan beban kerja dari manusia. Salah satunya adalah E-Booking Ticket pada Reni Jaya Travel dimana dilihat dari segi efisiensinya lebih praktis, cepat, mudah, dan dapat dijangkau dan dari segi kemananpun lebih terjaga karena jika melakukan pemesanan tiket tidak harus keluar rumah \r\nE-Booking Ticket adalah suatu aplikasi yang dapat  melakukan proses pemesanan tiket secara online dimana konsumen tidak harus datang dan mengantri ke tempat pembelian tiket tersebut tetapi cukup dengan menggunakan ponsel pintar yang dimiliki dan internet saja sudah bisa melakukan e-booking ticket.\r\nPada aplikasi E-Booking sendiri hanya terdapat 2(dua) e-booking ticket yaitu yang pertama tiket pesawat dan yang kedua tiket kapal. Aplikasi ini hadir untuk memenuhi kebutuhan masyarakat khususnya yang ingin berpergian jarak jauh atau yang ingin menyembrangi pulau bahkan antar negara sekalipun.\r\n', 'Untuk menghindari bahasan laporan yang terlalu luas, maka ruang lingkup laporan ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut:\r\n1. Helmi Salsabila\r\n1.1 Pengolahan Data Tiket Pesawat\r\nMenu ini berfungsi untuk memberikan informasi\r\n?	     Nama Pesawat, yaitu: depat menambahkan data nama pesawat, update data nama pesawat, menampilkan data nama pesawat dana hapus data nama pesawat\r\n?	     Keberangkatan, yaitu: dapat menambahkan data keberangkatan, update data keberangkatan, menampilkan data keberangkatan dan hapus data keberangkatan.\r\n?	    Tujuan, yaitu: dapat menambahkan data tujuan, update data tujuan, menampilkan data tujuan dan hapus data tujuan.\r\n?	    Jam Keberangkatan, yaitu: dapat menambahkan data jam keberangkatan, update data jam keberangkatan, menampilkan data jam keberangkatan dan hapus data jam keberangkatan.\r\n?	    Jam Tiba, yaitu: dapat menambahkan data jam tiba, update data jam tiba, menampilkan data jam tiba dan hapus data jam tiba.\r\n?	    Kelas Penerbangan, yaitu: dapat menambahkan data kelas penerbangan, update data kelas Penerbangan, menampilkan data kelas penerbangan dan hapus data kelas penerbangan.\r\n?	    Harga, yaitu: dapat menambahkan data harga, update data harga, menampilkan data harga dan hapus data harga.\r\n?	    Status, yaitu: dapat menambahkan data harga, update data harga, menampilkan data harga dan hapus data harga.\r\n\r\n1.2 Pengolahan Data Bank Pembayaran\r\nMenu ini berisi alamat pembayaran yang harus dituju \r\n?	Nama Bank, yaitu: dapat menambahkan data nama bank, update data nama bank, menampilkan data nama bank dan hapus data nama bank.\r\n?	    Atas Nama, yaitu: dapat menambahkan data atas nama, update data atas nama, menampilkan data atas nama dana hapus data atas nama.\r\n?	NO Rekening, yaitu: dapat menambahkan data no rekening, update data no rekening, menampilkan data no rekening dan hapus data no rekening.\r\n2. Haekal Hilmi Zain\r\n2.1  Pengolahan Data Tiket Kapal\r\nMenu ini berfungsi untuk memberikan informasi\r\n?	Nama Kapal, yaitu: depat menambahkan data nama kapal, update data nama kapal, menampilkan data nama kapal dana hapus data nama kapal.\r\n?	Asal, yaitu: dapat menambahkan data Asal, update data asal, menampilkan data asal dan hapus data asal.\r\n?	Tujuan, yaitu: .dapat menambahkan data tujuan, update data tujuan, menampilkan data tujuan dan hapus data tujuan.\r\n?	Jam Berangkat, yaitu: dapat menambahkan data jam berangkat, update data jam berangkat, menampilkan data jam berangkat dan hapus data jam berangkat.\r\n?	Jam Tiba, yaitu: dapat menambahkan data jam tiba, update data jam tiba, menampilkan data jam tiba dan hapus data jam tiba.\r\n?	Harga, yaitu: dapat menambahkan data harga, update data harga, menampilkan data harga dan hapus data harga.\r\n?	Stok, yaitu: dapat menambahkan data stok, update data stok, menampilkan data stokdan hapus data stok\r\n?	Status, yaitu: dapat menambahkan data status, update data status, menampilkan data status dan hapus data status.\r\n2.2 Pengolahan Data Pemesanan Tiket Kapal\r\n		Menu ini menampilkan informasi tiket yang sudah dipesan.\r\n?	Nama Pemesan, yaitu: dapat menambahkan data nama pemesanan, update data nama pemesanan, menampilkan data nama pemesanan dan hapus data nama pemesanan.\r\n?	Nama Kapal, yaitu: dapat menambahkan data nama kapal, update data nama kapal, menampilkan data nama kapal dan hapus data nama kapal.\r\n?	Tanggal Keberangkatan, yaitu: dapat menambahkan data tanggal keberangkatan, update data tanggal keberangkatan, menampilkan data tanggal keberangkataan dan hapus data tanggal keberangkatan.\r\n?	Asal, yaitu: dapat menambahkan data asal, update data asal, menampilkan data asal dan hapus data asal.\r\n?	Tujuan, yaitu: dapat menambahkan data tujuan, update data tujuan, menampilkan data tujuan dan hapus data tujuan.\r\n?	Jumlah Tiket, yaitu: dapat menambahkan data jumlah tiket, update data jumlah tiket, menampilkan data jumlah tiket dan hapus data jumlah tiket.\r\n?	 Harga, yaitu: dapat menambahkan data harga, update data harga, menampilkan data harga dan hapus data harga.\r\n?	Total Harga, yaitu: dapat menambahkan data total harga, update data total harga, menampilkan data total harga dan hapus data total harga.\r\n?	Bayar, yaitu: dapat menambahkan data bayar, update data bayar, menampilkan data bayar dan hapus data bayar.\r\n', 'H.	Daftar Pustaka\r\n\r\n[1] Vermaat, Shelly Cashman Series, Discovering Computer 2009: Complite (Shelly Cashman), Edisi 1\r\n[2] Yuhefizar 2012, Cara Mudah Membangun Website Interaktif Menggunakan CMS Joomla Edisi Revisi, PT. Elex Media Komputindo, Jakarta\r\n[3] Rizky Dhanta 2009, Pengantar Ilmu Komputer, Surabaya: INDAH.\r\n[4] Darminto, Dwi Prastowo dan Rifka Julianty, 2002, Analisis Laporan Keuangan : Konsep dan Manfaat, Yogayakarta : AMP-YKPN\r\n[5] Syahrul dan Muhammad Afdi Nizar, 2000, “Kamus Istilah-istilah Akuntansi”, Cetakan Pertama, Citra Harta Prima, Jakarta\r\n[6] Heriyanto dan Abdul Kadir, 2005, Algoritma Pemrograman menggunakan C++, Andi. Yogyakarta\r\n[7] Pavlou, P. A. (2003), Consumer Acceptance of Electronic Commerce: Integrating Trust and Risk with the Technology Acceptance Model. International Journal of Electronic Commerce, 7 (3), 69–103\r\n[8] Kotler, Philip, 2001. Manajemen Pemasaran: Analisis, Perencanaan, Implementasi dan Kontrol, Jakarta: PT. Prehallindo.\r\n[9] Pikkarainen, et al, 2004. Consumer acceptance of online banking: an extension of the technology acceptance model Internet Research Volume 14 – Number 3 pp. 224-235\r\n', 1, 4, '402058005', NULL, NULL, NULL, NULL, NULL, NULL, '1194018', 2, '1194017', '2020-04-01 16:19:50', '2020-05-23 03:43:51'),
(49, 'ANALISIS SISTEM INFORMASI PARIWISATA', 'Pada zaman sekarang ini tidak semua orang bisa langsung menentukan tempat wisata yang ingin dituju. Ketika ingin bepergian keluar negeri kita belum mengetahui tempat wisata apa saja yang ada di sana dan bermasalah dengan komunikasi karena bahasa yang berbeda. Dan pastinya kita memerlukan tempat penginapan yang sesuai dengan budget masing-masing. Masalah ini di sebabkan oleh kurangnya pengetahuan tentang tempat wisata, yang mengakibatkan para wisatawan kesulitan dalam melakukan perjalanan wisata.\r\n	Berdasarkan permasalahan diatas maka dibuat sebuah aplikasi berbasis web untuk memberikan informasi yang akurat dan terpercaya kepada para wisatawan tentang tempat wisata yang ada didunia secara lengkap seperti tempat penginapan, destinasi wisata, tempat yang menjual berbagai cendra mata, pemandu wisata, wisata kuliner, dan lain sebagainya.Untuk membangun Aplikasi Parwisata ini diperlukan beberapa software antara lain dengan menggunakan CI Framework, Sublime Text serta memakai bahasa pemrograman PHP dan PHP myAdmin untuk database.', 'Parwisata, Wisatawan, PHP, CI Framework, PHP myAdmin.', 'Pariwisata adalah suatu aktivitas yang berhubungan dengan perjalanan atau rekreasi untuk liburan ke suatu tempat wisata atau daerah tertentu. Menurut Kodhyat pariwisata merupakan suatu perjalanan dari satu tempat ke tempat lain yang sifatnya sementara, dilakukan perorangan maupun kelompok, sebagai suatu usaha mencari keseimbangan dan kebahagiaan dengan lingkungan hidup dalam dimensi sosial, budaya, alam dan ilmu. Menurut Undang-Undang Nomor 9 Tahun 1990 Tentang Kepariwisataan. Pariwisata adalah segala sesuatu yang berhubungan dengan wisata termasuk objek dan daya tarik wisata serta usaha-usaha yang terkait di bidang ini.\r\nHal-hal yang terlibat dalam kegiatan pariwisata sebagai berikut (Pendit, 1994): Akomodasi, tempat seseorang untuk tinggal sementara.Jasa Boga dan Restoran, industri jasa di bidang penyelenggaraan makanan dan minuman yang dikelola secara komersial.Transportasi dan Jasa Angkutan, industri usaha jasa yang bergerak di bidang angkutan darat, laut dan udara.Atraksi Wisata, kegiatan wisata yang dapat menarik perhatian wisatawan atau pengunjung.Cinderamata (Souvenir), benda yang dijadikan kenang-kenangan untuk dibawa oleh wistawan pada saat kembali ke tempat asal.Biro Perjalanan, badan usaha pelayanan semua proses perjalanan dari berangkat hingga kembali.\r\nPada zaman sekarang ini tidak semua orang bisa langsung menentukan tempat wisata yang ingin dituju. Ketika ingin bepergian keluar negeri kita belum mengetahui tempat wisata apa saja yang ada di sana dan juga bermasalah dengan komunikasi karena bahasa yang berbeda. Dan juga pastinya kita memerlukan tempat penginapan yang sesuai dengan budget masing-masing. Masalah ini di sebabkan oleh kurangnya pengetahuan tentang tempat wisata, yang mengakibatkan para wisatawan kesulitan dalam melakukan perjalanan wisata.\r\nUntuk mengatasi masalah yang sudah disebutkan, pada proposal kali ini kami ingin membuat sebuah aplikasi berbasis web untuk memberikan informasi yang akurat dan terpercaya kepada para wisatawan tentang tempat wisata yang ada didunia secara lengkap seperti tempat penginapan, destinasi wisata, tempat yang menjual berbagai cendra mata, pemandu wisata, wisata kuliner, dan lain sebagainya.\r\n', 'Dalam proses menganalisis sebuah aplikasi untuk proyek 1, penulis membuat batasan sebagai berikut:\r\n?	Aplikasi system informasi yang akan dianalisis adalah aplikasi Pesona Kabogor dan Traveloka.\r\n?	Database pada admin, user, pemesanan, transaksi, dan pelayanan.\r\n?	Sistem informasi yang digunakan pada aplikasi yang dianalisis.\r\nPembagian Tugas proyek 1 :\r\n?	Petrolina Anastasia Gatto : \r\n-	Menganalisis Create Read Update Delete (CRUD)  pada admin \r\n-	Menganalisis database pada bagian admin\r\n-	Menganalisis database transaksi\r\n-	Menganalisis tampilan aplikasi yang sedang dianalisis\r\n-	Menganalisis system yang akan di bangun pada aplikasi.\r\n?	Artha Glory Romey Manurung :\r\n-	Menganalisis Create Read Update Delete (CRUD) pada user \r\n-	Menganalisis database pada pemesanan\r\n-	Menganalisis database pada bagian user\r\n-	Menganalisis databse pada pelayanan\r\n-	Menganalisis system pada aplikasi yang sedang berjalan ', 'pengertian pariwisata menurut para ahli. Diakses pada 31 Maret 2020, dari https://www.gurupendidikan.co.id/pengertian-pariwisata/\r\n\r\npengertian objek wisata. Di akses pada 31 Maret 2020, dari https://id.wikipedia.org/wiki/Obyek_wisata\r\n\r\npengertian php menurut para ahli. Di akses pada 31 Maret 2020, dari \r\nhttps://definisimenurutparaahli.blogspot.com/2017/06/4-definisi-php-menurut-para-ahli.html \r\n\r\npengertian javascript. Di akses pada 31 Maret 2020, dari \r\nhttp://hairun-nisya.blogspot.com/2013/03/pengertian-javascript.html. \r\n\r\npengertian mysql menurut para ahli. Di akses pada 31 Maret 2020, dari\r\nhttp://admingo.blogspot.com/2015/10/pengertian-mysql-menurut-para-ahli.html. \r\n\r\npengertian framework CodeIgniter . Di akses pada 31 Maret 2020, dari https://idcloudhost.com/panduan/mengenal-apa-itu-framework-codeigniter/', 12, 4, '415107901', NULL, NULL, NULL, NULL, NULL, NULL, '1194030', 2, '1194005', '2020-04-01 16:20:32', '2020-05-23 03:43:51'),
(50, 'Analisis Aplikasi Pengadaan Barang Berbasis Web', 'Dalam hal ini, kegiatan pengadaan barang mempunyai nilai dasar atau prinsip yang berfungsi sebagai landasan dalam pelaksanaan kegiatan tersebut. Nilai dasar tersebut meliputi keefektifan yang harus disesuaikan dengan kebutuhan yang telah ditetapkan, efisien yang mengharuskan kegiatan tersebut dengan dana yang terbatas untuk mencapai sasaran dan dapat di pertanggungjawabkan,transparan dimana pihak ketiga dapat melihat jelas barang yang akan dibeli. \r\n	Beberapa nilai dasar tersebut dapat menjadi acuan dalam pembuatan aplikasi pengadaan barang yang sesuai dengan landasan. Di dukung dengan semakin berkembangnya ilmu pengetahuan dan teknologi modern, dapat memberikan kemudahan bagi para pelaku bisnis untuk membuat cara kerja yang lebih praktis dalam melakukan monitoring kegiatan untuk mencapai suatu tujuan.\r\n	Maka dari permasalahan tersebut, kami menganalisis aplikasi web yang digunakan untuk proses pengajuan dan pengadaan barang, sehingga dapat berlangsung lebih mudah dan terkontrol bahkan tidak terlalu makan waktu yang banyak. Dengan hal ini satker(satuan kerja) bisa mengajukan surat pengajuan barang dan menggunakan akses web  pengadaan barang melalui online. ', ' Kata kunci : Pengadaan barang,  Teknologi modern, Landasan', 'Semakin berkembangnya ilmu pengetahuan dan teknologi pada era globalisasi ini, dapat memberikan kemudahan bagi para pelaku bisnis untuk membuat cara yang lebih praktis dalam memonitoring suatu kegiatan untuk mencapai tujuan. Perkembangan teknologi informasi ini dapat diterapkan dalam pelaksanaan kegiatan pengadaan barang.\r\n	Proses kegiatan pengadaan barang ini memerlukan waktu yang cukup lama dan biaya yang cukup besar, dengan demikian proses pengadaan barang tersebut sering tidak sesuai jadwal yang telah ditentukan. Dalam hal ini, analisis dilakukan dimaksudkan untuk mengembangkan aplikasi pengadaan barang yang bertujuan untuk mempermudah dalam memantau serta mengkaji kegiatan yang dilaksanakan sesuai dengan rencana.\r\n	Diharapkan dengan adanya aplikasi pengadaan barang ini dapat berjalan lebih efektif dan efisien. Berdasarkan pemaparan diatas maka kami akan melakukan sebuah analisis yang berjudul “Analisis Aplikasi Pengadaan Barang Berbasis Web”.', ' Eni mengerjakan atau melakukan analisis forum tambah user pengadaan barang, didalam forum pengadaan barang terdapat username, password, konfirmasi password, nama, email, no telepon, dan role. Pada modul forum tambah user terdapat fungsi create,read, update, delete. Selanjutnya eni melakukan analisis pada form input barang masuk, yang mana terdapat bagian  id transaksi, tanggal masuk, supplier, barang, stock, jumlah,dan total. Di form input data masuk ini juga terdapat fungsi create, read, update, delete.\r\n\r\nEris mengerjakan atau menganalisis riwayat data barang keluar, yang di dalam nya terdapat no transaksi, tanggal keluar, nama barang, jumlah keluar, user, dan hapus. Serta didalamnya juga memiliki fungsi create, read, update,delete. \r\nSelanjutnya Eris juga menganalisis form input barang keluar, yang terdiri dari ID transaksi, tanggal keluar, barang, stock, jumlah keluar dan total stock, serta di dalamnya jga memiliki fungsi create, read, update, dan delete.', '[1] Jhonsen. (2004). WEB DESIGNER untuk PEMULA. Jakarta: Elex Media Komputindo Kelompok Gramedia.\r\n[2] https://id.wikipedia.org/wiki/Pengadaan', 1, 4, '423127804', NULL, NULL, NULL, NULL, NULL, NULL, '1194012', 2, '1194013', '2020-04-01 16:29:56', '2020-05-23 03:43:51'),
(51, 'Analisis aplikasi web sekolah (M-sekolah)', 'Perkembangan teknologi  Informasi  sangat berpengaruh dalam kehidupan kita saat ini. Sumber daya manusia harus  terus berperan aktif dalam mengikuti perkembangan teknologi. Proses  penyampaian informasi dan proses promosi mengenai sekolah biasanya diumumkan menggunakan media surat, benner,brosur dan masih banyak lagi lainnya  yang memerlukan waktu yang lama sehingga prosesnya cukup panjang dan tak jarangterjadi miss komunikasi antara masyrakat dan pihak sekolah. Kondisi semacam ini apabila tidak segera disikapi dengan tepat  maka  dapat menjadi sumber potensi masalah bagi pihaksekolah  dikemudian hari,  Atas dasar pertimbangan itulah, maka  kami selaku penulis membuat penelitian untuk menganalisis sistem informasi M--SEKOLAH yang berbasis  web. Sistem informasi ini dibuat sebagai sarana dalam menyajikan informasi dan proses promosi sekolah kepada seluruh masyarakat  agar memepercepat proses pemyapaian informasi,proses promosi sekolah dan dapat meningkatkan kinerja sekolah.', 'sekolah, informasi, promosi, website', 'Website merupakan sebuah halaman informasi yang disediakan melalui jaeringan internet sehingga dapat diakses oleh seluruh dunia. Website sendiri terdiri dari teks, gambar, suara animasi sehingga dapat menjadi media informasi yang menarik untuk dikunjungi. Website juga dapat digunakan sebagai sarana interaksi antar sesama pengguna internet.\r\nSebelum berkembangnya teknologi informasi seperti saat ini, banyak sekolah yang memberikan informasi mengenai apa yang terjadi disekolah hanya melalui surat atau dari mulut ke mulut yang biasa kita sebut cara manual seperti itu. Hal tersebut kurang efektif karena menyita banyak waktu, oleh karena itu dibutuhkan sebuah website yang menyediakan mengenai informasi sekolah dan promosi sekolah agar dapat mempermudah pihak orang tua atau wali mendapatkan informasi dari sekolah dan juga mempermudah bagi sekolah yang ingin memberikan informasi karena tidak memrlukan waktu yang lama untuk menyampaikan informasi.\r\nMengingat pentingnya hal diatas, maka dukungan informasi yang cepat, tepat dan akurat sangat dibutuhkan. Sistem informasi ini harus benar–benar menyelesaikan permasalahan akan informasi dan promosi sekolah.', 'Dari proposal analisis ini kami membagi tugas untuk menganalisis sebagai berikut :\r\nFanny Devita Inggarini \r\nPengolahan Data guru Pada menu yaitu  sebagai berikut : Dapat  menambahkan data guru,\r\n update data guru, menampilkan data, hapus data guru. Dalam proses ini kita dapat mengubah \r\ndata diri  mengenai guru seperti merubah NIP,Nama,Tempat,Tanggal Lahir,jenis kelamin, dan matapelajaran yang diajarkan. Kita jugabisa menambahkan foto pada data diri dosen yang bersangkutan\r\nPengolahan Data kesiswaan: Menu ini berfungsi untuk memberikan keterangan \r\nmengenai data siswa dan prestasi mahasiswa. \r\n•	data siswa, yaitu: dapat menambahkan data buku, update data buku, \r\nmenampilkan data buku dan hapus data buku. \r\n•	Data Prestasi, yaitu: dapat menambahkan data kategori buku, update data kategori buku, menampilkan data kategori buku dan hapus data Kategori buku. \r\n \r\nPengolahan Laporan promosi sekolah  yang menampilkan kumpulan data dari table yang saling \r\nberelasi antara tb_data siswa, tb_galeri, tb_agenda  sehingga dapat tersusun menjadi laporan promosi sekolah \r\n\r\n2. Alek Brahma  \r\n2.1 Pengolahan Data Berita dalam proses ini terdapat fungsi CRUD (Create, Read, Update, Delete) untuk mengelola berita mengenai sekolah. \r\n•	 CRUD pada bagian ini dapat dilakukan dengan membuka menu kategori yang menjadi sub \r\ndari pilihan menu berita dimana kita bisa menambahkan kategori berita yang akan muncul pada website, kita bisa mengubah nama dari kategori yang ada,menanampilkan data serta menghapus kategori yang ada \r\nJika ingin menambahkan berita kita bisa mengklik menu post berita yang juga terdapat pada \r\nsub dari menu berita dimana kita bisa memasukkan judul,berita dan memasukkan pada kategori \r\nyang sesuai. Kita juga dapat menambahkan gambar yang sesuai dengan berita yang kita \r\ntuliskan\r\n\r\n2.2 Pengolahan Data Agenda : Menu ini berfungsi untuk mengelola data kegiatan apa yang terjadi misalnya agenda penerimaan rapot,agenda penyembelihan hewan kurban dan masih banyak lagi lainnya \r\n•  pada bagian ini kita dapat dapat memambahkan agenda kegiatan  yang akan dikerjakan oleh \r\npihak sekolah, menghapus agenda,menampilkan agenda dan  merubah berita yang ada pada agenda \r\n2.3 Pengolahan Data informasi sekolah  yang menampilkan kumpulan berita atau acara sekolah \r\n dari table yang saling berelasi antara tb_siswa, tb_agenda, tb_prestasi, tb_profil, tb_galeri sehingga dapat tersusun menjadi laporan.', 'https://id.wikipedia.org/wiki/Informasi\r\nhttps://id.wikipedia.org/wiki/Sekolah\r\nhttps://id.wikipedia.org/wiki/Promosi_(pemasaran)\r\nhttps://mfikri.com/soures\r\nModul  kerja praktik stikom Surabaya atas  nama  rayana suryatama', 12, 4, '423127804', NULL, NULL, NULL, NULL, NULL, NULL, '1194036', 2, '1194015', '2020-04-01 16:35:35', '2020-05-23 03:43:51');
INSERT INTO `proyek` (`id_proyek`, `judul_proyek`, `abstrak`, `keyword_abstrak`, `latar_belakang`, `identifikasi_masalah`, `daftar_pustaka`, `id_penelitian`, `id_kegiatan`, `id_dosen_pembimbing`, `id_dosen_penguji`, `tgl_sidang`, `tgl_sidang_ulang`, `nilai_pembimbing`, `nilai_penguji`, `ruangan`, `npm_ketua`, `status_proyek`, `npm_anggota`, `created_date`, `last_update`) VALUES
(52, 'ANALISIS APLIKASI LAUNDRY BERBASIS WEB (PHP)', 'ABSTRAK\r\nPada Era Globalisasi yang semakin canggih ini, tidak dipungkiri bahwa sebuah Layanan Jasa Pencucian atau yang biasa disebut Jasa Laundry sangat marah dan dibutuhkan oleh banyak orang. Dengan berkembangnya teknologi, semua konsumen pasti menginginkan hidup yang praktis. Seperti contoh kecil dari malasnya mencuci pakaian yang hampir menumpuk. \r\nDengan banyaknya masalah yang dihadapi saat ini mengenai pola hidup yang konsumtif, analisis ini dibuat untuk mempermudah pelayanan Jasa Laundry untuk tidak meninputkan data pelanggan (user) secara manual lagi. Melainkan menggunakan sebuah aplikasi yang akan memudahkan pelanggan (user) dan juga admin dalam melakukan sebuah transaksi. Analisis akan dilakukan menggunakan algoritma dengan contoh penggunaan  flowmap yang dapat membantu menyelesaikan permasalahan yang ada pada aplikasi tersebut. Dan metode pengembangan yang digunakan adalah bahasa pemrogram PHP dan  HTML dan basis data yang digunakan untuk menyimpan data adalah MYSQL.\r\n', 'Analisis, Algoritma, Flowmap, Metode.', 'Laundry adalah salah satu Bussiness Home yang bergerak di bidang jasa penyedia cuci pakaian. Dalam menjalankan kegiatannya perusahaan masih banyak yang menggunakan sistem informasi manual, salah satu bentuk contoh penerapan sistem manual adalah proses transaksi pembayaran pencucian pakaian, Penghitungan harga masih menggunakan kiloan. Dimana pelanggan harus menunggu lama untuk menghitung harga pakaian dalam sekali cuci, serta pelanggan yang masih diharuskan datang ke tempat laundry untuk melakukan pencucian. Selain itu sistem informasi manual yang masih diterapkan di perusahaan ini rawan sekali terjadi kesalahan atau bahkan kecurangan dalam pencatatan transaksi yang pada akhirnya berdampak pada penyajian laporan pendapatan yang kurang benar. \r\nBeberapa permasalahan yang ditemui pada jasa Laundry itu sendiri biasanya terdapat pada perhitungan. Terutama jika pelanggan menambahkan beberapa jenis pakaian dalam satu kali cuci, yang tentu saja rawan terjadi kesalahan saat melakukan perhitungan. Kemudian kasir kadang lupa untuk mencatat transaksi harian terutama jika kondisi laundry sedang ramai. Belum adanya pencatatan harian terhadap berapa banyak bahan baku yang digunakan yaitu detergen dan pewangi untuk satu kali cuci dan setrika juga berpotensi terjadinya kerugian terhadap usaha  laundry ini. Pencatatan transaksi yang berulang juga mengkonsumsi banyak kertas, ini mengakibatkan penggandaan data yang dikhawatirkan sebuah pencatatan manual berpotensi data transaksi hilang atau rusak. Beberapa kesalahan tersebut berakibat pada pembuatan laporan berisi pendapatan yang tidak akurat dan pada akhirnya akan merugikan perusahaan. \r\nBisnis laundry sebagai bisnis yang berjalan di bidang jasa pun dirasa akan lebih mudah apabila memasukkan unsur teknologi dan informasi di dalamnya. Berdasarkan hal tersebut, muncul lah ide untuk menambahkan sebuah menu aplikasi antar-jemput laundry yang digunakan oleh kurir pengantar dan penjemput laundry untuk mendata pakaian masuk dan mendata pelanggan baru secara tepat waktu untuk dikirimkan kepada admin. Aplikasi ini diharapkan dapat membantu menjalankan bisnis laundry secara mudah baik kepada kurir untuk bertransaksi dengan pelanggan maupun kepada admin untuk melakukan pengolahan data. \r\nMaka dari itu, analisis aplikasi laundry ini akan dikembangkan dan diperbaiki, dimana laundry ini menyediakan jasa cuci dengan penyesuaian jenis kelamin serta dewasa atau anak-anak. Selama ini proses administrasi pada pelayanan laundry masih menggunakan system manual serta transaksi laundry masih dicatat dalam bentuk nota pembayaran. Sehingga untuk melakukan pencarian data mengalami kesulitan dan membutuhkan proses yang lama. Untuk itu diharapkan pembuatan system informasi ini dapat memudahkan pelanggan serta admin dalam melakukan transaksi ataupun pelayanan dengan waktu yang efisien. \r\n', 'Dibawah ini merupakan pembagian tugas tiap individu kelompok mengacu pada analisis yang akan dikerjakan nanti. Tujuan diberikannya tugas tiap individu ini karena untuk mempermudah jalannya pengerjaan proyek 1 dan agar memiliki Batasan-batasan tiap persoalan yang akan dibahas, dengan ini pembagian tugas ini dibuat sebagai berikut: \r\n•	Lunetta Ivania Sidora, Bertugas untuk menganalisis data sebagai berikut : 1. Pengolahan Data Barang, dimana pada menu ini bisa dilakukannya proses penambahan data barang, menampilkan data barang, mengupdate data barang, dan menghapus data barang. Dan pengolahan Data Barang ini meliputi Kode Barang, Nama Barang, Stok, dan Tanggal update stok. 2. Pengolahan Data Member, dimana pada menu ini bisa dilakukannya proses penambahan data member, menampilkan data member, mengupdate data member, serta menghapus data member. Dan pengolahan data member ini meliputi kode member, nama member, alamat member, dan nomor handphone.\r\n•	Yunia Salsabila Ritonga,  Bertugas untuk menganalisis data sebagai berikut : 1. Pengolahan Form data jenis Laundry.  Dimana, pada menu ini bisa dilakukannya proses CRUD (create, read, update, dan delete) dan pengolahan form data jenis laundry ini meliputi ID jenis Laundry dan Jenis Laundry. 2. Pengolahan form pendaftaran tarif, dimana pada menu ini bisa dilakukannya proses CRUD (Create, read, update dan delete) dan pengolahan fotrm pendaftaran tarif ini meliputi ID jenis pakaian, nama pakaian, Tarif dan jenis laundry \r\n', 'DAFTAR PUSTAKA\r\n]   Wiradi. 2010, Pengertian Analisis.( https://www.maxmanroe.com/vid/umum/pengertian-analisis.html)\r\n[2]  Arief. 2011 , Definisi HTML (Hypertext Markup Language) https://definisimenurutparaahli.blogspot.com/2017/07/3-definisi-html-hypertext-markup.html \r\n[3] Nugroho. 2006, Definisi PHP Menurut Para Ahli (https://definisimenurutparaahli.blogspot.com/2017/06/4-definisi-php-menurut-para-ahli.html)\r\n[4]Stivnz. 2017, Pengertian PHP Crud di PHP MYSQL (https://sekolahkoding.com/forum/pengertian-crud-di-php-dan-mysql)\r\n[5] Almadk.1939,Definisi metode https://www.ruangguru.co.id/17-pengertian-dan-definisi-metode-menurut-para-ahli/\r\n', 12, 4, '416048803', NULL, NULL, NULL, NULL, NULL, NULL, '1194048', 2, '1194068', '2020-04-01 16:41:45', '2020-05-23 03:43:51'),
(53, 'ANALISIS SISTEM INFORMASI AKADEMIK BERBASIS WEBSITE', 'Pada zaman modern seperti sekarang cara belajar dan mengajar telah sangat berkembang pesat dan juga sistem pengolahan data konvensional dinilai kurang efektif pada zaman sekarang. Banyaknya masalah yang dialami dalam menggunakan sistem pengolahan data konvensional seperti data yang hilang, penginputan yang lama, serta banyak nya data yang harus dikelola dengan cara manual sehingga data yang diperoleh kadang menjadi kurang akurat. Tujuan pada penelitian kali ini adalah untuk menganalisis sistem informasi akademik berbasis website agar dapat membantu mengembangkan aplikasi yang dimaksud.\r\n	Maka dari itu untuk mengatasi masalah-masalah sistem pengolahan data konvensional tersebut dibangunlah sistem informasi akademik berbasis web dengan menggunakan bahasa pemrograman PHP (Hypertext Preprocessor) dengan Codeigniter sebagai framework dan MySQL sebagai Basis Data.\r\n', 'PHP , Code Igniter , MySQL , Sistem Informasi Akademik.', 'Pada zaman yang disebut telah modern ini pengolahan data dengan cara konvensional dinilai kurang efektif. Kendala yang sering dialami adalah waktu umtuk menginput data relatif lebih lama, data yang kurang akurat, kesultan dalam mengakses data dan kesulitan dsaat mencari data. \r\nSekolah Menengah merupakan sebuah lembaga yang bergerak di bidang akademik. Kebutuhan sistem informasi dinilai sangat penting dalam menunjang berbagai aktifitas akademik seperti registrasi siswa, penyimpanan nilai siswa, data diri siswa danaktifitas akademik lainnya.\r\nPada aplikasi sistem informasi akademik berbasis website ini, data-data sudah terkomputerisasi. Namun aplikasi tersebut dinilai kurang efisien, sehingga dapat mengurangi kualitas pelayanan baik itu terhadap mahasiswa maupun terhadap pegawai perguruan tinggi. Oleh karena itu dibutuhkan 2 analisis untuk mengetahui kelebihan dan kelemahan sistem informasi akademik berbasis website tersebut.\r\nDengan permasalahan-permasalahan diatas, maka penulis memutuskan untuk mengambil topik penelitian yang berjudul “Analisis Sistem Informasi Akademik Berbasis Website”. Penelitian ini diharapkan dapat membantu pembaca untuk memehami konsep sistem informasi akademik berbasis web, juga dapat membantu pengembang untuk mengembangkan aplikasi yang dimaksud.\r\n', 'Muhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.	Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.	Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.	Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\n		1.7.4.2 Fahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.	Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.	Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.	Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.', '[1] Arief, M.Rudianto. 2011. Pemrograman Web Dinamis Menggunakan Php dan Mysql\r\n[2] Bethasidik, Ir.2003.MYSQL.BandungToko:Buku BI-Obses \r\n[3] Fathansyah, Ir. 1999. Basis Data. Bandung : Infomatika Bandung. \r\n', 12, 4, '420058801', NULL, NULL, NULL, NULL, NULL, NULL, '1194024', 2, '1194045', '2020-04-01 16:50:15', '2020-05-23 03:43:51'),
(54, 'Analisis aplikasi Warehouse Management System (WMS)', 'Seiring dengan kemajuan dan perkembangan teknologi, kebutuhan manusia pada teknologi menjadi kebutuhan yang sangat bermanfaat. Pemanfaatan teknologi hampir dibutuhkan dalam semua aspek baik di bidang pendidikan, kesehatan, ekonomi, sosial dan budaya. Karena konsumen memiliki kemampuan untuk berbelanja online 24 jam/hari dan 7 hari/minggu, tantangan warehouse management tidak berhenti ketika toko-toko ritel mengunci pintu mereka untuk hari itu. Untuk mengurangi penundaan dan mempertahankan keunggulan kompetitif, ritel dan produsen, manajer gudang harus belajar bagaimana mengidentifikasi tantangan umum dan unik dan mengatasinya dengan menerapkan praktik terbaik kunci untuk setiap masalah.\r\n	Memahami cara kerja sistem aplikasi Warehouse Management System secara baik dalam menggunakan CRUD di framework CodeIgniter, serta menganalisis kekurangan pada aplikasi tersebut. Cara pelaksanaan dalam menganalisis aplikasi WMS ini adalah dengan memilih dan membagi hal yang akan di analisis lalu mempelajadi sistem tersebut dari source code sampai UI nya. \r\n', 'Warehouse Management System, WMS, PHP, CodeIgniter, CRUD', 'Seiring dengan kemajuan dan perkembangan teknologi, kebutuhan manusia pada teknologi menjadi kebutuhan yang sangat bermanfaat. Pemanfaatan teknologi hampir dibutuhkan dalam semua aspek baik di bidang pendidikan, kesehatan, ekonomi, sosial dan budaya. Termasuk juga dalam pengelolaan gudang, dibutuhkan sistem pengelolaan yang dinamis dan dapat mudah diakses dimana saja.\r\nKarena konsumen memiliki kemampuan untuk berbelanja online 24 jam/hari dan 7 hari/minggu, tantangan warehouse management tidak berhenti ketika toko-toko ritel mengunci pintu mereka untuk hari itu. Untuk mengurangi penundaan dan mempertahankan keunggulan kompetitif, ritel dan produsen, manajer gudang harus belajar bagaimana mengidentifikasi tantangan umum dan unik dan mengatasinya dengan menerapkan praktik terbaik kunci untuk setiap masalah.\r\nAplikasi Warehouse Management System mampu menunjang kinerja pengelolaan gudang secara baik sehingga mempermudah pengelolaan dan pelaporan pada sebuah gudang oleh pegawai administrasi dan karyawan di gudang.\r\nMenyadari pentingnya penggunaan Warehouse Management System maka peneliti tertarik melakukan penelitian dengan judul “ Analisis aplikasi Warehouse Management System (WMS)”.\r\n', 'Mengingat luasnya cangkupan dalam pembahasan permasalahan pada penelitian ini, bertujuan agar memudahkan orang lain serta terarah agar menghindari dari kemungkinan pembahasan yang terlalu luas dan juga terhindar dari suatu kesalahpahaman dalam penelitian ini. Hal yang perlu di perhatikan antara adalah penelitian ini dilakukan untuk menganalisis berbagai fitur dan masalah pada aplikasi warehouse management system.\r\nMengingat luasnya ruang lingkup dari aplikasi tersebut, maka peneliti membagi tugas masing-masing anggota dalam menganalisis sistem aplikasi warehouse management system (WMS). Berikut pembagian nama beserta tugasnya: \r\n1.	Yoga Sakti Hadi P: Data barang, Data transaksi, Data Supplier, Data Penyimpanan.\r\n2.	Daffa Algifary: Data user, Laporan, Data master, Data profile user.\r\n', 'Penulis. (2017). Mengenal Apa itu Framework CodeIgniter [Online]. https://idcloudhost.com/panduan/mengenal-apa-itu-framework-codeigniter. Diakses pada 30 April 2020\r\nEril. (2020) . Pengertian PHP dan Fungsinya Dalam Pemrograman Web [Online]. https://qwords.com/blog/pengertian-php. Diakses pada 30 April 2020\r\nPenulis. (2016). Pengertian MySQL [Online]. http://edel.staff.unja.ac.id/blog/artikel/Pengertian-MySQL.html. Diakses pada 30 April 2020\r\n', 12, 4, '424038805', NULL, NULL, NULL, NULL, NULL, NULL, '1164059', 2, '1194053', '2020-04-01 17:27:47', '2020-05-23 03:43:51'),
(55, 'ANALISIS APLIKASI PEMBAYARAN  PADA TOKO MEBEL BERBASIS WEB', 'Pada zaman yang  yang sudah maju seperti ini, seharusnya banyak kemudahan yang didapat dalam berinteraksi sosial salah satu contohnya yaitu transaksi jual beli. Tetapi kenyataan nya sebagian masyarakat masih jarang ataupun belum pernah melakukan nya. Maka dari itu tujuan dari pembuatan aplikasi ini yaitu membiasakan masyarakat menggunakan internet banking yang bermanfaat untuk menghemat waktu dan tenaga sehingga masyarakat dapat lebih produktif dalam keseharian nya. \r\n', 'Website, mebel, pemesanan online, internet banking', '      Pada zaman yang serba modern ini, banyak kemudahan yang didapat dalam berinteraksi sosial seperti melakukan transaksi online, dan mencari barang-barang yang di inginkan hanya dengan mengandalkan gadget yang ada, sehingga para penggunanya pun tak perlu keluar dari rumah bisa melakukan aktifitas sehari-hari seperti orang normal. \r\n	Maka dari akan terasa ketinggal jaman jika kita tidak menggunakan nya, berdasarkan jurnal Kompasiana bahwa Transaksi perbankan dengan menggunakan Electronic Banking (E-Bbanking) di Indonesia baik secara frekuensi maupun volume terus mengalami peningkatan. Untuk tahun 2014 saja volume E-Banking sudah mencapai Rp 6.447 triliun atau naik 17,32 persen dibanding tahun sebelumnya.\r\nDalam perkembangannya, E-Banking dipertimbangkan sebagai suatu strategi yang akan meningkatkan efisiensi, efektifitas dan produktifitas sekaligus meningkatkan pendapatan melalui sistem penjualan yang jauh lebih baik. \r\n	Web menjadi salah satu media yang digunakan untuk memasarkan produk dari penjual, seperti pada web yang kami sedang analisis ini.  pada web tersebut berfungsi untuk menghubungkan antara penjual dan pembeli sehingga tidak terjadi kekeliruan data antar keduannya. Untuk kedepannya diharapkan dapat memberikan dampak yang baik bagi perekonomian indonesia.\r\n	Berdasarkan uraian diatas, maka penulis memutuskan untuk mengambil topik penelitian yang berjudul \" ANALISIS APLIKASI PEMBAYARAN PADA TOKO MEBEL BERBASIS WEB”. Analisis ini diharapkan dapat membantu para pembaca dalam memahami konsep sistem informasi berbelanja online berbasis web.', 'Mengingat cakupan sistem analisis ini begitu luas  sehingga kami memutuskan membatasi dan membagi menjadi sebagai berikut :\r\n1. Muhammad Kautsar\r\n 1.1 Pengolahan Data Penjual\r\n   Pada menu ini terdapat master data yaitu sebagai berikut :\r\nData Nama Penjual, Di dalam nya dapat menambahkan data nama penjual,update nama penjual, menampilkan data dan menghapus data nama penjual\r\nData Alamat Penjual, Di dalam nya dapat menambahkan data alamat penjual,update alamat penjual, menampilkan data dan menghapus data alamat penjual\r\nData NIB, Di dalam nya dapat menambahkan data NIB,update NIB, menampilkan data dan menghapus data NIB\r\nData Nomor Handpone, Di dalam nya dapat menambahkan data Nomor Handpone,update Nomor Handpone, menampilkan data dan menghapus data Nomor Handpone\r\n1.2 Pengolahan Data Pengirim\r\n   Pada menu ini terdapat master data yaitu sebagai berikut :\r\nData Nama Pengirim, Di dalam nya dapat menambahkan data Nama Pengirim,update Nama Pengirim, menampilkan data dan menghapus data Nama Pengirim\r\nData Perusahaan, Di dalam nya dapat menambahkan data Perusahaan,update Perusahaan, menampilkan data dan menghapus data Perusahaan\r\nData Nomor Handpone, Di dalam nya dapat menambahkan data Nomor Handpone,update Nomor Handpone, menampilkan data dan menghapus data Nomor Handpone\r\n1.3 Pengolahan Data Pembayaran yang terdapat master data sebagai berikut :\r\nData Waktu Transaksi, Di dalam nya dapat menambahkan data Waktu Transaksi,update Waktu Transaksi, menampilkan data dan menghapus data Waktu Transaksi\r\nData Total Harga, Di dalam nya dapat menambahkan data Total Harga,update Total Harga, menampilkan data dan menghapus data Total Harga \r\nData Bank, Di dalam nya dapat menambahkan data Bank,update Bank, menampilkan data dan menghapus data Bank\r\n2. M Hadi Syatiri\r\n 2.1 Pengolahan Data Pembeli\r\n   Pada menu ini terdapat master data yaitu sebagai berikut :\r\nData Nama Pembeli, Di dalam nya dapat menambahkan data Nama Pembeli,update Nama Pembeli, menampilkan data dan menghapus data Nama Pembeli\r\nData Alamat Pembeli, Di dalam nya dapat menambahkan data Alamat Pembeli,update Alamat Pembeli, menampilkan data dan menghapus data Alamat Pembeli\r\nData Nomor Handpone, Di dalam nya dapat menambahkan data Nomor Handpone,update Nomor Handpone, menampilkan data dan menghapus data Nomor Handpone\r\n2.2 Pengolahan Data Barang\r\n   Pada menu ini terdapat master data yaitu sebagai berikut :\r\nData Jumlah Barang, Di dalam nya dapat menambahkan data Jumlah Barang,update Jumlah Barang, menampilkan data dan menghapus data Jumlah Barang\r\nData Jenis Barang, Di dalam nya dapat menambahkan Jenis Barang,update Jenis Barang, menampilkan data dan menghapus data Jenis Barang\r\nData Harga Barang, Di dalam nya dapat menambahkan data Harga Barang,update Harga Barang, menampilkan data dan menghapus data Harga Barang\r\n2.3 Pengolahan data Pemesanan  yang terdapat master data sebagai berikut :\r\nData Waktu pemesanan, Di dalam nya dapat menambahkan data Waktu pemesanan,update Waktu pemesanan, menampilkan data dan menghapus data Waktu pemesanan\r\nData Waktu pengiriman, Di dalam nya dapat menambahkan data Waktu pengiriman,update Waktu pengiriman, menampilkan data dan menghapus data Waktu pengiriman', '\r\nhttps://www.shinhan.co.id/article-listings/read/pengertian-internet-banking\r\n\r\nhttp://muhfajarshodiq.blogspot.com/2017/01/pengenalan-crud-create-read-update.html\r\nArief, M.Rudianto. 2011. Pemrograman Web Dinamis Menggunakan Php dan Mysql. Yogyakarta: ANDI.\r\nNugroho, Adi. 2006. E-commerce. Informatika Bandung. Bandung.', 1, 4, '420058801', NULL, NULL, NULL, NULL, NULL, NULL, '1194056', 2, '1194049', '2020-04-02 15:13:32', '2020-05-23 03:43:51'),
(86, 'a', 'asif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsii', 'a', 'asif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsi', 'asif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsiasif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsi', 'asif nasi naoi snin isn in isn isninsi nsin isni sni nsin sin isni snsi nisn isnisn isn isn sin sin sinsinsins insinsinsi', 1, 4, '424038805', NULL, NULL, NULL, NULL, NULL, NULL, '1174035', 2, '1174040', '2020-05-20 18:22:44', '2020-05-23 03:43:51'),
(87, 'asdas asdasda  asda a asda da asd asd asd asdas asd asd a', 'a a a a aa  aa a  a a a a a  a a a  a a aa  a a a a a a a a aa a a a  aa a a  a a a a a a a a a a  as ed sd asd daw d daw d awd a wed awd aed adw daw d awd a wd awd awd awd awd awd d awd  adw awd awd awd  awd awd awd a a a a aa  aa a  a a a a a  a a a  a a aa  a a a a a a a a aa a a a  aa a a  a a a a a a a a a a  as ed sd asd daw d daw d awd a wed awd aed adw daw d awd a wd awd awd awd awd awd d awd  adw awd awd awd  awd awd awd ', 'a,v,b,d,g', 'a a a a aa  aa a  a a a a a  a a a  a a aa  a a a a a a a a aa a a a  aa a a  a a a a a a a a a a  as ed sd asd daw d daw d awd a wed awd aed adw daw d awd a wd awd awd awd awd awd d awd  adw awd awd awd  awd awd awd a a a a aa  aa a  a a a a a  a a a  a a aa  a a a a a a a a aa a a a  aa a a  a a a a a a a a a a  as ed sd asd daw d daw d awd a wed awd aed adw daw d awd a wd awd awd awd awd awd d awd  adw awd awd awd  awd awd awd ', 'a a a a aa  aa a  a a a a a  a a a  a a aa  a a a a a a a a aa a a a  aa a a  a a a a a a a a a a  as ed sd asd daw d daw d awd a wed awd aed adw daw d awd a wd awd awd awd awd awd d awd  adw awd awd awd  awd awd awd a a a a aa  aa a  a a a a a  a a a  a a aa  a a a a a a a a aa a a a  aa a a  a a a a a a a a a a  as ed sd asd daw d daw d awd a wed awd aed adw daw d awd a wd awd awd awd awd awd d awd  adw awd awd awd  awd awd awd ', 'asdfasd asd sad asd ad asd ad ad ad asd ad as', 13, 4, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, '1174045', 3, '1174050', '2020-05-22 03:54:34', '2020-05-23 03:43:51'),
(88, 'Sitem Informasi Tesing', 'Sitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi Tesing', 'a,s,f,r,d', 'Sitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi Tesing', 'Sitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi Tesing', 'Sitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi TesingSitem Informasi Tesing', 5, 4, '424038805', NULL, NULL, NULL, NULL, NULL, NULL, '1174020', 3, '1174021', '2020-05-26 09:13:18', '2020-05-26 09:22:31'),
(89, 'asfafa', 'wiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wq', 'a,a,a,a,a', 'wiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wq', 'wiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wq', 'wiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wqwiqnfiwq iwq oiwqno iwqnoi nwqoi noiwqn oiwqnfoi qwnoi nwqion wqoin owqin oiwqn oiwqn iowqnoi wq', 1, 4, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, '1174022', 2, '1174023', '2020-05-26 11:21:54', '2020-05-27 09:28:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sidang`
--

CREATE TABLE `sidang` (
  `id_sidang` int(11) NOT NULL,
  `id_proyek` int(11) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `tgl_sidang_mulai` datetime NOT NULL,
  `tgl_sidang_selesai` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ruangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sidang`
--

INSERT INTO `sidang` (`id_sidang`, `id_proyek`, `npm`, `tgl_sidang_mulai`, `tgl_sidang_selesai`, `status`, `created_date`, `last_update`, `ruangan`) VALUES
(22, 87, '1174050', '2020-05-25 08:00:00', '2020-05-25 09:00:00', 0, '2020-05-23 10:36:52', '2020-05-23 10:36:52', '111'),
(23, 87, '1174045', '2020-05-25 08:00:00', '2020-05-25 09:00:00', 0, '2020-05-23 10:36:52', '2020-05-23 10:36:52', '111'),
(24, 88, '1174021', '2020-05-28 08:00:00', '2020-05-28 09:00:00', 0, '2020-05-26 09:24:15', '2020-05-26 09:24:15', '200'),
(25, 88, '1174020', '2020-05-28 08:00:00', '2020-05-28 09:00:00', 0, '2020-05-26 09:24:15', '2020-05-26 09:24:15', '200');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sidang_nilai`
--

CREATE TABLE `sidang_nilai` (
  `id_sidang_nilai` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `id_dosen` varchar(25) NOT NULL,
  `posisi` int(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_sidang` int(11) NOT NULL DEFAULT 0,
  `batas_revisi` datetime DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sidang_nilai`
--

INSERT INTO `sidang_nilai` (`id_sidang_nilai`, `nilai`, `id_dosen`, `posisi`, `created_date`, `last_update`, `id_sidang`, `batas_revisi`, `catatan`, `status`) VALUES
(8, 100, '123456789', 0, '2020-05-23 10:36:52', '2020-05-26 09:27:08', 22, '2020-05-28 04:26:33', 'qwfqwfwq', 1),
(9, 70, '424038805', 1, '2020-05-23 10:36:52', '2020-05-24 23:18:03', 22, '2020-05-26 06:07:50', 'fqwwqfqw', 1),
(10, 100, '123456789', 0, '2020-05-23 10:36:52', '2020-05-26 09:27:08', 23, '2020-05-28 04:26:33', 'qwfqwfwq', 1),
(11, 70, '424038805', 1, '2020-05-23 10:36:52', '2020-05-24 23:18:03', 23, '2020-05-26 06:07:50', 'fqwwqfqw', 1),
(12, 70, '424038805', 0, '2020-05-26 09:24:15', '2020-05-26 09:24:54', 24, '2020-05-27 04:24:40', 'Apasih', 1),
(13, 0, '123456789', 1, '2020-05-26 09:24:15', '2020-05-26 09:24:15', 24, NULL, NULL, 0),
(14, 70, '424038805', 0, '2020-05-26 09:24:15', '2020-05-26 09:24:54', 25, '2020-05-27 04:24:40', 'Apasih', 1),
(15, 0, '123456789', 1, '2020-05-26 09:24:15', '2020-05-26 09:24:15', 25, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sidang_progress`
--

CREATE TABLE `sidang_progress` (
  `id_sidang_progress` int(11) NOT NULL,
  `id_proyek` int(11) DEFAULT NULL,
  `nama_progress` text DEFAULT NULL,
  `status_penyelesaian` int(11) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_dosen` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sidang_progress`
--

INSERT INTO `sidang_progress` (`id_sidang_progress`, `id_proyek`, `nama_progress`, `status_penyelesaian`, `created_date`, `last_update`, `id_dosen`) VALUES
(14, 87, 'qwef', 1, '2020-05-24 23:18:25', '2020-05-26 04:22:17', '424038805'),
(15, 87, 'AGG', 0, '2020-05-24 23:18:25', '2020-05-24 23:18:25', '424038805'),
(16, 87, 'AOF', 0, '2020-05-24 23:27:53', '2020-05-24 23:27:53', '123456789'),
(17, 88, 'Siap', 0, '2020-05-26 09:24:54', '2020-05-26 09:24:54', '424038805'),
(18, 88, 'OK', 0, '2020-05-26 09:24:54', '2020-05-26 09:24:54', '424038805'),
(19, 87, 'qfwqfwq', 0, '2020-05-26 09:26:12', '2020-05-26 09:26:12', '123456789'),
(20, 87, 'qwfqwfwqfwq', 0, '2020-05-26 09:27:03', '2020-05-26 09:27:03', '123456789'),
(21, 87, 'qwfqwfwqfwq', 0, '2020-05-26 09:27:08', '2020-05-26 09:27:08', '123456789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sidang_ulang`
--

CREATE TABLE `sidang_ulang` (
  `id_sidang` int(11) NOT NULL,
  `id_dosen` varchar(15) DEFAULT NULL,
  `tgl_pengajuan_mulai` datetime DEFAULT NULL,
  `tgl_pengajuan_selesai` datetime DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_laporan`
--

CREATE TABLE `sub_laporan` (
  `id_proyek` int(11) DEFAULT NULL,
  `id_bimbingan` int(11) DEFAULT NULL,
  `nama_file` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alasan_revisi` text DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sub_laporan`
--

INSERT INTO `sub_laporan` (`id_proyek`, `id_bimbingan`, `nama_file`, `type`, `status`, `created_date`, `last_update`, `alasan_revisi`, `target`) VALUES
(40, NULL, '40_draft_1579182865920', 'draft', -1, '2020-05-16 10:22:57', '2020-05-16 10:22:57', 'Jangan dong', NULL),
(40, NULL, '40_draft_0', 'draft', -1, '2020-05-17 17:21:24', '2020-05-17 17:21:24', 'Boleh sip', NULL),
(40, NULL, '40_draft_123063742500', 'draft', -1, '2020-05-19 07:04:25', '2020-05-19 07:04:25', 'Masih belum', NULL),
(40, NULL, '40_draft_1891892457000', 'draft', -1, '2020-05-19 07:25:30', '2020-05-19 07:25:30', 'Belum eyt', NULL),
(40, NULL, '40_draft_1717829790000', 'draft', -1, '2020-05-19 07:28:25', '2020-05-19 07:28:25', 'asf', NULL),
(40, NULL, '40_draft_654258330000', 'draft', -1, '2020-05-19 07:29:36', '2020-05-19 07:29:36', 'safsafas', NULL),
(40, NULL, '40_draft_4590752025000', 'draft', -1, '2020-05-19 07:30:53', '2020-05-19 07:30:53', 'qwfwqf', NULL),
(40, NULL, '40_draft_1022203611000', 'draft', -1, '2020-05-19 07:32:29', '2020-05-19 07:32:29', 'wfwqfq', NULL),
(40, NULL, '40_draft_739792102500', 'draft', -1, '2020-05-19 07:32:53', '2020-05-19 07:32:53', 'Sip Mantap', NULL),
(22, NULL, '1194025_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', '', NULL),
(22, NULL, '1194025_proposal_4_2', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(25, NULL, '1194021_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(26, NULL, '1194069_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', '', NULL),
(26, NULL, '1194069_proposal_4_2', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(27, NULL, '1194055_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(28, NULL, '1194002_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nTugas dan tanggung jawab masing maisng anggota kelompok di jelaskan (Siapa melakukan apa) pada bagian lingkup tugas baik pada dokumen yang diupload maupun dituliskan pada form pengajuan proposal di aplikasi pada bagian identifikasi masalah atau lingkup tugas (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nsetiap mahasiswa 2 proses CRUD dan 1 proses CRUD transaksional, sebagai contoh :\r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\n1.7.4.2 Fahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(28, NULL, '1194002_proposal_4_2', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nTugas dan tanggung jawab masing maisng anggota kelompok di jelaskan (Siapa melakukan apa) pada bagian lingkup tugas baik pada dokumen yang diupload maupun dituliskan pada form pengajuan proposal di aplikasi pada bagian identifikasi masalah atau lingkup tugas (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nsetiap mahasiswa 2 proses CRUD dan 1 proses CRUD transaksional, sebagai contoh :\r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\n1.7.4.2 Fahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(28, NULL, '1194002_proposal_4_3', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(29, NULL, '1194014_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', NULL, NULL),
(29, NULL, '1194014_proposal_4_2', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(30, NULL, '1194031_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(31, NULL, '1194026_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(32, NULL, '1194010_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', '', NULL),
(32, NULL, '1194010_proposal_4_2', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(33, NULL, '1194070_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(34, NULL, '1194006_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(35, NULL, '1194057_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nTuliskan lingkup tugas dan tanggung jawab setiap mahasiswa (siapa melakukan apa) pada dokumen proposal yang diupload dan pada inputan aplikasi bagian lingkup tugas/identifikasi masalah\r\nSebagai Contoh :\r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\n1.7.4.2 Fahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(35, NULL, '1194057_proposal_4_2', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nTuliskan lingkup tugas dan tanggung jawab setiap mahasiswa (siapa melakukan apa) pada dokumen proposal yang diupload dan pada inputan aplikasi bagian lingkup tugas/identifikasi masalah\r\nSebagai Contoh :\r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\n1.7.4.2 Fahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(35, NULL, '1194057_proposal_4_3', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(36, NULL, '1194052_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(37, NULL, '1194061_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(38, NULL, '1194041_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(39, NULL, '1194040_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSilahkan diskusikan dengan pembombong segera!!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nyang diajukan : \r\nAris Febriansyah, di mana pada fitur ini adminlah yang memegang kendali atas pengguna akun yang ada pada aplikasi antrian bank. Seperti ingin menambahkan atau mengeluarkan akun dari aplikasi antrian bank ini.\r\n2.	Menganalisis Algoritma  Fitur loket\r\nPada proses ini, Ardhila pudjaningrum yang akan bertugas untuk menganalisis Algoritma dari fitur loket,di mana pada fitur ini ada dua data yang di olah yaitu data antrian untuk transaksi dan data antrian untuk administrasi  \r\n(Kurang memenuhi standar minimal proses yang dianalisis pada proyek 1 ini)\r\n\r\nSebagai Contoh : \r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\nFahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(39, NULL, '1194040_proposal_4_2', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSilahkan diskusikan dengan pembombong segera!!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nyang diajukan : \r\nAris Febriansyah, di mana pada fitur ini adminlah yang memegang kendali atas pengguna akun yang ada pada aplikasi antrian bank. Seperti ingin menambahkan atau mengeluarkan akun dari aplikasi antrian bank ini.\r\n2.	Menganalisis Algoritma  Fitur loket\r\nPada proses ini, Ardhila pudjaningrum yang akan bertugas untuk menganalisis Algoritma dari fitur loket,di mana pada fitur ini ada dua data yang di olah yaitu data antrian untuk transaksi dan data antrian untuk administrasi  \r\n(Kurang memenuhi standar minimal proses yang dianalisis pada proyek 1 ini)\r\n\r\nSebagai Contoh : \r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\nFahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(39, NULL, '1194040_proposal_4_3', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(40, NULL, '1234567_proposal_4_1', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Pembagian tugas kurang berimbang \nmahasiswa harus menganalisis minimal 2 proses CRUD data master dan 1 proses CRUD transaksi (melibatkan lebih dari 1 tabel, min 2 tabel terlibat dalam proses crudnya) contoh :\nUntuk menghindari pembahasan yang terlalu luas, maka ruang lingkup ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut:\n1.Muhammad Syiarul Amrullah\n1.1 Pengolahan Data Anggota\nPada menu ini terdapat master data yaitu, sebagai berikut :\nData anggota, yaitu: dapat menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota.\nData Kelas, yaitu: dapat menambahkan data kelas, update data kelas menampilkan data kelas dan hapus data kelas. \nData Agama, yaitu: dapat menambahkan data agama, update data agama, menampilkan data agama dan hapus data agama.\n1.2 Pengolahan Data Buku\n	Menu ini berfungsi untuk memberikan keterangan pergerakan data-data mencakup buku yang terdapat di perpustakaan tiap harinya.\n•	Data Buku, yaitu: dapat menambahkan data buku, update data buku, menampilkan data buku dan hapus data buku.\n•	Data Kategori, yaitu: dapat menambahkan data kategori buku, update data kategori buku, menampilkan data kategori buku dan hapus data Kategori buku.\n•	Data Rak, yaitu: dapat menambahkan data rak buku, update data rak buku, menampilkan data rak buku dan hapus data rak buku.\n•	Data Pengarang, yaitu: dapat menambahkan data pengarang buku, update data pengarang buku, menampilkan data pengarang buku dan hapus data pengarang buku.\n•	Data Penerbit, yaitu: dapat menambahkan data penerbit, update data penerbit, menampilkan data penerbit dan hapus data penerbit.\n•	Data Provinsi, yaitu: dapat menambahkan data provinsi, update data provinsi, menampilkan data provinsi dan hapus data provinsi.\n1.3 Pengolahan Laporan Pengembalian\n	Yang terdapat di Pengolahan Laporan Pengembalian yang menampilkan kumpulan data dari table yang saling berelasi antara tb_kembali, tb_pinjam, tb_anggota, tb_denda, tb_detail _pinjam sehingga dapat tersusun menjadi laporan\n2. Nur Ikhsani Suwandy Futri\n2.1 Pengolahan Data Petugas\n	Dalam proses ini terdapat fungsi CRUD (Create, Read, Update, Delete) untuk mengelola data petugas dan admin\n•	Tambah Petugas, yaitu: dapat membuat akun petugas dan admin\n•	Manage Petugas, yaitu: dapat menampilkan data petugas/admin, update data petugas/admin dan juga delete data petugas/admin\n2.2 Pengolahan Data Peminjaman\nMenu ini berfungsi untuk mengelola data transaksi tiap harinya\n•	Data Peminjaman, yaitu: dapat menambahkan data kelas, update data kelas, menampilkan data anggota dan hapus data anggota.\n•	Data kembali, yaitu: dapat menampilkan anggota yang telah mengembalikan buku yang dipinjam.\n2.3 Pengolahan Data Kembali\n	Yang terdapat di Pengolahan Data Kembali yang menampilkan kumpulan data dari table yang saling berelasi antara tb_kembali, tb_pinjam, tb_anggota, tb_denda, tb_detail _pinjam sehingga dapat tersusun menjadi laporan.', NULL),
(40, NULL, '1234567_proposal_4_2', 'proposal', -1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Pembagian tugas kurang berimbang \nmahasiswa harus menganalisis minimal 2 proses CRUD data master dan 1 proses CRUD transaksi (melibatkan lebih dari 1 tabel, min 2 tabel terlibat dalam proses crudnya) contoh :\nUntuk menghindari pembahasan yang terlalu luas, maka ruang lingkup ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut:\n1.Muhammad Syiarul Amrullah\n1.1 Pengolahan Data Anggota\nPada menu ini terdapat master data yaitu, sebagai berikut :\nData anggota, yaitu: dapat menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota.\nData Kelas, yaitu: dapat menambahkan data kelas, update data kelas menampilkan data kelas dan hapus data kelas. \nData Agama, yaitu: dapat menambahkan data agama, update data agama, menampilkan data agama dan hapus data agama.\n1.2 Pengolahan Data Buku\n	Menu ini berfungsi untuk memberikan keterangan pergerakan data-data mencakup buku yang terdapat di perpustakaan tiap harinya.\n•	Data Buku, yaitu: dapat menambahkan data buku, update data buku, menampilkan data buku dan hapus data buku.\n•	Data Kategori, yaitu: dapat menambahkan data kategori buku, update data kategori buku, menampilkan data kategori buku dan hapus data Kategori buku.\n•	Data Rak, yaitu: dapat menambahkan data rak buku, update data rak buku, menampilkan data rak buku dan hapus data rak buku.\n•	Data Pengarang, yaitu: dapat menambahkan data pengarang buku, update data pengarang buku, menampilkan data pengarang buku dan hapus data pengarang buku.\n•	Data Penerbit, yaitu: dapat menambahkan data penerbit, update data penerbit, menampilkan data penerbit dan hapus data penerbit.\n•	Data Provinsi, yaitu: dapat menambahkan data provinsi, update data provinsi, menampilkan data provinsi dan hapus data provinsi.\n1.3 Pengolahan Laporan Pengembalian\n	Yang terdapat di Pengolahan Laporan Pengembalian yang menampilkan kumpulan data dari table yang saling berelasi antara tb_kembali, tb_pinjam, tb_anggota, tb_denda, tb_detail _pinjam sehingga dapat tersusun menjadi laporan\n2. Nur Ikhsani Suwandy Futri\n2.1 Pengolahan Data Petugas\n	Dalam proses ini terdapat fungsi CRUD (Create, Read, Update, Delete) untuk mengelola data petugas dan admin\n•	Tambah Petugas, yaitu: dapat membuat akun petugas dan admin\n•	Manage Petugas, yaitu: dapat menampilkan data petugas/admin, update data petugas/admin dan juga delete data petugas/admin\n2.2 Pengolahan Data Peminjaman\nMenu ini berfungsi untuk mengelola data transaksi tiap harinya\n•	Data Peminjaman, yaitu: dapat menambahkan data kelas, update data kelas, menampilkan data anggota dan hapus data anggota.\n•	Data kembali, yaitu: dapat menampilkan anggota yang telah mengembalikan buku yang dipinjam.\n2.3 Pengolahan Data Kembali\n	Yang terdapat di Pengolahan Data Kembali yang menampilkan kumpulan data dari table yang saling berelasi antara tb_kembali, tb_pinjam, tb_anggota, tb_denda, tb_detail _pinjam sehingga dapat tersusun menjadi laporan.', NULL),
(40, NULL, '1234567_proposal_4_3', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Pembagian tugas kurang berimbang \nmahasiswa harus menganalisis minimal 2 proses CRUD data master dan 1 proses CRUD transaksi (melibatkan lebih dari 1 tabel, min 2 tabel terlibat dalam proses crudnya) contoh :\nUntuk menghindari pembahasan yang terlalu luas, maka ruang lingkup ini terbatas pada yang telah ditentukan pembagian tugas sebagai berikut:\n1.Muhammad Syiarul Amrullah\n1.1 Pengolahan Data Anggota\nPada menu ini terdapat master data yaitu, sebagai berikut :\nData anggota, yaitu: dapat menambahkan data anggota, update data anggota, menampilkan data, hapus data anggota.\nData Kelas, yaitu: dapat menambahkan data kelas, update data kelas menampilkan data kelas dan hapus data kelas. \nData Agama, yaitu: dapat menambahkan data agama, update data agama, ', NULL),
(41, NULL, '1194054_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(42, NULL, '1194059_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(43, NULL, '1194004_proposal_4_1', 'proposal', 1, '2020-04-01 15:53:14', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(44, NULL, '1194016_proposal_4_1', 'proposal', 1, '2020-04-01 15:55:59', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(45, NULL, '1194062_proposal_4_1', 'proposal', -1, '2020-04-01 16:02:41', '2020-05-20 01:08:41', '', NULL),
(45, NULL, '1194062_proposal_4_2', 'proposal', 1, '2020-04-01 16:02:41', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(46, NULL, '1194050_proposal_4_1', 'proposal', 1, '2020-04-01 16:10:49', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(47, NULL, '1194023_proposal_4_1', 'proposal', -1, '2020-04-01 16:19:36', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSilahkan diskusikan dengan pembimbing segera!!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional jadi setiap kelompok 4 proses CRUD data master dan 2 CRUD proses transaksi (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nyang diajukan : \r\nDalam perancangan aplikasi ini kami membagi tugas masing-masing.analisis data user dan analisis data pertanyaan yg masuk tugas Naurah Nazifah dan analisis data jawaban yang diberikan  dan kelola data total poin user tugas M.Rizki Maulana Y.\r\n(Kurang memenuhi standar minimal proses yang dianalisis pada proyek 1 ini)\r\n\r\nSebagai Contoh : \r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\nFahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(47, NULL, '1194023_proposal_4_2', 'proposal', -1, '2020-04-01 16:19:36', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSilahkan diskusikan dengan pembimbing segera!!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional jadi setiap kelompok 4 proses CRUD data master dan 2 CRUD proses transaksi (maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nyang diajukan : \r\nDalam perancangan aplikasi ini kami membagi tugas masing-masing.analisis data user dan analisis data pertanyaan yg masuk tugas Naurah Nazifah dan analisis data jawaban yang diberikan  dan kelola data total poin user tugas M.Rizki Maulana Y.\r\n(Kurang memenuhi standar minimal proses yang dianalisis pada proyek 1 ini)\r\n\r\nSebagai Contoh : \r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\nFahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(47, NULL, '1194023_proposal_4_3', 'proposal', 1, '2020-04-01 16:19:36', '2020-05-20 01:08:41', 'pastikan pembagian tugas memenuhi syarat minimal, yaitu 2 proses CRUD data master dan 1 proses CRUD transaksional untuk setiap mahasiswanya, lebih dariitu dipersilahkan, jika tidak memenuhi standar minimal, maka nilai tidak akan maksimal', NULL),
(48, NULL, '1194018_proposal_4_1', 'proposal', -1, '2020-04-01 16:19:50', '2020-05-20 01:08:41', '', NULL),
(48, NULL, '1194018_proposal_4_2', 'proposal', 1, '2020-04-01 16:19:50', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(49, NULL, '1194030_proposal_4_1', 'proposal', 1, '2020-04-01 16:20:32', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(50, NULL, '1194012_proposal_4_1', 'proposal', 1, '2020-04-01 16:29:56', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(51, NULL, '1194036_proposal_4_1', 'proposal', -1, '2020-04-01 16:35:35', '2020-05-20 01:08:41', '', NULL),
(51, NULL, '1194036_proposal_4_2', 'proposal', 1, '2020-04-01 16:35:35', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(52, NULL, '1194048_proposal_4_1', 'proposal', -1, '2020-04-01 16:41:45', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSilahkan diskusikan dengan pembimbing segera!!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional jadi setiap kelompok 4 proses CRUD data master dan 2 CRUD proses transaksi \r\n(maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nyang diajukan : \r\nDalam perancangan aplikasi ini kami membagi tugas masing-masing.analisis data user dan analisis data pertanyaan yg masuk tugas Naurah Nazifah dan analisis data jawaban yang diberikan  dan kelola data total poin user tugas M.Rizki Maulana Y.\r\n(Kurang memenuhi standar minimal proses yang dianalisis pada proyek 1 ini)\r\n\r\nSebagai Contoh : \r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\nFahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(52, NULL, '1194048_proposal_4_2', 'proposal', -1, '2020-04-01 16:41:45', '2020-05-20 01:08:41', 'Tolong baca baik baik catatan ini !!!\r\nSilahkan diskusikan dengan pembimbing segera!!!\r\nSetiap mahasiswa minimal menganalisis/memiliki tugas dan tanggung jawab terhadap 2 proses CRUD dan 1 proses CRUD transaksional jadi setiap kelompok 4 proses CRUD data master dan 2 CRUD proses transaksi \r\n(maximal upload tgl 03 April 2020,  jam 12 Siang)\r\nyang diajukan : \r\nDalam perancangan aplikasi ini kami membagi tugas masing-masing.analisis data user dan analisis data pertanyaan yg masuk tugas Naurah Nazifah dan analisis data jawaban yang diberikan  dan kelola data total poin user tugas M.Rizki Maulana Y.\r\n(Kurang memenuhi standar minimal proses yang dianalisis pada proyek 1 ini)\r\n\r\nSebagai Contoh : \r\nMuhammad Farhan Faridz Sofyan\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data siswa, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Siswa\r\nyaitu dapat menambahkan data siswa, menghapus data siswa , mengupdate data siswa, dan menampilkan data siswa.\r\nData siswa ini meliputi biodata siswa, tempat dan tanggal lahir siswa, agama siswa, alamat siswa dan kontak siswa\r\n2.Pengolahan data kelas\r\nYaitu dapat menambahkan data kelas, menghapus data kelas, mengupdate data kelas, dan menampilkan data kelas.\r\n3.Pengolahan data jursan peminatan.\r\nYaitu  dapat menambahkan data jurusan peminatan, mengupdate data jurusan peminatan, menghapus data peminatan, dan menampilkan data jurusan peminatan.	\r\nFahriza Rizky Amalia\r\nBertugas untuk menganalisis data sebagai berikut :\r\n1.Pengolahan data pengajar, pada menu ini terdapat terdapat master data yaitu sebagai berikut:\r\nData Pengajar\r\nyaitu dapat menambahkan data pengajar, menghapus data pengajar , mengupdate data pengajar, dan menampilkan data pengajar.\r\nData pengajar ini meliputi biodata pengajar, tempat dan tanggal lahir pengajar, agama pengajar, alamat pengajar dan kontak pengajar.\r\n2.Pengolahan jadwal kelas\r\nYaitu dapat menambahkan data jadwal kelas, menghapus data jadwal kelas, mengupdate data jadwal kelas, dan menampilkan data jadwal kelas.\r\n3.Pengolahan data mata pelajaran.\r\nYaitu dapat menambahkan data mata pelajaran, menghapus data mata pelajaran, mengupdate data mata pelajaran, dan menampilkan data mata pelajaran.\r\n', NULL),
(52, NULL, '1194048_proposal_4_3', 'proposal', 1, '2020-04-01 16:41:45', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(53, NULL, '1194024_proposal_4_1', 'proposal', -1, '2020-04-01 16:50:15', '2020-05-20 01:08:41', '', NULL),
(53, NULL, '1194024_proposal_4_2', 'proposal', 1, '2020-04-01 16:50:15', '2020-05-20 01:08:41', 'Silahkan Lanjutkan Bimbingan', NULL),
(54, NULL, '1164059_proposal_4_1', 'proposal', 1, '2020-04-01 17:27:47', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(55, NULL, '1194056_proposal_4_1', 'proposal', -1, '2020-04-02 15:13:32', '2020-05-20 01:08:41', 'Diskusikan dengan Pembimbing!!!', NULL),
(55, NULL, '1194056_proposal_4_2', 'proposal', 1, '2020-04-02 15:13:32', '2020-05-20 01:08:41', 'Silahkan lanjutkan bimbingan', NULL),
(80, NULL, '80_proposal_4_374787982800', 'proposal', 0, '2020-05-20 03:12:02', '2020-05-20 03:12:02', NULL, NULL),
(81, NULL, '81_proposal_4_750798266400', 'proposal', 0, '2020-05-20 04:41:28', '2020-05-20 04:41:28', NULL, NULL),
(82, NULL, '82_proposal_4_1971418402800', 'proposal', 0, '2020-05-20 04:43:46', '2020-05-20 04:43:46', NULL, NULL),
(83, NULL, '83_proposal_4_51200822400', 'proposal', 0, '2020-05-20 05:00:33', '2020-05-20 05:00:33', NULL, NULL),
(84, NULL, '84_proposal_4_17214069600', 'proposal', 0, '2020-05-20 05:02:21', '2020-05-20 05:02:21', NULL, NULL),
(85, NULL, '85_proposal_4_20706539490', 'proposal', 0, '2020-05-20 05:05:10', '2020-05-20 05:05:10', NULL, NULL),
(86, NULL, '86_proposal_4_52828859160', 'proposal', -1, '2020-05-20 18:22:44', '2020-05-20 19:13:13', 'C', NULL),
(86, NULL, '86_proposal_4_28978108500', 'proposal', -1, '2020-05-20 19:54:03', '2020-05-20 19:54:29', 'asfsa', NULL),
(86, NULL, '86_proposal_4_109915399440', 'proposal', -1, '2020-05-20 19:55:05', '2020-05-20 19:56:52', 'afasf', NULL),
(86, NULL, '86_proposal_4_26690538600', 'proposal', -1, '2020-05-20 19:57:12', '2020-05-20 19:57:58', 'qwfqw', NULL),
(86, NULL, '86_proposal_4_337888746690', 'proposal', -1, '2020-05-20 19:58:33', '2020-05-20 19:59:41', 'asfsaf', NULL),
(86, NULL, '86_proposal_4_1003596264000', 'proposal', -1, '2020-05-20 19:59:57', '2020-05-20 20:00:21', 'asfsa', NULL),
(86, NULL, '86_proposal_4_18369919920', 'proposal', -1, '2020-05-20 20:00:35', '2020-05-20 20:00:46', 'a', NULL),
(86, NULL, '86_proposal_4_6260249600', 'proposal', -1, '2020-05-20 20:00:56', '2020-05-20 20:01:15', 'qfwqf', NULL),
(86, NULL, '86_proposal_4_44689645440', 'proposal', -1, '2020-05-20 20:11:14', '2020-05-20 20:12:42', 's', NULL),
(86, NULL, '86_proposal_4_5178933760', 'proposal', -1, '2020-05-20 20:13:04', '2020-05-20 20:13:46', 'qwf', NULL),
(86, NULL, '86_proposal_4_6610610160', 'proposal', -1, '2020-05-20 20:14:01', '2020-05-20 20:14:27', 'asf', NULL),
(86, NULL, '86_proposal_4_307468068600', 'proposal', -1, '2020-05-20 20:14:39', '2020-05-20 20:15:30', 'asfasfa', NULL),
(86, NULL, '86_proposal_4_91769568000', 'proposal', -1, '2020-05-20 20:15:45', '2020-05-20 20:15:51', 'afs', NULL),
(86, NULL, '86_proposal_4_7981818240', 'proposal', -1, '2020-05-20 20:16:06', '2020-05-20 20:17:14', 'qfqwfq', NULL),
(86, NULL, '86_proposal_4_118318717440', 'proposal', -1, '2020-05-20 20:17:29', '2020-05-20 20:18:19', 'qwfwqfwqfqw', NULL),
(86, NULL, '86_proposal_4_55061740800', 'proposal', -1, '2020-05-20 20:19:37', '2020-05-20 20:19:45', 'qfwqfqwf', NULL),
(86, NULL, '86_proposal_4_32556854880', 'proposal', -1, '2020-05-20 22:03:30', '2020-05-20 22:07:06', NULL, NULL),
(40, NULL, '40_draft_157254090840', 'draft', 1, '2020-05-20 23:13:11', '2020-05-20 23:13:24', 'ABBA', NULL),
(40, 22, '1234567_bimbingan_4015_1', 'bimbingan', -1, '2020-04-02 13:02:21', '2020-05-21 17:42:06', 'setrip|Gak jadi deh, pasaa|S|SA|Gud', NULL),
(40, 22, '1234567_bimbingan_4015_2', 'bimbingan', -1, '2020-04-02 13:02:21', '2020-05-21 17:42:06', 'setrip|Gak jadi deh, pasaa|S|SA|Gud', NULL),
(40, 22, '1234567_bimbingan_4015_3', 'bimbingan', -1, '2020-04-02 13:02:21', '2020-05-21 17:42:06', 'setrip|Gak jadi deh, pasaa|S|SA|Gud', NULL),
(40, 22, '1234567_bimbingan_4015_4', 'bimbingan', -1, '2020-04-02 13:02:21', '2020-05-21 17:42:06', 'setrip|Gak jadi deh, pasaa|S|SA|Gud', NULL),
(40, 22, '1234567_bimbingan_4015_5', 'bimbingan', 1, '2020-04-02 13:02:21', '2020-05-21 17:42:06', 'setrip|Gak jadi deh, pasaa|S|SA|Gud', NULL),
(42, 23, '1194059_bimbingan_4213_1', 'bimbingan', -1, '2020-04-04 07:27:52', '2020-05-21 17:42:06', 'silahkan lanjutkan ke bab berikutnya', NULL),
(42, 23, '1194059_bimbingan_4213_2', 'bimbingan', -1, '2020-04-04 07:27:52', '2020-05-21 17:42:06', 'silahkan lanjutkan ke bab berikutnya', NULL),
(42, 23, '1194059_bimbingan_4213_3', 'bimbingan', 1, '2020-04-04 07:27:52', '2020-05-21 17:42:06', 'silahkan lanjutkan ke bab berikutnya', NULL),
(49, 24, '1194030_bimbingan_4913_1', 'bimbingan', 1, '2020-04-05 07:21:42', '2020-05-21 17:42:06', '', NULL),
(27, 25, '1194055_bimbingan_2713_1', 'bimbingan', -1, '2020-04-06 08:41:39', '2020-05-21 17:42:06', 'pada paragraf ketiga tolong di ganti kata warga pada kalimat \"membuat warga perguruan tinggi\" kurang cocok, dan silahkan lanjutkan pada bab berikutnya.', NULL),
(27, 25, '1194055_bimbingan_2713_2', 'bimbingan', 1, '2020-04-06 08:41:39', '2020-05-21 17:42:06', 'pada paragraf ketiga tolong di ganti kata warga pada kalimat \"membuat warga perguruan tinggi\" kurang cocok, dan silahkan lanjutkan pada bab berikutnya.', NULL),
(39, 26, '1194040_bimbingan_3913_1', 'bimbingan', 1, '2020-04-06 10:16:39', '2020-05-21 17:42:06', 'deskripsi aplikasinya belum lengkap, coba cari contoh paparan aplikasi serupa di internet sebagai referensinya', NULL),
(38, 27, '1194041_bimbingan_3813_1', 'bimbingan', 1, '2020-04-06 10:21:11', '2020-05-21 17:42:06', 'penjelasan belum lengkap, lengkapi ! cari contoh di internet', NULL),
(39, 28, '1194040_bimbingan_3914_1', 'bimbingan', 1, '2020-04-06 10:24:58', '2020-05-21 17:42:06', 'latar belakang kurang detail, cari contoh di internet', NULL),
(31, 29, '1194026_bimbingan_3113_1', 'bimbingan', 1, '2020-04-06 10:41:17', '2020-05-21 17:42:06', 'tema judul\r\n', NULL),
(37, 30, '1194061_bimbingan_3713_1', 'bimbingan', 1, '2020-04-06 11:41:51', '2020-05-21 17:42:06', 'harusnya ttg judul', NULL),
(45, 31, '1194062_bimbingan_4513_1', 'bimbingan', 1, '2020-04-06 12:28:55', '2020-05-21 17:42:06', '', NULL),
(25, 32, '1194021_bimbingan_2514_11194021_bimbingan_2514_1', 'bimbingan', -1, '2020-04-06 14:37:06', '2020-05-21 17:42:06', 'abstrak dan uraian permasalahan perbaiki', NULL),
(25, 32, '1194021_bimbingan_2514_2', 'bimbingan', -1, '2020-04-06 14:37:06', '2020-05-21 17:42:06', 'abstrak dan uraian permasalahan perbaiki', NULL),
(25, 33, '1194003_bimbingan_2514_11194021_bimbingan_2514_11194003_bimbingan_2514_11194021_bimbingan_2514_1', 'bimbingan', -1, '2020-04-06 14:37:14', '2020-05-21 17:42:06', 'rumusan masalah perbaiki :\nfokus pada kegiatan \'menganalisis\'', NULL),
(25, 33, '1194003_bimbingan_2514_2', 'bimbingan', 1, '2020-04-06 14:37:14', '2020-05-21 17:42:06', 'rumusan masalah perbaiki :\nfokus pada kegiatan \'menganalisis\'', NULL),
(31, 35, '1194026_bimbingan_3114_1', 'bimbingan', 1, '2020-04-06 15:14:15', '2020-05-21 17:42:06', '', NULL),
(35, 36, '1194057_bimbingan_3513_11194057_bimbingan_3513_11194057_bimbingan_3513_1', 'bimbingan', -1, '2020-04-07 05:27:38', '2020-05-21 17:42:06', 'laporan tidak ditemukan', NULL),
(31, 37, '1194026_bimbingan_3115_1', 'bimbingan', 1, '2020-04-07 06:27:25', '2020-05-21 17:42:06', '', NULL),
(30, 38, '1194031_bimbingan_3013_1', 'bimbingan', 1, '2020-04-07 06:46:58', '2020-05-21 17:42:06', 'Supaya tidak menakutkan dan kesannya terlalu formal maka saya meminta ijin kepada anda menggunakan Bahasa non formal tetapi berbobot salaam bimbingan dengan saya.\n\nDeskripsi aplikasinya oke sudah saya baca, mudah mudahan saja loh bisa bertanggung jawab apa yang loh jelaskan disitu gaees, gue pantau dan kalau gak sesuai kedepannya apa yang loh tulis sekarang hubungan kita berakhir sebagai pembimbing, disaat loh mengajukan sidang lho and gue ..goodbye, jadi sebagai tim project pertanggung jawabkan setiap kalimat yang loh tulis disini dan gw akan memantaunya\n\nLanjutkan ke bab selanjutnya dan perlu diingatkan lagi, laporan harus rapi, rata kanan, rata kiri, margin font dan seterusnya jangan seenak mu dalam upload laporan, hari ini gw maafin, kalua besok masih sama, jangankan maaf, nilai lho langsung 0 dan tidak akan guea baca.\n\nDalam menulis laporan ya gaes, baca lagi pedomannya, misalnya di bab 1 itu apa saja point-pointnya atau kerangka tulisannya begitu juga bab 2, 3 dan seterusnya, jangan merubah format laporan selain yang tertera di panduan laporan, gw gak mau banyak bacot intinya laporan loh saya terima dan segera perbaiki dan lengkapi lagi sampai bab 2.\n', NULL),
(29, 39, '1194014_bimbingan_2913_1', 'bimbingan', 1, '2020-04-07 07:26:23', '2020-05-21 17:42:06', 'Supaya tidak menakutkan dan kesannya terlalu formal maka saya meminta ijin kepada anda menggunakan Bahasa non formal tetapi berbobot salaam bimbingan dengan saya.\n\nDeskripsi aplikasinya oke sudah saya baca, mudah mudahan saja loh bisa bertanggung jawab apa yang loh jelaskan disitu gaees, gue pantau dan kalau gak sesuai kedepannya apa yang loh tulis sekarang hubungan kita berakhir sebagai pembimbing, disaat loh mengajukan sidang lho and gue ..goodbye, jadi sebagai tim project pertanggung jawabkan setiap kalimat yang loh tulis disini dan gw akan memantaunya\n\nLanjutkan ke bab selanjutnya dan perlu diingatkan lagi, laporan harus rapi, rata kanan, rata kiri, margin font dan seterusnya jangan seenak mu dalam upload laporan, hari ini gw maafin, kalua besok masih sama, jangankan maaf, nilai lho langsung 0 dan tidak akan guea baca.\n\nDalam menulis laporan ya gaes, baca lagi pedomannya, misalnya di bab 1 itu apa saja point-pointnya atau kerangka tulisannya begitu juga bab 2, 3 dan seterusnya, jangan merubah format laporan selain yang tertera di panduan laporan, gw gak mau banyak bacot intinya laporan loh saya terima dan segera perbaiki dan lengkapi lagi sampai bab 2.\n\nkelompok kalian gaes laporannya lumayan rapi dan gak bikin sakit mata saya, curiga kamu ini sudah banyak bergaul dengan para senior atau alumni dalam membuat laporan, gw suka gaya loh, lanjutkan', NULL),
(47, 40, '1194028_bimbingan_4713_1', 'bimbingan', 1, '2020-04-08 03:49:25', '2020-05-21 17:42:06', '', NULL),
(31, 41, '1194026_bimbingan_3116_1', 'bimbingan', 1, '2020-04-08 05:26:21', '2020-05-21 17:42:06', '80', NULL),
(34, 42, '1194006_bimbingan_3413_1', 'bimbingan', 1, '2020-04-08 06:54:41', '2020-05-21 17:42:06', 'Cukup', NULL),
(34, 43, '1194006_bimbingan_3414_1', 'bimbingan', 1, '2020-04-08 06:58:49', '2020-05-21 17:42:06', 'Didetailkan dan dijawab pada tujuan', NULL),
(34, 44, '1194006_bimbingan_3415_1', 'bimbingan', 1, '2020-04-08 07:01:27', '2020-05-21 17:42:06', 'Idem Identifikasi ', NULL),
(34, 45, '1194006_bimbingan_3416_1', 'bimbingan', 1, '2020-04-08 07:05:22', '2020-05-21 17:42:06', 'Cukup', NULL),
(34, 46, '1194006_bimbingan_3417_1', 'bimbingan', 1, '2020-04-08 07:06:37', '2020-05-21 17:42:06', 'Perlu tambahan referensi', NULL),
(48, 47, '1194018_bimbingan_4813_1', 'bimbingan', -1, '2020-04-08 09:48:23', '2020-05-21 17:42:06', 'lanjutkan', NULL),
(48, 47, '1194017_bimbingan_4813_2', 'bimbingan', 1, '2020-04-08 09:48:23', '2020-05-21 17:42:06', 'lanjutkan', NULL),
(37, 48, '1194061_bimbingan_3714_1', 'bimbingan', -1, '2020-04-08 10:19:54', '2020-05-21 17:42:06', 'identifikai nasalahnya, anda harusnya yg menganalisa, bukan kesimpulan akhir', NULL),
(37, 49, '1194061_bimbingan_3715_1', 'bimbingan', -1, '2020-04-08 10:20:27', '2020-05-21 17:42:06', 'text justify', NULL),
(37, 50, '1194061_bimbingan_3716_1', 'bimbingan', -1, '2020-04-08 10:21:20', '2020-05-21 17:42:06', 'batasan yg akan dianalisa?', NULL),
(37, 51, '1194061_bimbingan_3717_1', 'bimbingan', -1, '2020-04-08 10:22:20', '2020-05-21 17:42:06', 'format tulisan ikuti panduan', NULL),
(25, 54, '1194021_bimbingan_2513_1', 'bimbingan', 1, '2020-04-08 12:48:46', '2020-05-21 17:42:06', 'lanjutkan', NULL),
(36, 55, '1194052_bimbingan_3613_1', 'bimbingan', 1, '2020-04-08 13:31:52', '2020-05-21 17:42:06', 'project 1 difokuskan agar mahasiswa dapat menganalisis codingan dari aplikasi yang sudah jadi. \n\nberikan gambaran bahwa anda akan menganalisis source code dari aplikasi apa dan diambil dari mana, \n\ntolong perbaiki kembali, lalu bimbingan selanjutnya coba mulai menganalisis dari source code nya. \nmulai dari CRUD', NULL),
(33, 56, '1194070_bimbingan_3313_1', 'bimbingan', 1, '2020-04-08 13:47:17', '2020-05-21 17:42:06', 'project 1 anda diminta untuk menganalisis dari suatu aplikasi yang sudah jadi, \ntentukan anda akan menganalisis apa, diambil dari mana, source code nya seperti apa\nambil source code nya dan analisis\n\ntips : cari di toko buku, buku yang memberikan tahapan-tahapan pemrograman, nnt share jika sudah dapat\n', NULL),
(50, 59, '1194013_bimbingan_5013_1', 'bimbingan', 1, '2020-04-08 15:06:37', '2020-05-21 17:42:06', 'Tambahan deskripsi aplikasi :  1. Mulai dari proses awal / login, kemudian Jelaskan untuk user manajemen di lihat apakah ada beberapa level selain admin.\n2. Data Master sedikit di jelaskan juga (Master barang, master supplier)  \n3. untuk transkasi barang keluar coba apa yg terjadi apabila barang yg di keluarkan melebihi stok yg ada.  kemudian berikan penjelasan apa yg terjadinya', NULL),
(40, 97, '7654321_bimbingan_4013_1', 'bimbingan', 1, '2020-04-09 12:11:02', '2020-05-21 17:42:06', 'Sip', NULL),
(46, 98, '1194050_bimbingan_4613_1', 'bimbingan', 1, '2020-04-10 00:07:42', '2020-05-21 17:42:06', 'Tambahkan jurnal2 sebagai referensi penjelasan yg kamu tulis di latar belakang(nasional/onternasional) .Minimal 2. Jurnal yg bahas PHP dan jurnal yg bahas aplikasibsejenis', NULL),
(22, 99, '1194025_bimbingan_2213_1', 'bimbingan', 1, '2020-04-10 10:10:38', '2020-05-21 17:42:06', 'ikuti format laporan, font, rata kiri kanan,dll', NULL),
(22, 100, '1194025_bimbingan_2218_1', 'bimbingan', 1, '2020-04-10 10:12:03', '2020-05-21 17:42:06', 'harus ada kejelasan aktifitas tersebut milih siapa,pada flowchart sistem nya, perbaiki', NULL),
(26, 101, '1194069_bimbingan_2618_1', 'bimbingan', 1, '2020-04-10 12:08:36', '2020-05-21 17:42:06', 'font tidak sesuai, jangan copas. perbanyak lg mengenai pembahasan apa itu applikasi karir, dll.lanjutkan dengan flowchart. ', NULL);
INSERT INTO `sub_laporan` (`id_proyek`, `id_bimbingan`, `nama_file`, `type`, `status`, `created_date`, `last_update`, `alasan_revisi`, `target`) VALUES
(44, 102, '1194016_bimbingan_4413_1', 'bimbingan', 1, '2020-04-11 04:17:18', '2020-05-21 17:42:06', 'Harus lebih detail', NULL),
(52, 103, '1194048_bimbingan_5213_1', 'bimbingan', 1, '2020-04-11 08:44:58', '2020-05-21 17:42:06', 'Supaya tidak menakutkan dan kesannya terlalu formal maka saya meminta ijin kepada anda menggunakan Bahasa non formal tetapi berbobot salaam bimbingan dengan saya.\n\nAbstrak loh itu coyyy ampuun dah, isi abstrak itu adalah sebuah tulisan RINGKASAN/RANGKUMAN dari project yang kamu buat, syarat membuat abstrak bahasanya harus standart EYD dan terdapat SPOK (Subject + Predikat + objek dan keterangan) kalimat aktif bukan kalimat lampau / pasif atau khayalan indah loh saudara saudara, mohon diperbaiki.\n\nkemudian isi abstrak itu terdiri dari :\n1. State of the art (Definisi Ringkas Bidang Ilmu project yang kamu buat)\n2. Problem yaitu masalah loh kenapa buat project ini\n3. Metode yaitu tahapan loh bagaimana dalam membuat project loh itu, metodenya harus sesuai dengan referensi keilmuan informatika bukan buatan loh ya gaeees,\n4. Solusi yaitu menjelaskan bagaimana solusi yang didapatkan\n5. Result yaitu hasil yang di capai oleh project loh\n\nNah udah jelaskan gaees, jadi tolong baca dan baca dalam menulis karya ilmiah itu tidak segampang menulis curhatan hati loh apa lagi bukan chattingan bersama kekasih loh pada, jadi tolong serius dan baca semua referensi dalam menulis abtrak yang baik itu.\n\nkemudian perbaiki Bahasa inggris loh ampunnnnnn dahh,…gunakan tols gramerly.\n\nDeskripsi aplikasinya oke sudah say abaca, mudah mudahan asaja loh bias bertanggung jawab apa yang loh jelaskan disitu gaees, gue pantau dan kalua gak sesuai kedepannya apa yang loh tulis sekarang hubungan kita beranghir sebagai pembimbing, disaat loh mengajukan siding lho and gue ..goodbye, jadi sebagai tim project pertanggung jawabkan setiap kalimat yang loh tulis disini dan gw akan memantaunya\n\nLanjutkan ke bab selanjutnya dan perlu diingatkan lagi, laporan harus rapi, rata kanan, rata kiri, margin font dan seterusnya jangan seenak mu dalam upload laporan, hari ini gw maafin, kalua besok masih sama, jangankan maaf, nilai lho langsung 0 dan tidak akan guea baca.\n\n', NULL),
(28, 104, '1194027_bimbingan_2813_1', 'bimbingan', 1, '2020-04-11 14:38:29', '2020-05-21 17:42:06', 'Tinggal tambah referensi dari jurnal2 di latar belakang. Cari minimal 2 jurnal yg membahas aplikasi pemesanan (tiket)dan yg bahas aplikasi berbasis desktop', NULL),
(27, 105, '1194055_bimbingan_2714_1', 'bimbingan', -1, '2020-04-11 22:24:48', '2020-05-21 17:42:06', 'silahkan dilanjutkan tema bahasan selanjutnya', NULL),
(27, 105, '1194055_bimbingan_2714_2', 'bimbingan', -1, '2020-04-11 22:24:48', '2020-05-21 17:42:06', 'silahkan dilanjutkan tema bahasan selanjutnya', NULL),
(27, 105, '1194055_bimbingan_2714_3', 'bimbingan', 1, '2020-04-11 22:24:48', '2020-05-21 17:42:06', 'silahkan dilanjutkan tema bahasan selanjutnya', NULL),
(54, 106, '1164059_bimbingan_5413_1', 'bimbingan', -1, '2020-04-12 04:45:21', '2020-05-21 17:42:06', 'silahkan lanjutkan ke pembahasan berikutnya', NULL),
(54, 106, '1164059_bimbingan_5413_2', 'bimbingan', 1, '2020-04-12 04:45:21', '2020-05-21 17:42:06', 'silahkan lanjutkan ke pembahasan berikutnya', NULL),
(48, 107, '1194018_bimbingan_4817_1', 'bimbingan', 1, '2020-04-12 10:29:17', '2020-05-21 17:42:06', 'utk kutipan misal, \r\nhilangkan Asropudin (2013: ganti dengan [3]\r\nberlaku utk semua kutipan dan harus konsisten', NULL),
(48, 108, '1194018_bimbingan_4814_1', 'bimbingan', 1, '2020-04-12 11:28:39', '2020-05-21 17:42:06', ' ', NULL),
(26, 109, '1194069_bimbingan_2624_1', 'bimbingan', -1, '2020-04-13 11:57:27', '2020-05-21 17:42:06', 'lanjut ke bab 2', NULL),
(25, 110, '1194021_bimbingan_2517_1', 'bimbingan', 1, '2020-04-13 14:49:32', '2020-05-21 17:42:06', 'Berikan kutipan setiap teori dan cantumkan sumbernya didaftar pustaka. Lanjutkan ke bab berikutnya! ', NULL),
(50, 111, '1194013_bimbingan_5014_1', 'bimbingan', 1, '2020-04-14 02:39:02', '2020-05-21 17:42:06', '1. Mohon dihilangkan kata-kata : kita, kami\n2. Identifikasi masalah poin2 nya di buat lebih ringkas, singkat, padat dan jelas\n   contoh : \n   Identifikasi masalah:\n   1. adanya kejadian barang yang diterima pembeli tidak sesuai spesifikasi teknis, sehingga perlu menu/modul komplen/return barang.\n  2. Perlu adanya menu kompensasi keterlambatan pengiriman barang atau ada menu yang membatalkan transaksi secara otomatis apabila penjual tidak memproses nya dalam hari yg sudah di tentukan, selain itu poin ini akan berhubungan dengan perusahaan jasa kurir bukan hanya penjual, sehingga kompensasi bisa dilakukan di penjual. \n3.  Adanya menu cross cek pembayaran ke bank yang digunakan\n4. Ada menu deskripsi barang dan proses komunikasi antara penjual dan calon pembeli, sehingga dengan adanya menu tersebut penjual dan pembeli tidak ada yang merasa dirugikan.\n\n5. point 5 di hilangkan saja', NULL),
(41, 112, '1194054_bimbingan_4113_1', 'bimbingan', -1, '2020-04-14 14:21:37', '2020-05-21 17:42:06', '1. Jelaskan Bahasa pemrogaman dan database apa yang digunakannya?\n2. Penjelasan deskripsi aplikasi lampirkan screenshoot dari aplikasi dan database nya, setiap modul/menu di jelaskan mulai dari login sampai logout (sebagai admin dan sebagai user/anggota)\n3. Apakah ada menu (master, transaksi, report,dll)?\n4. Apakah ada proses keterlambatan pengembalian ? apabila ada bagaimana proses keterlambatan pengembalian buku tersebut ?\n5. Bagaimana apabila user daftar untuk jadi anggota di dalam aplikasi tersebut? \n', NULL),
(50, 113, '1194013_bimbingan_5015_1', 'bimbingan', 1, '2020-04-15 14:30:35', '2020-05-21 17:42:06', 'Ok, lanjut ke langkah berikutnya. \nSedikit catatan : untuk singkatan di kasih penjelasan nya\nCRUD = singkatan dari apa?\nselebihnya ok', NULL),
(55, 114, '1194056_bimbingan_5513_1', 'bimbingan', -1, '2020-04-16 10:30:27', '2020-05-21 17:42:06', 'Jangan hanya tentang pembayaran tetapi pergudangannya juga ', NULL),
(55, 114, '1194056_bimbingan_5513_2', 'bimbingan', 1, '2020-04-16 10:30:27', '2020-05-21 17:42:06', 'Jangan hanya tentang pembayaran tetapi pergudangannya juga ', NULL),
(26, 115, '1194069_bimbingan_2620_1', 'bimbingan', -1, '2020-04-16 12:30:17', '2020-05-21 17:42:06', 'perbaiki lg, bentuk struktur menunya. Struktur menu keseluruhan applikasi. bukan yg hanya di analisis saja', NULL),
(50, 116, '1194013_bimbingan_5016_1', 'bimbingan', 1, '2020-04-16 14:38:22', '2020-05-21 17:42:06', 'Ok, Lanjut ke bab /sub bab berikutnya', NULL),
(25, 117, '1194021_bimbingan_2515_1', 'bimbingan', 1, '2020-04-17 10:32:21', '2020-05-21 17:42:06', '1. abstrak diperbaiki lagi (paragraf1=menguraikan masalah, paragraf2=tujuan/tools/bahasa pemrograman, parafgraf3= pekerjaan dan hasil penelitian\n2. landasan teori gunakan kutipan/citasi\n3. tambahkan nomor halaman, biar saya mudah untuk menyebutkan halaman mana yg harus dikoreksi\n4. bab III tolong dibetulin dulu, gambar nimpatulisan, saya ga bisa membacanya\n5. buat laporannya yang rapilah sesuai aturan penulisan, biar saya ngoreksinya mudah.\n6. segera perbaiki', NULL),
(30, 118, '1194031_bimbingan_3014_1', 'bimbingan', 1, '2020-04-17 11:10:48', '2020-05-21 17:42:06', 'gak mau saya baca laporanmu berantakan tidak sesuai dengan format di buku panduan proyek https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html', NULL),
(30, 119, '1194031_bimbingan_3015_1', 'bimbingan', 1, '2020-04-17 11:12:36', '2020-05-21 17:42:06', 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', NULL),
(30, 120, '1194031_bimbingan_3016_1', 'bimbingan', 1, '2020-04-17 11:18:27', '2020-05-21 17:42:06', 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', NULL),
(30, 121, '1194011_bimbingan_3014_1', 'bimbingan', 1, '2020-04-17 11:59:40', '2020-05-21 17:42:06', 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', NULL),
(29, 122, '1194014_bimbingan_2914_1', 'bimbingan', 1, '2020-04-17 12:02:30', '2020-05-21 17:42:06', 'point satu identifikasi masalah gak kelas mksdunya apa? jelaskan, emang laporan efektig yang akan kamu buatkan itu gimana??', NULL),
(29, 123, '1194014_bimbingan_2915_1', 'bimbingan', 1, '2020-04-17 12:02:52', '2020-05-21 17:42:06', 'tujuan tidak menjawab point masalah yang disampaikan', NULL),
(29, 124, '1194014_bimbingan_2916_1', 'bimbingan', 1, '2020-04-17 12:03:22', '2020-05-21 17:42:06', 'point ini ngapain di bimbingkan, gak penting', NULL),
(29, 125, '1194014_bimbingan_2917_1', 'bimbingan', 1, '2020-04-17 12:03:42', '2020-05-21 17:42:06', 'landasan teori yang ditulis itu yang dibahas pada pendahuluan, dekspsi masalah , apa teori dan jelaskan dengan rinci bukan hanya pengertiannya saja, tp penjelasan untuk medukung masalah dan tujuan masalah.', NULL),
(52, 126, '1194048_bimbingan_5214_1', 'bimbingan', 1, '2020-04-17 15:04:19', '2020-05-21 17:42:06', 'perbaiki point indentifikasi masalah pada,\nPoint satu, harus menggunakan kalimat aktif SPOK jelas, sudah berapa kali saya sampaikan, saya contohkan \n\nkemudian pada point tujuan itu menjawab dari poitn diatas itu.  harus gunakan kalimat aktif\n\n\nkemudian BAB 2 kamu itu kurang lengkap, bukan hanya pengertian aja, bab 2 itu adalah LANDASAN TEORI anda untuk menyelesaikan masalah dan tujuan yang anda paparkan pada bab 1 dan pendahuluan. jelaskan dengan menggunakan literatur yang jelas 5 tahun terakhir referensi jurnal, atau buku dan lain sebagainya kecuali blogspot dan wikipia\nTidak tersedianya fasilitas yang difungsukan untuk membedakan halaman informasi branda admin dan user', NULL),
(50, 127, '1194013_bimbingan_5017_1', 'bimbingan', 1, '2020-04-17 15:07:19', '2020-05-21 17:42:06', '1. Setiap paragraf berikan informasi darimana sumbernya. \nmisal bagian :\ne. Desain Website\nDesain website dapat menentukan kualitas sebuah website dan sangat berpengaruh terhadap penilaian pengunjung. Desain website digunakan untuk memperindah suatu situs. (1) <--sesuai dengan sumber yang tertuang dihalaman akhir.\n\n\n2. Untuk materi tambahkan terkait dengan bahasa pemrograman yang digunakan, database yang di gunakan, atau teknologi lain yang digunakan hasil dari analisis terhadap sistem tersebut  ', NULL),
(25, 128, '1194003_bimbingan_2523_1', 'bimbingan', 1, '2020-04-17 20:49:28', '2020-05-21 17:42:06', '1. sub bab 3.1 gambar nimpa tulisan, tolong dibenerin\n2. gambar 3.3 harusnya yang input username/password itu petugas, tulisan database pada simbol database ganti dengan nama databesnya\n3. tampilkan nomor halaman\n', NULL),
(34, 129, '1194006_bimbingan_3418_1', 'bimbingan', 1, '2020-04-20 05:26:43', '2020-05-21 17:42:06', 'Beberapa revisi ', NULL),
(34, 130, '1194006_bimbingan_3419_1', 'bimbingan', 1, '2020-04-20 05:38:02', '2020-05-21 17:42:06', 'Beberapa revisi', NULL),
(35, 131, '1194057_bimbingan_3518_1', 'bimbingan', -1, '2020-04-20 06:42:27', '2020-05-21 17:42:06', 'Pembahasan di Bab 1 kurang lengkap', NULL),
(22, 132, '1194025_bimbingan_2214_1', 'bimbingan', 1, '2020-04-20 09:34:25', '2020-05-21 17:42:06', 'permsalahan fokus kepada proses CRUD dan sistem transaksional', NULL),
(22, 133, '1194025_bimbingan_2215_1', 'bimbingan', 1, '2020-04-20 09:34:54', '2020-05-21 17:42:06', 'tujuan lebih detai ke pembagian masing-masing mahasiswa mengenai CRUD dan Transaksional ', NULL),
(22, 134, '1194025_bimbingan_2216_1', 'bimbingan', 1, '2020-04-20 09:35:17', '2020-05-21 17:42:06', 'mulai dokumentasi dan break down coding sesuai dengan pembagian yg ada di file ini', NULL),
(22, 135, '1194025_bimbingan_2220_1', 'bimbingan', 1, '2020-04-20 09:36:04', '2020-05-21 17:42:06', 'lanjutkan ke bongkar coding, fokus ke menu yg dikuasi di laporan ini, harus terdiri dari proses 4 CRUD minimal dan 2 proses transaksional minimal', NULL),
(26, 136, '1194069_bimbingan_2616_1', 'bimbingan', -1, '2020-04-20 09:55:23', '2020-05-21 17:42:06', 'perbaikin tujuan, harus ada 4 fungsi CRUD dan 2 proses transaksional . tambahkan ditujuan.', NULL),
(42, 137, '1194059_bimbingan_4214_1', 'bimbingan', 1, '2020-04-23 10:20:16', '2020-05-21 17:42:06', 'silahkan dilanjutkan tema bahasan selanjutnya', NULL),
(43, 138, '1194004_bimbingan_4313_1', 'bimbingan', 1, '2020-04-24 15:47:57', '2020-05-21 17:42:06', 'Bagus. Segera buat buku tutorialnya. Terutama Cara ambil variable Dan kirim pesannke veronika', NULL),
(30, 139, '1194031_bimbingan_3017_1', 'bimbingan', 1, '2020-04-25 08:18:36', '2020-05-21 17:42:06', 'tidak mau saya baca format laporan kamu tidak sesuai dengan pedoman proteyek 1 https://if.poltekpos.ac.id/p/panduan-proyek-1-2020.html\n\ndibacaaa !!!, margin, kanan kiri, ukuran kertas, kerapian dan lain sebagainya !!!!!!!!!!!!!!!!!!!!!!!!!!', NULL),
(41, 140, '1194054_bimbingan_4114_1', 'bimbingan', -1, '2020-04-29 21:58:26', '2020-05-21 17:42:06', 'untuk point 2. Pencatatan peminjaman yg sekarang berjalan seperti apa?', NULL),
(41, 141, '1194054_bimbingan_4115_1', 'bimbingan', -1, '2020-04-29 21:59:35', '2020-05-21 17:42:06', 'Tujuan disini adalah menjawab dari identifkasi  masalah, apabila identifikasi masalah ada 2 (dua) point maka tujuan nya pun ada 2(dua) point. contoh :\nIdentifikasi Masalah :\n1. Tidak efisiennya sistem peminjaman buku yang saat ini sedang berlangsung \n2. Kurang efektifnya pencatatan peminjaman dari segi waktu\nTUjuan :\n1. Membuat sistem peminjaman buku yang seperti apa agar lebih efisien\n2. membuat sistem peminjaman buku yang online agar lebih efektif.............dst dst \n', NULL),
(27, 142, '1194055_bimbingan_2715_1', 'bimbingan', 1, '2020-05-01 01:23:28', '2020-05-21 17:42:06', 'silahkan lanjutkan ke proses selanjutnya', NULL),
(54, 143, '1164059_bimbingan_5414_1', 'bimbingan', 1, '2020-05-01 12:18:44', '2020-05-21 17:42:06', 'Silahkan lanjutkan pada bab/bahasan berikutnya', NULL),
(50, 144, '1194013_bimbingan_5018_1', 'bimbingan', 1, '2020-05-01 14:17:04', '2020-05-21 17:42:06', '3.1 Analisis Sistem\n\nAnalisis sistem merupakan tahapan atau penguraian suatu sistem informasi terhadap sistem yang berjalan untuk mengetahui segala permasalahan yang terjadi serta dengan mudah untuk merancang ke tahapan selanjutnya yaitu perancangan sistem. Analisis sistem juga bertujuan untuk mengidentifikasi permasalahan kebutuhan yang diharapkan untuk di usulkan perbaikannya juga pengembangannya. <--ini teori pindah ke bab II\n\nPada Bab ini akan dibahas mengenai, analisis kebutuhan fungsional dan analisis kebutuhan non-fungsional.   (cukup ini saja di tambah dengan analisis terhadap sistem secara modul per modul atau menu per menu fungsinya buat apa utk setiap modul dalam aplikasi mulai dari login, proses, output/report, sampai dengan logoout) sertakan dalam tampilan User Interface atau screenshoot dari aplikasi untuk mempermudah dalam menjelaskan setiap tampilan ada menu apa saja dan di jelaskan.\n(catatan nya: utk teori pindah ke bab II, jadi di sub bab ini hanya pembahasan analisis apa saja yg akan di kerjakan)', NULL),
(50, 145, '1194013_bimbingan_5019_1', 'bimbingan', 1, '2020-05-01 14:18:07', '2020-05-21 17:42:06', '- Kebutuhan non-fungsional merupakan spesifikasi kebutuhan yang dibutuhkan oleh sistem yang berkaitan dengan perangkat keras (hardware) dan perangkat lunak (software).  <-- Kata-kata yang dibutuhkan di ganti dengan \"yang digunakan\"\n\n- Kebutuhan perangkat lunak (Software) di ganti jadi perangkat lunak yang digunakan  ', NULL),
(32, 146, '1194010_bimbingan_3213_1', 'bimbingan', 1, '2020-05-01 22:04:22', '2020-05-21 17:42:06', 'jangna banyak copas temen lain. fokus apa saja yang sudah kalian kerjakan termasuk laporan error dan bagaimana penanganannya terhadap triva', NULL),
(27, 147, '1194055_bimbingan_2717_1', 'bimbingan', -1, '2020-05-02 00:38:11', '2020-05-21 17:42:06', 'perbaiki pada penulisan sumber referensi, biasanya kalimat dulu kemudian sumbernya : \nsilahkan baca ini :\nhttps://isbands.wordpress.com/2011/10/07/standard-penulisan-kutipan-dan-daftar-pustaka/', NULL),
(27, 147, '1194055_bimbingan_2717_2', 'bimbingan', -1, '2020-05-02 00:38:11', '2020-05-21 17:42:06', 'perbaiki pada penulisan sumber referensi, biasanya kalimat dulu kemudian sumbernya : \nsilahkan baca ini :\nhttps://isbands.wordpress.com/2011/10/07/standard-penulisan-kutipan-dan-daftar-pustaka/', NULL),
(27, 147, '27_bimbingan_17_3', 'bimbingan', 1, '2020-05-02 00:38:11', '2020-06-09 06:56:53', 'silahkan lanjutkan ke bab berikutnya', NULL),
(55, 148, '1194056_bimbingan_5515_1', 'bimbingan', 1, '2020-05-03 07:42:30', '2020-05-21 17:42:06', NULL, NULL),
(31, 149, '1194029_bimbingan_3117_1', 'bimbingan', 1, '2020-05-06 05:51:00', '2020-05-21 17:42:06', 'lanjutkan', NULL),
(50, 150, '1194013_bimbingan_5020_1', 'bimbingan', 1, '2020-05-06 11:14:35', '2020-05-21 17:42:06', 'Setiap menu data master di berikan penjelasan fungsi nya', NULL),
(22, 151, '1194025_bimbingan_2217_1', 'bimbingan', 1, '2020-05-07 10:21:15', '2020-05-21 17:42:06', 'reference nya Dari mana?sitasi', NULL),
(42, 152, '1194059_bimbingan_4217_1', 'bimbingan', -1, '2020-05-08 02:47:50', '2020-05-21 17:42:06', 'silahkan lanjutkan bab/sub bahasan berikutnya', NULL),
(42, 152, '1194059_bimbingan_4217_2', 'bimbingan', 1, '2020-05-08 02:47:50', '2020-05-21 17:42:06', 'silahkan lanjutkan bab/sub bahasan berikutnya', NULL),
(51, 153, '1194036_bimbingan_5114_1', 'bimbingan', 1, '2020-05-10 03:05:04', '2020-05-21 17:42:06', 'sub bab 1.3 Tujuan ,\nTUjuan membalas atau menjawab dari Identifikasi masalah, apabila identifikasi masalah ada 4 poin berarti tujuan nya ada 4 poin jg, setiap poin di identifikasi masalah di jawab di tujuan', NULL),
(39, 154, '1194040_bimbingan_3915_1', 'bimbingan', 1, '2020-05-10 17:33:18', '2020-05-21 17:42:06', 'coba ditambahkan lagi, uraian tujuannya. Kalo bisa bimbingnnya per-bab utuh saja. jangan per sub-bab. Kalo ini berarti harus cantumkan bareng dengan bab Pendahuluan. jangan sepotong2', NULL),
(39, 155, '1194040_bimbingan_3916_1', 'bimbingan', 1, '2020-05-10 17:35:32', '2020-05-21 17:42:06', 'Sebaiknya kalo bimbingan, cantumkan juga dokumen utuh dari dokumen sebelumnya yang sudah dilakukan bimbingan. jangan sepotong2. saya jg harus tau apa yang sdh dikerjakan sebelumnya', NULL),
(22, 156, '1194025_bimbingan_2219_1', 'bimbingan', 1, '2020-05-12 02:52:29', '2020-06-12 03:55:39', 'Kebutuhan Perangkat Lunak kolom keterangan, diisi versi nya, kontor php versi berapa, xampp verisinya dipindah ,pdf dll', NULL),
(53, 157, '1194024_bimbingan_5313_1', 'bimbingan', 1, '2020-05-12 04:42:17', '2020-05-21 17:42:06', NULL, NULL),
(46, 158, '1194050_bimbingan_4614_1', 'bimbingan', 1, '2020-05-13 06:18:43', '2020-05-21 17:42:06', NULL, NULL),
(54, 159, '1164059_bimbingan_5417_1', 'bimbingan', 1, '2020-05-14 09:07:18', '2020-05-21 17:42:06', 'silahkan lanjutkan bab/bahasan berikutnya', NULL),
(40, 160, '40bimbingan_14_1', 'bimbingan', 1, '2020-05-16 04:47:56', '2020-05-21 17:42:06', 'Sip', NULL),
(48, 161, '48bimbingan_18_1', 'bimbingan', 1, '2020-05-16 06:58:08', '2020-06-10 04:44:38', 'ada erd nya? cara kerjanya bagaimana per proses', NULL),
(26, 162, '26_bimbingan_13_1', 'bimbingan', 1, '2020-05-18 12:59:14', '2020-06-12 00:41:25', 'Lanjutkan ke proses pemilihan CRUD nya, dan proses (menu) yg memiliki tabel transaksional. Analisa dan jelaskan. Buat Menu tree dari applikasi tersebut( sebutkan menu-menu yang ada di aplikasi dan jelaskan satu-satu.', NULL),
(40, 163, '40_bimbingan_16_1', 'bimbingan', 1, '2020-05-19 06:12:09', '2020-05-21 17:42:06', 'Sip', NULL),
(40, 164, '40_bimbingan_17_1', 'bimbingan', 1, '2020-05-19 06:12:20', '2020-05-21 17:42:06', 'Sip', NULL),
(40, 165, '40_bimbingan_18_1', 'bimbingan', 1, '2020-05-19 06:12:33', '2020-05-21 17:42:06', 'qwfq', NULL),
(40, 166, '40_bimbingan_19_1', 'bimbingan', 1, '2020-05-19 06:12:44', '2020-05-21 17:42:06', 'SIp', NULL),
(40, 167, '40_bimbingan_20_1', 'bimbingan', 1, '2020-05-19 06:12:56', '2020-05-21 17:42:06', 'Sip siap draftnya', NULL),
(40, 168, '40_bimbingan_21_1', 'bimbingan', 1, '2020-05-19 19:44:30', '2020-05-21 17:42:06', NULL, NULL),
(46, 169, '46_bimbingan_17_1', 'bimbingan', 1, '2020-05-20 14:11:36', '2020-05-21 17:42:06', NULL, NULL),
(86, 171, '86_bimbingan_14_1', 'bimbingan', -1, '2020-05-20 22:12:43', '2020-05-21 17:42:06', 'ok', NULL),
(86, 171, '86_bimbingan_14_2', 'bimbingan', 1, '2020-05-20 22:12:43', '2020-05-21 17:42:06', 'ok', NULL),
(86, 172, '86_bimbingan_15_1', 'bimbingan', -1, '2020-05-20 22:19:23', '2020-05-21 22:43:37', 'qwfqwfwq', NULL),
(86, 173, '86_bimbingan_16_1', 'bimbingan', 1, '2020-05-20 22:26:19', '2020-05-21 17:42:06', 'wetw', NULL),
(86, 174, '86_bimbingan_17_1', 'bimbingan', 1, '2020-05-20 22:27:01', '2020-05-21 17:42:06', 'qwfwqfq', NULL),
(86, 175, '86_bimbingan_18_1', 'bimbingan', -1, '2020-05-20 22:27:36', '2020-05-21 22:35:40', 'qwfqwf', NULL),
(86, 176, '86_bimbingan_19_1', 'bimbingan', -1, '2020-05-20 22:27:47', '2020-05-22 00:36:49', 'Euy', NULL),
(86, 177, '86_bimbingan_20_1', 'bimbingan', 1, '2020-05-20 22:28:16', '2020-05-26 15:43:09', 'fghij', NULL),
(86, 172, '86_bimbingan_15_506252163375', 'bimbingan', -1, '2020-05-21 21:26:35', '2020-05-21 22:45:56', 'Gak jadi deng', NULL),
(86, 172, '86_bimbingan_15_35627766720000', 'bimbingan', -1, '2020-05-21 22:46:11', '2020-05-22 00:36:33', 'Masih belum', NULL),
(86, 175, '86_bimbingan_18_4500067987800', 'bimbingan', 1, '2020-05-22 00:37:17', '2020-05-26 15:42:42', 'cdefg', NULL),
(86, 172, '86_bimbingan_15_102767969505600', 'bimbingan', 1, '2020-05-22 02:41:41', '2020-05-26 15:42:24', 'abcd', NULL),
(86, 176, '86_bimbingan_19_77395350614400', 'bimbingan', 1, '2020-05-22 02:41:49', '2020-05-26 15:42:57', 'efghi', NULL),
(86, 179, '86_bimbingan_21_18209891700000', 'bimbingan', 1, '2020-05-22 03:25:00', '2020-05-26 15:43:21', 'ijklm', NULL),
(87, NULL, '87_proposal_4_53996960640000', 'proposal', -1, '2020-05-22 03:54:34', '2020-05-22 03:57:45', 'Coba upload lagi', NULL),
(87, NULL, '87_proposal_4_3173260272000', 'proposal', -1, '2020-05-22 04:00:55', '2020-05-22 04:15:07', 'vfuyfyuuyyvy', NULL),
(87, NULL, '87_proposal_4_6280951950000', 'proposal', 1, '2020-05-22 04:20:41', '2020-05-22 04:21:05', 'ok', NULL),
(87, 180, '87_bimbingan_13_19170568981200', 'bimbingan', 1, '2020-05-22 04:28:16', '2020-05-22 04:43:05', 'done', NULL),
(87, 181, '87_bimbingan_14_28395745560000', 'bimbingan', 1, '2020-05-22 04:44:32', '2020-05-22 04:45:09', 'wdwaa', NULL),
(87, 182, '87_bimbingan_15_42244351968000', 'bimbingan', 1, '2020-05-22 04:46:17', '2020-05-22 04:48:00', 'dwadaw', NULL),
(87, 183, '87_bimbingan_16_19214454495600', 'bimbingan', 1, '2020-05-22 04:48:24', '2020-05-22 04:48:55', 'awdadaw', NULL),
(87, 184, '87_bimbingan_17_14960935407600', 'bimbingan', 1, '2020-05-22 04:49:58', '2020-05-22 04:50:36', 'asdadw', NULL),
(87, 185, '87_bimbingan_18_61220292588000', 'bimbingan', 1, '2020-05-22 04:52:16', '2020-05-22 04:52:42', 'asdadwda', NULL),
(87, 186, '87_bimbingan_19_24156249062400', 'bimbingan', 1, '2020-05-22 04:54:02', '2020-05-22 04:56:05', 'dfasda', NULL),
(87, 187, '87_bimbingan_20_114503214735000', 'bimbingan', 1, '2020-05-22 04:57:35', '2020-05-22 05:00:32', 'awdada', NULL),
(87, 188, '87_bimbingan_21_2089635634800', 'bimbingan', 1, '2020-05-22 05:02:06', '2020-05-22 05:02:19', 'wdadaw', NULL),
(87, 189, '87_bimbingan_22_15658109838000', 'bimbingan', 1, '2020-05-22 05:04:29', '2020-05-22 05:05:14', 'awdawda', NULL),
(87, NULL, '87_draft_8979851160000', 'draft', -1, '2020-05-22 05:10:39', '2020-05-22 05:16:33', 'nub', NULL),
(87, NULL, '87_draft_73801634854500', 'draft', -1, '2020-05-22 05:17:55', '2020-05-22 05:18:36', 'nub', NULL),
(87, NULL, '87_draft_23663121300000', 'draft', 1, '2020-05-22 05:20:25', '2020-05-22 05:21:48', 'good', NULL),
(86, 190, '86_bimbingan_13_96455584676000', 'bimbingan', 1, '2020-05-22 22:43:42', '2020-05-26 15:43:33', 'klmno', NULL),
(50, 191, '50_bimbingan_21_60944335200000', 'bimbingan', 1, '2020-05-25 08:54:11', '2020-06-09 01:37:46', 'Ok., lanjutkan,.', NULL),
(87, NULL, '87_sidang_26890069915800', 'sidang', 0, '2020-05-26 07:59:25', '2020-05-26 07:59:25', NULL, '123456789'),
(87, NULL, '87_sidang_16237964925000', 'sidang', 0, '2020-05-26 08:03:33', '2020-05-26 08:03:33', NULL, '424038805'),
(88, NULL, '88_proposal_4_35775684502800', 'proposal', 1, '2020-05-26 09:13:18', '2020-05-26 09:15:54', 'Mantap', NULL),
(88, 192, '88_bimbingan_13_64802545080000', 'bimbingan', 1, '2020-05-26 09:16:34', '2020-05-26 09:19:37', 'WQF', NULL),
(88, 193, '88_bimbingan_14_21149841636000', 'bimbingan', 1, '2020-05-26 09:17:19', '2020-05-26 09:19:46', 'OIAHFOIWQ', NULL),
(88, 194, '88_bimbingan_15_16244634858300', 'bimbingan', 1, '2020-05-26 09:17:44', '2020-05-26 09:20:07', 'wfhbqwfowq', NULL),
(88, 195, '88_bimbingan_16_73548345394800', 'bimbingan', 1, '2020-05-26 09:17:53', '2020-05-26 09:20:12', 'qwfwqfwq', NULL),
(88, 196, '88_bimbingan_17_13515959402400', 'bimbingan', 1, '2020-05-26 09:18:04', '2020-05-26 09:20:17', 'wqfwqfwq', NULL),
(88, 197, '88_bimbingan_18_33008944757600', 'bimbingan', 1, '2020-05-26 09:18:13', '2020-05-26 09:20:22', 'fqwfwqf', NULL),
(88, 198, '88_bimbingan_19_12837075596800', 'bimbingan', 1, '2020-05-26 09:18:23', '2020-05-26 09:20:26', 'wqfwqfqw', NULL),
(88, 199, '88_bimbingan_20_50097352158000', 'bimbingan', 1, '2020-05-26 09:18:31', '2020-05-26 09:20:32', 'wqfqwfwqf', NULL),
(88, 200, '88_bimbingan_21_34361964929600', 'bimbingan', 1, '2020-05-26 09:18:41', '2020-05-26 09:20:53', 'wqfwqf', NULL),
(88, 201, '88_bimbingan_22_28558220507600', 'draft', 1, '2020-05-26 09:18:48', '2020-05-26 09:22:31', 'Sip ok', NULL),
(88, 202, '88_bimbingan_23_132944913637200', 'draft', 1, '2020-05-26 09:19:01', '2020-05-26 09:22:31', 'Sip ok', NULL),
(88, NULL, '88_draft_80804551884900', 'draft', 1, '2020-05-26 09:21:38', '2020-05-26 09:22:31', 'Sip ok', NULL),
(89, NULL, '89_proposal_4_59160807020700', 'proposal', -1, '2020-05-26 11:21:54', '2020-05-26 11:41:13', 'Aw', NULL),
(89, NULL, '89_proposal_4_238166204390400', 'proposal', -1, '2020-05-26 11:43:02', '2020-05-26 11:43:18', 'Duh', NULL),
(89, NULL, '89_proposal_4_14932555880000', 'proposal', -1, '2020-05-26 12:00:49', '2020-05-26 12:23:51', 'aa', NULL),
(89, NULL, '89_proposal_4_26770000177600', 'proposal', 1, '2020-05-26 12:24:28', '2020-05-27 09:28:06', 'Ok', NULL),
(43, 204, '43_bimbingan_14_39725129087500', 'bimbingan', 0, '2020-05-27 07:27:48', '2020-05-27 07:27:48', NULL, NULL),
(89, 205, '89_bimbingan_13_150619438112000', 'bimbingan', 1, '2020-05-27 09:29:03', '2020-06-05 04:48:09', 'khjk', NULL),
(89, 206, '89_bimbingan_14_6344374636800', 'bimbingan', 1, '2020-05-27 10:02:25', '2020-06-05 04:48:17', 'iyiyui', NULL),
(89, 207, '89_bimbingan_15_9819671347200', 'bimbingan', 1, '2020-05-27 10:03:12', '2020-06-05 04:48:28', 'kgkg', NULL),
(89, 208, '89_bimbingan_16_17751659660800', 'bimbingan', 1, '2020-05-27 10:03:43', '2020-06-05 04:48:36', 'hhcg', NULL),
(35, 36, '35_bimbingan_13_11414800574100', 'bimbingan', 0, '2020-05-31 07:01:43', '2020-05-31 07:01:43', NULL, NULL),
(22, 209, '22_bimbingan_23_31137855408000', 'bimbingan', 1, '2020-06-02 00:19:47', '2020-06-12 04:05:46', 'untuk screenshootnya, line nya juga haras ada jpg dipotong. dan sisipkan gambar UI nya, jelaskan setiap field, button dll.', NULL),
(86, 210, '86_bimbingan_22_31295076960000', 'bimbingan', -1, '2020-06-08 01:58:35', '2020-06-08 01:59:23', 'afasfsa', NULL),
(86, 210, '86_bimbingan_22_6205399200000', 'bimbingan', 1, '2020-06-08 02:00:18', '2020-06-08 02:00:38', 'AV', NULL),
(22, 211, '22_bimbingan_22_25310699904000', 'bimbingan', 1, '2020-06-08 06:18:40', '2020-06-12 04:02:53', 'CDM (Conseptual Data ModeI), dibawah gambar ini dijelaskan mengunakan Marashi(kalimat dalam paragraf) mengenai konsep perancangan nya, keterkaitan antar table nya, kardinalitasnya (one to many, dll)', NULL),
(26, 212, '26_bimbingan_14_3801814380000', 'bimbingan', 1, '2020-06-08 15:20:54', '2020-06-12 00:43:14', 'Lanjutkan ke proses analisa sírio/codingnya per baris. buat flowcharnya dan buat ord nya.', NULL),
(25, 32, '25_bimbingan_14_17512657344000', 'bimbingan', -1, '2020-06-09 10:32:09', '2020-06-12 12:48:10', 'Lanjutkan ', NULL),
(25, 213, '25_bimbingan_16_12839170500000', 'bimbingan', -1, '2020-06-10 04:43:08', '2020-06-12 12:44:50', 'Lanjutkan ke analisis skrip pemrogramannya', NULL),
(39, 214, '39_bimbingan_17_65712936960000', 'bimbingan', -1, '2020-06-10 09:54:21', '2020-06-12 12:41:40', 'Lanjutkan ke analisis', NULL),
(49, 215, '49_bimbingan_14_57421972638000', 'bimbingan', 0, '2020-06-11 01:48:04', '2020-06-11 01:48:04', NULL, NULL),
(49, 216, '49_bimbingan_16_102716576760000', 'bimbingan', 0, '2020-06-11 01:50:53', '2020-06-11 01:50:53', NULL, NULL),
(49, 217, '49_bimbingan_15_40894613743500', 'bimbingan', 0, '2020-06-11 01:53:38', '2020-06-11 01:53:38', NULL, NULL),
(42, 218, '42_bimbingan_18_323184960000', 'bimbingan', 0, '2020-06-12 01:51:59', '2020-06-12 01:51:59', NULL, NULL),
(37, 48, '37_bimbingan_14_32635674624000', 'bimbingan', 1, '2020-06-12 06:06:53', '2020-06-15 03:30:57', '75', NULL),
(37, 49, '37_bimbingan_15_15503510400000', 'bimbingan', 1, '2020-06-12 06:07:22', '2020-06-15 03:31:12', '75', NULL),
(37, 50, '37_bimbingan_16_46868376576000', 'bimbingan', 1, '2020-06-12 06:07:50', '2020-06-15 03:31:36', '75', NULL),
(37, 51, '37_bimbingan_17_39886644672000', 'bimbingan', 1, '2020-06-12 06:41:53', '2020-06-15 03:31:46', '75', NULL),
(27, 219, '27_bimbingan_18_37294387200000', 'bimbingan', 0, '2020-06-12 08:54:12', '2020-06-12 08:54:12', NULL, NULL),
(25, 220, '25_bimbingan_18_90664681536000', 'bimbingan', -1, '2020-06-12 11:42:55', '2020-06-12 12:46:45', 'Lanjutkan ke analisis skrip pemrogramannya', NULL),
(22, 223, '22_bimbingan_21_24973565760000', 'bimbingan', 0, '2020-06-12 14:19:52', '2020-06-12 14:19:52', NULL, NULL),
(26, 224, '26_bimbingan_26_5670673920000', 'bimbingan', 0, '2020-06-12 14:47:57', '2020-06-12 14:47:57', NULL, NULL),
(28, 225, '28_bimbingan_14_131206068000000', 'bimbingan', 0, '2020-06-14 13:35:56', '2020-06-14 13:35:56', NULL, NULL),
(28, 226, '28_bimbingan_15_95472174420000', 'bimbingan', 0, '2020-06-14 13:37:32', '2020-06-14 13:37:32', NULL, NULL),
(28, 227, '28_bimbingan_16_28688520000000', 'bimbingan', 0, '2020-06-14 13:40:10', '2020-06-14 13:40:10', NULL, NULL),
(34, 228, '34_bimbingan_20_2508723252000', 'bimbingan', 0, '2020-06-16 01:36:08', '2020-06-16 01:36:08', NULL, NULL),
(25, 213, '25_bimbingan_16_3038227920000', 'bimbingan', -1, '2020-06-19 08:19:22', '2020-06-22 06:16:50', 'lanjutkan', NULL),
(25, 220, '25_bimbingan_18_55908819135000', 'bimbingan', -1, '2020-06-19 08:19:35', '2020-06-22 06:16:59', 'lanjutkan', NULL),
(25, 229, '25_bimbingan_19_31539123720000', 'bimbingan', 1, '2020-06-21 04:10:53', '2020-06-22 06:15:57', '1. berikan kutipan pada teori2 yang digunakan sesuai di daftar putaka\n2. Beri penjelsan setiap gambar coding\n3. analisis pengguna jadikan tabel saja biar gampang dilihat/dipahami\n4. lihat koreksi yang ada digrup WA', NULL),
(25, 230, '25_bimbingan_20_12692777130000', 'bimbingan', -1, '2020-06-21 07:50:06', '2020-06-22 06:18:59', '1. pastikan daftar pustaka digunakan sebagai sitasi pada teori2 yang digunakan\n2. berikan penjelsan setiap gambar script/coding\n3. perbaiki sesuai saran yang ada di grup WA\n4. analisis user buat berupa tabel biar mudah dibaca/dipahami', NULL),
(25, 230, '25_bimbingan_20_25312625100000', 'bimbingan', 0, '2020-06-23 02:15:41', '2020-06-23 02:15:41', NULL, NULL),
(25, 220, '25_bimbingan_18_14108936400000', 'bimbingan', 0, '2020-06-23 02:15:49', '2020-06-23 02:15:49', NULL, NULL),
(25, 213, '25_bimbingan_16_14756310000000', 'bimbingan', 0, '2020-06-23 02:16:00', '2020-06-23 02:16:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(40) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL,
  `jabatan` char(1) NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `pass`, `jabatan`, `profile`) VALUES
('1164059', 'DUMMY', 'M', '1164059.png'),
('1174020', 'DUMMY', 'M', 'default'),
('1174021', 'DUMMY', 'M', 'default'),
('1174022', 'DUMMY', 'M', 'default'),
('1174023', 'DUMMY', 'M', 'default'),
('1174024', 'DUMMY', 'M', 'default'),
('1174025', 'DUMMY', 'M', 'default'),
('1174026', 'DUMMY', 'M', 'default'),
('1174027', 'DUMMY', 'M', 'default'),
('1174035', 'DUMMY', 'M', 'default'),
('1174040', 'DUMMY', 'M', 'default'),
('1174045', 'DUMMY', 'M', '1174045.png'),
('1174050', 'DUMMY', 'M', 'default'),
('1194001', 'DUMMY', 'M', 'default'),
('1194002', 'DUMMY', 'M', 'default'),
('1194003', 'DUMMY', 'M', 'default'),
('1194004', 'DUMMY', 'M', 'default'),
('1194005', 'DUMMY', 'M', '1194005.png'),
('1194006', 'DUMMY', 'M', 'default'),
('1194007', 'DUMMY', 'M', 'default'),
('1194008', 'DUMMY', 'M', 'default'),
('1194010', 'DUMMY', 'M', 'default'),
('1194011', 'DUMMY', 'M', '1194011.png'),
('1194012', 'DUMMY', 'M', '1194012.png'),
('1194013', 'DUMMY', 'M', 'default'),
('1194014', 'DUMMY', 'M', 'default'),
('1194015', 'DUMMY', 'M', 'default'),
('1194016', 'DUMMY', 'M', '1194016.png'),
('1194017', 'DUMMY', 'M', 'default'),
('1194018', 'DUMMY', 'M', '1194018.png'),
('1194019', 'DUMMY', 'M', 'default'),
('1194020', 'DUMMY', 'M', 'default'),
('1194021', 'DUMMY', 'M', '1194021.png'),
('1194023', 'DUMMY', 'M', 'default'),
('1194024', 'DUMMY', 'M', 'default'),
('1194025', 'DUMMY', 'M', 'default'),
('1194026', 'DUMMY', 'M', 'default'),
('1194027', 'DUMMY', 'M', 'default'),
('1194028', 'DUMMY', 'M', 'default'),
('1194029', 'DUMMY', 'M', 'default'),
('1194030', 'DUMMY', 'M', '1194030.png'),
('1194031', 'DUMMY', 'M', '1194031.png'),
('1194034', 'DUMMY', 'M', 'default'),
('1194036', 'DUMMY', 'M', '1194036.png'),
('1194038', 'DUMMY', 'M', 'default'),
('1194039', 'DUMMY', 'M', '1194039.png'),
('1194040', 'DUMMY', 'M', 'default'),
('1194041', 'DUMMY', 'M', '1194041.png'),
('1194042', 'DUMMY', 'M', 'default'),
('1194044', 'DUMMY', 'M', 'default'),
('1194045', 'DUMMY', 'M', 'default'),
('1194046', 'DUMMY', 'M', 'default'),
('1194047', 'DUMMY', 'M', 'default'),
('1194048', 'DUMMY', 'M', 'default'),
('1194049', 'DUMMY', 'M', 'default'),
('1194050', 'DUMMY', 'M', '1194050.png'),
('1194052', 'DUMMY', 'M', '1194052.png'),
('1194053', 'DUMMY', 'M', 'default'),
('1194054', 'DUMMY', 'M', '1194054.png'),
('1194055', 'DUMMY', 'M', 'default'),
('1194056', 'DUMMY', 'M', 'default'),
('1194057', 'DUMMY', 'M', 'default'),
('1194058', 'DUMMY', 'M', 'default'),
('1194059', 'DUMMY', 'M', '1194059.png'),
('1194060', 'DUMMY', 'M', 'default'),
('1194061', 'DUMMY', 'M', '1194061.png'),
('1194062', 'DUMMY', 'M', 'default'),
('1194063', 'DUMMY', 'M', '1194063.png'),
('1194064', 'DUMMY', 'M', 'default'),
('1194065', 'DUMMY', 'M', 'default'),
('1194066', 'DUMMY', 'M', 'default'),
('1194068', 'DUMMY', 'M', 'default'),
('1194069', 'DUMMY', 'M', 'default'),
('1194070', 'DUMMY', 'M', '1194070.png'),
('1234567', 'DUMMY', 'M', '1234567.png'),
('3217061702990009', 'DUMMY', 'A', 'default'),
('3217061702990010', 'DUMMY', 'A', 'default'),
('7654321', 'DUMMY', 'M', 'default'),
('awangga@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('cahyoprianto@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('harrysaputra@poltekpos.ac.id', 'DUMMY', 'D', 'harrysaputra@poltekpos_ac_id.png'),
('luthfimnabil17@gmail.com', 'DUMMY', 'D', 'luthfimnabil17@gmail_com.png'),
('m.nurkamal.f@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('nisahanum@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('novianariza@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('nuraini@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('roni.habibi@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('roniandarsyah@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('syafrial.fachri@poltekpos.ac.id', 'DUMMY', 'D', 'syafrial_fachri@poltekpos_ac_id.png'),
('woroisti@poltekpos.ac.id', 'DUMMY', 'D', 'default'),
('yusrilhelmi@poltekpos.ac.id', 'DUMMY', 'D', 'yusrilhelmi@poltekpos_ac_id.png');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_bimbingan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_bimbingan` (
`id_bimbingan` int(24)
,`id_proyek` int(16)
,`nilai_bimbingan` int(100)
,`total_revisi` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_total_revisi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_total_revisi` (
`id_bimbingan` int(11)
,`total_revisi` decimal(22,0)
,`status_bimbingan` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_bimbingan`
--
DROP TABLE IF EXISTS `v_bimbingan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bimbingan`  AS  select `bimbingan`.`id_bimbingan` AS `id_bimbingan`,`bimbingan`.`id_proyek` AS `id_proyek`,`bimbingan`.`nilai_bimbingan` AS `nilai_bimbingan`,(select `v_total_revisi`.`total_revisi` from `v_total_revisi` where `v_total_revisi`.`status_bimbingan` = 1 and `v_total_revisi`.`id_bimbingan` = `bimbingan`.`id_bimbingan`) AS `total_revisi` from `bimbingan` where (select `v_total_revisi`.`total_revisi` from `v_total_revisi` where `v_total_revisi`.`status_bimbingan` = 1 and `v_total_revisi`.`id_bimbingan` = `bimbingan`.`id_bimbingan`) is not null ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_total_revisi`
--
DROP TABLE IF EXISTS `v_total_revisi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_revisi`  AS  select `sub_laporan`.`id_bimbingan` AS `id_bimbingan`,sum(if(`sub_laporan`.`status` = -1,1,0)) AS `total_revisi`,sum(if(`sub_laporan`.`status` = 1,1,0)) AS `status_bimbingan` from `sub_laporan` where `sub_laporan`.`type` = 'bimbingan' group by `sub_laporan`.`id_bimbingan` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `auth_key`
--
ALTER TABLE `auth_key`
  ADD PRIMARY KEY (`token`);

--
-- Indeks untuk tabel `bimbingan`
--
ALTER TABLE `bimbingan`
  ADD PRIMARY KEY (`id_bimbingan`),
  ADD KEY `key_progress_tema` (`id_kegiatan_progress`),
  ADD KEY `key_proyek` (`id_proyek`);

--
-- Indeks untuk tabel `bimbingan_progress`
--
ALTER TABLE `bimbingan_progress`
  ADD PRIMARY KEY (`id_bimbingan_progress`),
  ADD KEY `key_progress` (`id_bimbingan`);

--
-- Indeks untuk tabel `dokumen_kegiatan`
--
ALTER TABLE `dokumen_kegiatan`
  ADD PRIMARY KEY (`id_dokumen`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`id_jurnal`);

--
-- Indeks untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indeks untuk tabel `kegiatan_progress`
--
ALTER TABLE `kegiatan_progress`
  ADD PRIMARY KEY (`id_kegiatan_progress`),
  ADD KEY `key_kegiatan_progress` (`id_kegiatan`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indeks untuk tabel `matkul_prasyarat`
--
ALTER TABLE `matkul_prasyarat`
  ADD PRIMARY KEY (`id_prasyarat`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `user_target` (`target`);

--
-- Indeks untuk tabel `obyek_penelitian`
--
ALTER TABLE `obyek_penelitian`
  ADD PRIMARY KEY (`id_penelitian`);

--
-- Indeks untuk tabel `pembimbing_kegiatan`
--
ALTER TABLE `pembimbing_kegiatan`
  ADD PRIMARY KEY (`id_pembimbing_kegiatan`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indeks untuk tabel `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`id_proyek`),
  ADD KEY `key_dosen_penguji` (`id_dosen_penguji`),
  ADD KEY `key_dosen_pembimbing` (`id_dosen_pembimbing`),
  ADD KEY `key_kegiatan` (`id_kegiatan`),
  ADD KEY `key_mhs` (`npm_ketua`),
  ADD KEY `key_penelitian` (`id_penelitian`);

--
-- Indeks untuk tabel `sidang`
--
ALTER TABLE `sidang`
  ADD PRIMARY KEY (`id_sidang`);

--
-- Indeks untuk tabel `sidang_nilai`
--
ALTER TABLE `sidang_nilai`
  ADD PRIMARY KEY (`id_sidang_nilai`);

--
-- Indeks untuk tabel `sidang_progress`
--
ALTER TABLE `sidang_progress`
  ADD PRIMARY KEY (`id_sidang_progress`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bimbingan`
--
ALTER TABLE `bimbingan`
  MODIFY `id_bimbingan` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT untuk tabel `bimbingan_progress`
--
ALTER TABLE `bimbingan_progress`
  MODIFY `id_bimbingan_progress` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT untuk tabel `dokumen_kegiatan`
--
ALTER TABLE `dokumen_kegiatan`
  MODIFY `id_dokumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kegiatan_progress`
--
ALTER TABLE `kegiatan_progress`
  MODIFY `id_kegiatan_progress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `matkul_prasyarat`
--
ALTER TABLE `matkul_prasyarat`
  MODIFY `id_prasyarat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `obyek_penelitian`
--
ALTER TABLE `obyek_penelitian`
  MODIFY `id_penelitian` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pembimbing_kegiatan`
--
ALTER TABLE `pembimbing_kegiatan`
  MODIFY `id_pembimbing_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `proyek`
--
ALTER TABLE `proyek`
  MODIFY `id_proyek` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT untuk tabel `sidang`
--
ALTER TABLE `sidang`
  MODIFY `id_sidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `sidang_nilai`
--
ALTER TABLE `sidang_nilai`
  MODIFY `id_sidang_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `sidang_progress`
--
ALTER TABLE `sidang_progress`
  MODIFY `id_sidang_progress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bimbingan`
--
ALTER TABLE `bimbingan`
  ADD CONSTRAINT `key_progress_tema` FOREIGN KEY (`id_kegiatan_progress`) REFERENCES `kegiatan_progress` (`id_kegiatan_progress`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `key_proyek` FOREIGN KEY (`id_proyek`) REFERENCES `proyek` (`id_proyek`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bimbingan_progress`
--
ALTER TABLE `bimbingan_progress`
  ADD CONSTRAINT `key_progress` FOREIGN KEY (`id_bimbingan`) REFERENCES `bimbingan` (`id_bimbingan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kegiatan_progress`
--
ALTER TABLE `kegiatan_progress`
  ADD CONSTRAINT `key_kegiatan_progress` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `user_target` FOREIGN KEY (`target`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `proyek`
--
ALTER TABLE `proyek`
  ADD CONSTRAINT `key_dosen_pembimbing` FOREIGN KEY (`id_dosen_pembimbing`) REFERENCES `dosen` (`nidn`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `key_dosen_penguji` FOREIGN KEY (`id_dosen_penguji`) REFERENCES `dosen` (`nidn`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `key_kegiatan` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `key_mhs` FOREIGN KEY (`npm_ketua`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `key_penelitian` FOREIGN KEY (`id_penelitian`) REFERENCES `obyek_penelitian` (`id_penelitian`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

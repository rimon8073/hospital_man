-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2020 at 11:06 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountmanager`
--

CREATE TABLE `accountmanager` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointmentdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `appointment_id`, `appointmentdate`, `branch`, `speciality`, `doctor`, `shift`, `name`, `mobile`, `address`, `age`, `gender`, `created_at`, `updated_at`) VALUES
(21, '202003001', '2020-03-12', 'Kollyanpur', 'Nuorology', 'Dr.Belal Khan', 'evening', 'rimon', '01675238438', 'kallyanpur', 23, 'Male', '2020-06-06 12:27:28', NULL),
(24, '202003002', '2020-03-28', 'mirpur', 'ACCIDENT & EMERGENCY', 'Dr. Zesika Hayat', 'evening', 'Kawser', '018224128', 'kustia', 23, 'male', '2020-06-06 13:54:19', NULL),
(25, '202003003', '2020-06-07', 'Mirpur', 'pathology', 'Dr.Belal Khan', 'Evening', 'AMIN', '0189796796', 'rangpur city', 44, 'Male', '2020-06-06 12:27:15', NULL),
(26, '202003004', '2020-05-20', 'Kollyanpur', 'ACCIDENT & EMERGENCY', 'Dr.khan', 'Evening', 'Rahim', '01999999999', 'gaibandha', 23, 'Others', '2020-06-06 12:27:22', NULL),
(27, '202003005', '2020-06-07', 'Mirpur', 'Nuorology', 'Dr.Belal Khan', 'Evening', 'Mst.ritu khan', '019324234', 'Domar', 25, 'Female', '2020-06-06 12:31:59', NULL),
(28, '202003006', '2020-06-07', 'Kollyanpur', 'pathology', 'Dr. Zesika Hayat', 'Morning', 'mst. rabeya khatun', '078453422', 'kollayanpur', 34, 'Female', '2020-06-06 12:46:58', NULL);

--
-- Triggers `appointment`
--
DELIMITER $$
CREATE TRIGGER `bfr_ins_appointment` BEFORE INSERT ON `appointment` FOR EACH ROW BEGIN
DECLARE vr_appointment_id int(20);
SELECT ifnull(MAX(appointment_id)+1,date_format(now(),'%Y%m001')) INTO vr_appointment_id FROM appointment;
SET new.appointment_id = vr_appointment_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bed_assign`
--

CREATE TABLE `bed_assign` (
  `id` int(10) UNSIGNED NOT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bed_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discharge_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assign_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bed_assign`
--

INSERT INTO `bed_assign` (`id`, `serial`, `patient_id`, `bed_id`, `description`, `assign_date`, `discharge_date`, `assign_by`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '5', NULL, 'trger', '2', NULL, NULL, '1', '2020-06-06 11:18:54', NULL),
(2, NULL, '7', NULL, 'gvbdfg', '3', NULL, NULL, '1', '2020-06-06 11:19:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deptname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `image`, `deptname`, `status`, `description`, `created_at`, `updated_at`) VALUES
(7, 'dept2.jpg', 'ACCIDENT & EMERGENCY', 'Active', 'Lorem ipsum dolor.....', '2020-06-02 12:05:25', '2020-06-06 14:09:58'),
(8, 'dept3.png', 'Nuorology', 'Active', 'Lorem ipsum dolor....', '2020-06-02 12:24:51', '2020-06-06 14:09:52'),
(9, 'download (2).jpg', 'Pathology', 'Active', 'Lorem ipsum dolor.', '2020-06-02 22:29:52', '2020-06-06 14:09:40'),
(10, 'download (1).jpg', 'Dental', 'Active', 'Lorem ipsum dolor..', '2020-06-06 13:50:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(10) UNSIGNED NOT NULL,
  `doctor_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bloodGroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `doctor_id`, `dname`, `email`, `mobile`, `address`, `gender`, `bloodGroup`, `dob`, `degination`, `department`, `biography`, `education`, `image`, `created_at`, `updated_at`) VALUES
(6, '202003003', 'Dr.Belal Khan', 'belal@gmail.com', '0167523843', 'saidpur', 'Male', 'A+', '2020-03-29', 'dr', 'pathology', 'dn', 'M.B.B.S', '89687952_1124828584520942_5786445052322512896_n.jpg', '2020-06-06 14:08:34', NULL),
(7, '202003004', 'Dr. Zesika Hayat', 'hayat@bdtask.com', '01343444443', '54,East Park Street,North Sonaimuri', 'Female', 'B+', '1993-01-02', 'Assistant Professor', 'ACCIDENT & EMERGENCY', 'M.B.B.S,FCFS,Pharma.D,CCFA,NFDA', 'M.B.B.S', 'd4.jpg', '2020-06-03 11:24:22', NULL),
(8, '202003005', 'safayet hossain', 'safa@gmail.com', '0182324234', 'lokkipur,chatrogram', 'Male', 'O+', '1997-06-05', 'M.B.B.S', 'ACCIDENT & EMERGENCY', 'Lorem ipsum dolor..', 'Doctoret degree', 'a1.jpg', '2020-06-06 13:47:38', NULL);

--
-- Triggers `doctor`
--
DELIMITER $$
CREATE TRIGGER `bfr_ins_doctor` BEFORE INSERT ON `doctor` FOR EACH ROW BEGIN
DECLARE vr_doctor_id int(20);
SELECT ifnull(MAX(doctor_id)+1,date_format(now(),'%Y%m001')) INTO vr_doctor_id FROM doctor;
SET new.doctor_id = vr_doctor_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snote` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `patient_code`, `doctor`, `snote`, `document`, `date`, `created_at`, `updated_at`) VALUES
(7, '202003001', 'Dr.Belal Khan', 'first one outdorjkjkjkjkl', 'download.jpg', '2020-03-25', '2020-06-06 11:39:54', NULL),
(8, '202003002', 'Dr. Zesika Hayat', 'it is for outdoor patient', '89587931_2868878863191960_9016814101673803776_o.jpg', '2020-03-16', '2020-06-06 11:37:47', NULL),
(10, '202003006', 'Dr.Belal Khan', 'test 4', 'IMG_20200316_180140.jpg', '2020-03-28', '2020-06-06 14:36:57', NULL),
(11, '202003005', 'Dr.khan', 'gg', 'a1.jpg', '2020-06-06', '2020-06-06 11:36:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `user_role`, `emp_name`, `emp_email`, `emp_password`, `emp_mobile`, `emp_image`, `emp_gender`, `emp_address`, `emp_status`, `created_at`, `updated_at`) VALUES
(4, '2', 'khan', 'khan@gmail', '1234', '017643423', '89687952_1124828584520942_5786445052322512896_n.jpg', 'Male', 'dfdee', 'active', '2020-04-25 05:25:02', NULL),
(5, '3', 'Rozi', 'rozi@gmail.com', '1234', '01743342342', 'orthi akter.jpg', 'Female', 'bdb', 'active', '2020-04-25 22:54:16', NULL),
(6, '6', 'rimon khan', 'rimon@gmail.com', '1234', '01973245', 'img20191011_1809190033.jpg', 'Male', 'rangpur', 'active', '2020-04-26 00:55:15', NULL),
(7, '4', 'rimon', 'safa@gmail.com', '1234', '019325433', 'r1.jpg', 'Male', 'rangpur', 'active', '2020-04-25 23:08:10', NULL),
(9, '1', 'rimon', 'rimon@gmail.com', '1234', '01764343r23', 'IMG_20200316_180132.jpg', 'Male', 'efefe', 'active', '2020-04-25 05:24:03', NULL),
(10, '5', 'Azmi', 'azmi@gmail.com', '1234', '01745353', 'IMG_20200316_180256.jpg', 'Male', 'satkira', 'active', '2020-04-26 00:33:33', NULL),
(11, '3', 'Mst.Tisa Khan', 'tisa@gmail.com', NULL, '0187234322', 'd4.jpg', 'Female', 'rangpur', 'active', '2020-06-06 14:57:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_slider`
--

CREATE TABLE `front_slider` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_slider`
--

INSERT INTO `front_slider` (`id`, `title`, `sub_title`, `slide_position`, `image`, `description`, `created_at`, `updated_at`) VALUES
(2, 'First Slide', 'Welcome to First Slide', '1', 'dept2.jpg', 'loresfdsgfede', '2020-06-06 12:05:43', NULL),
(3, 'second slide', 'Welcome to Second Slide', '2', 'dept3.png', 'fsdf', '2020-06-04 12:40:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_birth`
--

CREATE TABLE `hms_birth` (
  `birth_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_birth`
--

INSERT INTO `hms_birth` (`birth_id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'test birth report', '20200317', '2', '2020-04-27', '1', '2020-04-28 02:51:32', NULL),
(4, 'birth test 1', 'birth report 1', '20200319', '1', '2020-04-29', 'on', '2020-04-28 23:19:00', NULL),
(5, 'birth test 3', 'it is for test', '20200322', '202003001', '2020-04-30', '1', '2020-04-29 05:10:43', NULL),
(6, 'birth certificate', 'test', '202003007', 'Dr. Zesika Hayat', '2020-06-07', 'on', '2020-06-06 13:14:09', NULL),
(7, 'birth test 1', 'birth report 1', '202003005', 'Dr.khan', '2020-06-07', 'on', '2020-06-06 13:17:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_contact`
--

CREATE TABLE `hms_contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_contact`
--

INSERT INTO `hms_contact` (`id`, `name`, `email`, `subject`, `gender`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mahmodul Hasan Rimon', 'mhrimonkhan@gmail.com', 'test', 'on', 'it is test message', '2020-04-29 00:26:40', NULL),
(4, 'Joynul Abedin', 'joynul@gmail.com', 'test', 'on', 'demo test mesage', '2020-05-02 00:00:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_death`
--

CREATE TABLE `hms_death` (
  `death_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_death`
--

INSERT INTO `hms_death` (`death_id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
(5, 'death test 1', 'for test', '20200318', 'Dr.khan', '2020-04-30', '1', '2020-04-29 05:16:48', NULL),
(6, 'death 1', 'it is one of the best part', '202003001', 'Dr.Belal Khan', '2020-06-08', 'on', '2020-06-06 13:23:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_medicine_genetic`
--

CREATE TABLE `hms_medicine_genetic` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_medicine_genetic`
--

INSERT INTO `hms_medicine_genetic` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'A', 'this is test demo', 'Active', '2020-04-29 11:11:05', NULL),
(9, 'C', 'it is loersm', 'Active', '2020-06-06 15:01:12', NULL),
(10, 'B', 'test 2', 'Inactive', '2020-04-30 00:25:16', NULL),
(11, 'D', 'it is test loresm', 'Active', '2020-04-30 00:36:43', NULL),
(12, 'I', 'test', 'Active', '2020-06-06 15:01:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_operation`
--

CREATE TABLE `hms_operation` (
  `oper_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_operation`
--

INSERT INTO `hms_operation` (`oper_id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
(2, 'test1', 'for test report', '20200317', 'safayet', '2020-04-30', '1', '2020-04-29 05:20:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_bed`
--

CREATE TABLE `hm_bed` (
  `id` int(10) UNSIGNED NOT NULL,
  `bed_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hm_bed`
--

INSERT INTO `hm_bed` (`id`, `bed_type`, `description`, `limit`, `charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AC', 'Lorem ipsum dolor.', '10', '1200', '1', '2020-06-06 14:58:51', NULL),
(5, 'Non AC', 'loresm is dorem.....', '20', '2000', '1', '2020-06-06 14:58:30', NULL),
(6, 'Others', 'loresm is dolor....', '30', '800', '1', '2020-06-06 14:59:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_medicine`
--

CREATE TABLE `invoice_medicine` (
  `inv_m_id` int(10) UNSIGNED NOT NULL,
  `id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_medicine`
--

CREATE TABLE `inv_medicine` (
  `inv_medicine_id` int(10) UNSIGNED NOT NULL,
  `inv_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inv_medicine`
--

INSERT INTO `inv_medicine` (`inv_medicine_id`, `inv_id`, `medicine_id`, `quantity`, `price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 3, '90.00', '270.00', NULL, NULL),
(2, 3, 5, 5, '60.00', '300.00', NULL, NULL),
(3, 4, 1, 3, '90.00', '270.00', NULL, NULL),
(4, 4, 5, 5, '60.00', '300.00', NULL, NULL),
(5, 5, 5, 12, '60.00', '720.00', NULL, NULL),
(6, 5, 1, 2, '90.00', '180.00', NULL, NULL),
(7, 5, 6, 1, '11.00', '11.00', NULL, NULL),
(8, 6, 4, 2, '1000.00', '2000.00', NULL, NULL),
(9, 6, 6, 5, '11.00', '55.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lab_category`
--

CREATE TABLE `lab_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lab_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_category`
--

INSERT INTO `lab_category` (`id`, `cat_name`, `lab_type`, `cat_description`, `status`, `created_at`, `updated_at`) VALUES
(11, 'BIOCHEMICAL TEST- Blood Sugar', 'Lab', 'test loresm', 'Active', '2020-04-30 04:13:02', NULL),
(12, 'Autoimmunity', 'Lab', 'dfd', 'Active', '2020-04-30 04:10:30', NULL),
(13, 'BIOCHEMICAL TEST- Lipid Profile', 'Lab', 'test', 'Active', '2020-04-30 04:10:52', NULL),
(14, 'Cancer Marker (Tumour Marker)', 'Lab', 'dvs', 'Active', '2020-04-30 04:11:06', NULL),
(15, 'Cardiac Enzymes/ Markers', 'Lab', 'loresm ipsum dolor...', 'Active', '2020-06-06 15:04:39', NULL),
(16, 'ICU', 'Lab', 'sdcs', 'Active', '2020-04-30 04:11:37', NULL),
(17, 'Digital X-Ray (Contrast)', 'Lab', 'dsvs', 'Active', '2020-04-30 04:12:04', NULL),
(18, 'Cardiac Test (Non Invasive)', 'Lab', 'vzs', 'Active', '2020-04-30 04:36:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_ref_fee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_test`
--

INSERT INTO `lab_test` (`id`, `cat_name`, `test_name`, `test_rate`, `test_ref_fee`, `test_description`, `created_at`, `updated_at`) VALUES
(1, 'Autoimmunity', 'blood', '50', '20', 'done', '2020-04-30 04:29:56', NULL),
(3, 'Cancer Marker (Tumour Marker)', 'Free PSA', '30', '12', 'it is  for test', '2020-04-30 04:30:46', NULL),
(4, 'Plain X-Ray (Conventional)', 'X-Ray PNS lateral view', '80', '33', 'vgd', '2020-04-30 04:39:12', NULL),
(6, 'Cardiac Test (Non Invasive)', 'E C G (Resting)', '56', '65', 'gdfg', '2020-04-30 04:36:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `category`, `description`, `price`, `manufacture`, `status`, `created_at`, `updated_at`) VALUES
(1, 'napa extra', 'C', 'general', '90', 'Acmi', 'active', '2020-03-26 23:30:53', NULL),
(3, 'e-cap', 'A', 'test', '45', 'Acmi', 'active', '2020-04-30 04:26:29', NULL),
(4, 'H+', 'A', 'rghrh', '1000', 'IBN Sina', 'active', '2020-03-31 12:08:43', NULL),
(5, 'Aboxitin 1 gm', 'I', 'loresm demo', '60', 'Squre group', 'active', '2020-06-04 03:20:38', NULL),
(6, 'Metro', 'D', 'cfds', '11', 'Extra Farma', 'active', '2020-05-01 05:27:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(50, '2014_10_12_000000_create_users_table', 1),
(51, '2014_10_12_100000_create_password_resets_table', 1),
(52, '2019_08_19_000000_create_failed_jobs_table', 1),
(53, '2020_02_25_175115_create_patient_table', 1),
(54, '2020_02_25_175151_create_doctor_table', 1),
(55, '2020_02_25_175257_create_department_table', 1),
(56, '2020_02_25_175346_create_appointment_table', 1),
(57, '2020_02_25_175446_create_accountmanager_table', 1),
(59, '2020_03_03_145620_create_document_table', 2),
(60, '2020_03_16_171312_create_schedule_table', 3),
(61, '2020_03_17_183034_create_medicine_table', 4),
(62, '2020_03_18_200228_create_medicine_invoice_table', 5),
(63, '2020_03_19_190001_create_prescription_table', 5),
(64, '2020_03_20_095147_create_lab_test_table', 6),
(65, '2020_03_20_095521_create_lab_category_table', 7),
(66, '2020_03_28_164504_create_employee_table', 8),
(67, '2020_04_01_040841_create_prescription_medicine_table', 9),
(68, '2020_04_01_041324_create_prescription_observation_table', 10),
(69, '2020_04_08_093114_create_hm_bed_table', 11),
(70, '2020_04_08_101223_create_bed_assign_table', 12),
(71, '2020_04_27_101302_create_hms_birth_table', 13),
(72, '2020_04_27_104948_create_hms_death_table', 14),
(73, '2020_04_28_102502_create_hms_operation_table', 15),
(74, '2020_04_29_061547_create_hms_contact_table', 16),
(75, '2020_04_29_165434_create_hms_medicine_genetic_table', 17),
(76, '2020_06_04_172837_create_front_slider_table', 18),
(77, '2020_06_06_055313_create_invoice_medicine_table', 19),
(78, '2020_06_06_142149_create_inv_medicine_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `m_invoice`
--

CREATE TABLE `m_invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `vat` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `grand_total` decimal(10,0) DEFAULT NULL,
  `paid` decimal(10,0) DEFAULT NULL,
  `due` decimal(10,0) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_invoice`
--

INSERT INTO `m_invoice` (`id`, `patient_id`, `total`, `vat`, `discount`, `grand_total`, `paid`, `due`, `status`, `created_id`, `created_at`, `updated_at`) VALUES
(1, '1', '55', '5', '10', '50', '0', '50', '1', NULL, '2020-06-06 08:19:45', NULL),
(5, '1', '911', NULL, NULL, '911', '500', '411', '1', NULL, '2020-06-06 08:51:58', NULL),
(6, '10', '2055', '200', '500', '1755', '700', '1055', '1', NULL, '2020-06-06 15:03:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bloodGroup` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencetype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `patient_code`, `name`, `email`, `mobile`, `address`, `gender`, `bloodGroup`, `dob`, `referencetype`, `reference`, `type`, `created_at`, `updated_at`) VALUES
(5, '202003003', 'rimon khan', 'mhrimonkhan@gmail.com', '01745432345', 'dhaka', 'Male', 'A+', '2020-03-16', 'others', 'no', 2, '2020-06-06 14:15:27', NULL),
(7, '202003005', 'kawser', 'kawser123@gmail.com', '017777233243', 'Veramara,kustia', 'Male', 'B+', '2020-03-27', 'others', 'no', 1, '2020-06-06 14:15:07', NULL),
(9, '202003007', 'AL AMIN', 'admin@demo.com', '12345', 'frth', 'Male', 'AB+', '2020-03-09', 'No', 'fbhf', 0, '2020-06-02 12:57:28', NULL),
(10, '202003008', 'Mst.Tisa Khan', 'tisa@gmail.com', '01523132433', 'Pirgachha,Rangpur', 'Female', 'B+', '2014-04-07', 'Doctor', 'Lorem ipsum dolor.', 1, '2020-06-06 14:13:56', NULL),
(11, '202003009', 'Mst.Sriti Begum', 'sriti@gmail.com', '01122343343', 'rangpur', 'Female', 'AB-', '2005-02-07', 'No', 'no', 0, '2020-06-06 14:39:39', NULL);

--
-- Triggers `patient`
--
DELIMITER $$
CREATE TRIGGER `bfr_ins_patient` BEFORE INSERT ON `patient` FOR EACH ROW BEGIN
DECLARE vr_patient_code int(11);
SELECT ifnull(MAX(patient_code)+1,date_format(now(),'%Y%m001')) INTO vr_patient_code FROM patient;
SET new.patient_code = vr_patient_code;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `pr_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(11) NOT NULL,
  `pr_observation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`pr_id`, `patient_id`, `pr_observation`, `status`, `created_at`, `updated_at`) VALUES
(62, 202003008, 'well', 1, '2020-06-06 14:50:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_medicine`
--

CREATE TABLE `prescription_medicine` (
  `pr_m_id` int(10) UNSIGNED NOT NULL,
  `pr_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `douse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `douse_day` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescription_medicine`
--

INSERT INTO `prescription_medicine` (`pr_m_id`, `pr_id`, `medicine_id`, `douse`, `douse_day`, `instruction`, `created_at`, `updated_at`) VALUES
(68, 62, 4, '1+0+1', '7', 'well', '2020-06-06 14:50:27', NULL),
(69, 62, 3, '0+1+1', '10', 'well', '2020-06-06 14:50:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_observation`
--

CREATE TABLE `prescription_observation` (
  `pr_t_id` int(10) UNSIGNED NOT NULL,
  `pr_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescription_observation`
--

INSERT INTO `prescription_observation` (`pr_t_id`, `pr_id`, `test_id`, `created_at`, `updated_at`) VALUES
(32, '62', '1', '2020-06-06 14:50:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `dname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ptime` time(5) NOT NULL,
  `svisibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `dname`, `day`, `stime`, `etime`, `ptime`, `svisibility`, `status`, `created_at`, `updated_at`) VALUES
(9, 'safayet hossain', 'sunday', '07:45', '10:30', '00:00:45.00000', 'Sequential', 'active', '2020-06-06 14:46:23', NULL),
(10, 'Dr. Zesika Hayat', 'Tuesday', '17:50', '22:50', '00:00:45.00000', 'Sequential', 'active', '2020-06-06 14:48:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'rimon', 'admin@demo.com', NULL, '$2y$10$oR5k3Z7.CJKKEYHLbe3R7OliqL0xr.d2c2p9QQdDrPkRQTNJkpFRa', 'Bh9W9tmTYWEyUpHJXGszwuZRRhMbmeOguRAlyzmKalPA2AfclLTKvedHSznE', '2020-05-02 00:09:57', '2020-05-02 00:09:57'),
(3, 'safayet', 'safa@gmail.com', NULL, '$2y$10$L5VzRuUb6c7FeOv76npba.fGHocr7dD9OVfK05XbafYqu0F/AqozK', 'AvgnUwoGxSMN8qqihWJZog7ZfcTPOK3rbjhyS8VA0yE1G7qMRQg6kB6AFPuA', '2020-05-03 00:29:53', '2020-05-03 00:29:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountmanager`
--
ALTER TABLE `accountmanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed_assign`
--
ALTER TABLE `bed_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_slider`
--
ALTER TABLE `front_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hms_birth`
--
ALTER TABLE `hms_birth`
  ADD PRIMARY KEY (`birth_id`);

--
-- Indexes for table `hms_contact`
--
ALTER TABLE `hms_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hms_death`
--
ALTER TABLE `hms_death`
  ADD PRIMARY KEY (`death_id`);

--
-- Indexes for table `hms_medicine_genetic`
--
ALTER TABLE `hms_medicine_genetic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hms_operation`
--
ALTER TABLE `hms_operation`
  ADD PRIMARY KEY (`oper_id`);

--
-- Indexes for table `hm_bed`
--
ALTER TABLE `hm_bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_medicine`
--
ALTER TABLE `invoice_medicine`
  ADD PRIMARY KEY (`inv_m_id`);

--
-- Indexes for table `inv_medicine`
--
ALTER TABLE `inv_medicine`
  ADD PRIMARY KEY (`inv_medicine_id`);

--
-- Indexes for table `lab_category`
--
ALTER TABLE `lab_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_invoice`
--
ALTER TABLE `m_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  ADD PRIMARY KEY (`pr_m_id`);

--
-- Indexes for table `prescription_observation`
--
ALTER TABLE `prescription_observation`
  ADD PRIMARY KEY (`pr_t_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountmanager`
--
ALTER TABLE `accountmanager`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `bed_assign`
--
ALTER TABLE `bed_assign`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_slider`
--
ALTER TABLE `front_slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_birth`
--
ALTER TABLE `hms_birth`
  MODIFY `birth_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hms_contact`
--
ALTER TABLE `hms_contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hms_death`
--
ALTER TABLE `hms_death`
  MODIFY `death_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hms_medicine_genetic`
--
ALTER TABLE `hms_medicine_genetic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hms_operation`
--
ALTER TABLE `hms_operation`
  MODIFY `oper_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hm_bed`
--
ALTER TABLE `hm_bed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice_medicine`
--
ALTER TABLE `invoice_medicine`
  MODIFY `inv_m_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_medicine`
--
ALTER TABLE `inv_medicine`
  MODIFY `inv_medicine_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lab_category`
--
ALTER TABLE `lab_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lab_test`
--
ALTER TABLE `lab_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `m_invoice`
--
ALTER TABLE `m_invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `pr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  MODIFY `pr_m_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `prescription_observation`
--
ALTER TABLE `prescription_observation`
  MODIFY `pr_t_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

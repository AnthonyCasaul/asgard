-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2023 at 04:45 PM
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
-- Database: `thesisprototype`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` int(5) NOT NULL,
  `course_code` varchar(25) NOT NULL,
  `course_type` varchar(6) NOT NULL,
  `professor_list` varchar(115) NOT NULL,
  `isLab` varchar(5) NOT NULL,
  `duration` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `course_code`, `course_type`, `professor_list`, `isLab`, `duration`) VALUES
(1, 'INTCOMP', 'CCIS', 'ROMMEL DORIN,ALEXANDER PAHAYAHAY,RAUL DE VERA,BHAI NHURAISHA DEPLOMO,EMILY SICAT,WILBER SABADO', 'true', 3),
(2, 'COMPROG1', 'CCIS', 'DANIEL DELLOSA,ROMMEL DORIN,ROEL TRABALLO,EMILY SICAT', 'true', 3),
(3, 'WEBTOOLS', 'CCIS', 'ALEXANDER PAHAYAHAY', 'true', 3),
(5, 'GEAA', 'Gen Ed', 'LESTER FREDERICK DELGADO,MARILYN RONDON,AGNES MEDINA,GEOFFERSON TING', 'false', 3),
(6, 'GEMMW', 'Gen Ed', 'FREDERIC ALINAS,RACQUEL FRANCISCO,ESTRELLA CHAN,EDESA GRAMA,VIRGILIO OGBINAR', 'false', 3),
(7, 'GEMST-LITE', 'Gen Ed', 'LAARNI EVELYN SANTIAGO,JOY PASCUAL,MA. THERESA DATU,EDEN RAFALLO,GERWYN PASCUAL,MARIA CARMELA SISON,ANGELITO VARGAS', 'false', 3),
(8, 'PE 1', 'PE', 'MARIJOY SAMSON,DIONISIO ORIBIANA,ROGELIO DELA TORRE,NORMAN ARALAR,RUEL FERNANDO,FROILAN BANACIA', 'false', 2),
(9, 'DIGIMEDIA 2', 'CCIS', 'MARY ELLAINE CERVANTES', 'true', 3),
(10, 'DATASTRU (2018)', 'CCIS', 'ROWENA DAVID,NOMAR MAESTRO,JOMARISS PLAN,ROEL TRABALLO', 'true', 3),
(11, 'ORGCOMM', 'Gen Ed', 'ONY ERISPE,HENRY MAGAT,MARIVIC CUIZON,JESUS PERRY CAUDILLA', 'false', 3),
(12, 'PE 3', 'PE', 'JESUS ARGARIN,LEONILA OSANA,EMIL LOTEYRO', 'false', 2),
(13, 'GEE', 'Gen Ed', 'MARICOR ANNE CAUTON,MARIA BERNADETTE DE JESUS,PIO JAGURIN,JOSE EMMERICO CRUZ,MA. ROWELLA BALIAO', 'false', 3),
(14, 'GECW', 'Gen Ed', 'GRACE BARAL,DIANA MARIE BOLO,ANNALYN REYES,BERNARDO MIRANDA,FELIZARDO PLANA', 'false', 3),
(15, 'MODSIM', 'CCIS', 'ETHEL RAMOS,ZHARINA PASCUAL,JOMARISS PLAN', 'true', 3),
(16, 'OPERSYS (2018)', 'CCIS', 'DANIEL DELLOSA,JARBY GABRIEL', 'true', 3),
(17, 'CALCULUS', 'Gen Ed', 'LESTER DIAMPOC,LILIBETH ARCALAS,RACQUEL FRANCISCO,FREDERIC ALINAS', 'false', 4),
(18, 'IAS', 'CCIS', 'CECILIA TADEO,NOMAR MAESTRO', 'false', 3),
(19, 'ALGOCOM', 'CCIS', 'NOMAR MAESTRO', 'true', 3),
(20, 'SOFTENG 1', 'CCIS', 'ERA MARIE GANNABAN,ALEXANDER PAHAYAHAY', 'true', 3),
(21, 'OOPROGR (2018)', 'CCIS', 'ROMMEL DORIN,JOMARISS PLAN', 'true', 3),
(22, 'ELECT1', 'CCIS', 'CHRISTIAN MICHAEL MANSUETO,ABELARDO BUCAD', 'true', 3),
(23, 'HCI', 'CCIS', 'ABELARDO BUCAD,BHAI NHURAISHA DEPLOMO', 'true', 3),
(24, 'DISCTRU1', 'CCIS', 'HERNAN ALAR,RITA FAMINI,ETHEL RAMOS', 'true', 3),
(25, 'TRENDS', 'CCIS', 'DANILO SABADO,JENNIFER CARPIO', 'true', 3),
(26, 'THESIS1 (2018)', 'CCIS', 'NOMAR MAESTRO,ERA MARIE GANNABAN,JENNIFER CARPIO,MARY ELLAINE CERVANTES', 'true', 3),
(27, 'ELECT2', 'CCIS', 'ALBERT VINLUAN,MICHAEL OLIVO', 'true', 3),
(28, 'ELECT3', 'CCIS', 'ALI NAIM,ETHEL RAMOS,HERNAN ALAR,EDGARDO CRUZ', 'true', 3),
(29, 'DISCTRU2', 'CCIS', 'RITA FAMINI,JOMARISS PLAN', 'true', 3),
(30, 'GAME 2', 'CCIS', 'PAUL GILBERT MAGLAYA', 'true', 3),
(31, 'SOCENG', 'CCIS', 'ERWIN GUERRA', 'true', 3),
(32, 'INFOSECDP', 'CCIS', 'CECILIA TADEO,ALI NAIM', 'true', 3),
(33, 'DATMIN', 'CCIS', 'NINO NARIDO', 'true', 3),
(34, 'MODPHY', 'Gen Ed', 'SUSAN GUEVARRA', 'false', 3),
(35, 'WEBINTEL', 'CCIS', 'CHRISTIAN MICHAEL MANSUETO', 'true', 3),
(36, 'PRESANA', 'CCIS', 'NINO NARIDO', 'true', 3),
(37, 'PROMNGT (2018)', 'CCIS', 'ROMMEL GARMA', 'true', 3),
(38, 'ADELEX', 'CCIS', 'PERCIVAL ADAO,JARBY GABRIEL', 'true', 3),
(39, 'GEFIL 1', 'Gen Ed', 'NORINA LAZARO,JUDITH ARMENDARES,CRISTOPHER ALVIN DE GUZMAN,EDESA GRAMA,LOLITA MUSA,JIOFFRE ACOPRA', 'false', 3),
(40, 'PNETSEC (2018)', 'CCIS', 'CECILIA TADEO,ERWIN GUERRA,WILBER SABADO', 'true', 3),
(41, 'NETW1', 'CCIS', 'RAUL DE VERA,JARBY GABRIEL', 'true', 5),
(42, 'SERADM', 'CCIS', 'ANNA CHARISMA DECHAVEZ', 'true', 3),
(43, 'SYSIA', 'CCIS', 'PERCIVAL ADAO,ANNA CHARISMA DECHAVEZ', 'true', 3),
(44, 'DISCMAT', 'CCIS', 'ANNA CHARISMA DECHAVEZ,ERWIN GUERRA,LILIBETH ARCALAS', 'true', 3),
(45, 'QMODSIM', 'CCIS', 'MICHAEL OLIVO,LESTER DIAMPOC', 'true', 3),
(46, 'FUNDDB', 'CCIS', 'JOEL MANGABA,ERWIN GUERRA', 'true', 3),
(47, 'ACPRIN', 'CCIS', 'ANITA CATOLICO,ELVIRA MEJIA,ARTURO JR TESORERO', 'true', 3),
(48, 'NETW2', 'CCIS', 'LILIBETH ARCALAS', 'true', 3),
(49, 'CAPSTONE 1', 'CCIS', 'RITA FAMINI,LILIBETH ARCALAS,ANNA CHARISMA DECHAVEZ', 'true', 3),
(50, 'EHACK', 'CCIS', 'EDGARDO CRUZ', 'true', 3),
(51, 'TECHNO', 'CCIS', 'CECILIA TADEO', 'true', 3),
(52, 'PROBSTA', 'CCIS', 'RACQUEL FRANCISCO', 'true', 3),
(53, 'SYSDEV', 'CCIS', 'ROMMEL DORIN', 'true', 3),
(54, 'TCPIP ', 'CCIS', 'JARBY GABRIEL', 'true', 3),
(55, 'INFOMAN', 'CCIS', 'EMILY SICAT', 'true', 3),
(56, 'COMPROG2', 'CCIS', 'EMILY SICAT', 'true', 3),
(57, 'VOIPTEC', 'CCIS', 'ERWIN GUERRA', 'true', 3),
(58, 'INTPT', 'CCIS', 'ROMMEL GARMA', 'true', 3),
(59, 'SWTROU', 'CCIS', 'BHAI NHURAISHA DEPLOMO', 'true', 3),
(60, 'NETANDES', 'CCIS', 'REYNALDO ALVEZ', 'true', 3),
(61, 'WEBAMGT 2018', 'CCIS', 'REYNALDO ALVEZ', 'true', 3),
(62, 'ADELEX', 'CCIS', 'JARBY GABRIEL,PERCIVAL ADAO', 'true', 3),
(63, 'CAPSTONE 1', 'CCIS', 'ANNA CHARISMA DECHAVEZ,RITA FAMINI,LILIBETH ARCALAS', 'true', 3),
(64, 'MARKETING 1', 'CCIS', 'JENNIFER CARPIO', 'true', 3),
(65, 'SDE', 'CCIS', 'JOSE VARONA', 'true', 3);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_course`
--

CREATE TABLE `faculty_course` (
  `teacherID` int(11) NOT NULL,
  `professor_name` varchar(50) NOT NULL,
  `course_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inputs`
--

CREATE TABLE `inputs` (
  `className` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inputs`
--

INSERT INTO `inputs` (`className`) VALUES
('II-ACDS');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `professorID` int(10) NOT NULL,
  `professor_name` varchar(26) NOT NULL,
  `department` text NOT NULL DEFAULT '\'No Department\'',
  `preferred_days` text DEFAULT 'No Preferred Days',
  `position` text NOT NULL DEFAULT '\'No Position Assigned\'',
  `gratis` int(10) NOT NULL,
  `honorarium` int(10) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`professorID`, `professor_name`, `department`, `preferred_days`, `position`, `gratis`, `honorarium`, `total`) VALUES
(1, 'ABELARDO BUCAD', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(2, 'AGNES MEDINA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(3, 'ALBERT VINLUAN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(4, 'ALEXANDER PAHAYAHAY', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(5, 'ALI NAIM', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(6, 'ANGELITO VARGAS', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(7, 'ANITA CATOLICO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(8, 'ANNA CHARISMA DECHAVEZ', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(9, 'ANNALYN REYES', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(10, 'ANNIELYN GUZMAN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(11, 'ARTURO JR TESORERO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(12, 'BERNARDO MIRANDA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(13, 'BHAI NHURAISHA DEPLOMO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(14, 'CECILIA TADEO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(15, 'CHRISTIAN MICHAEL MANSUETO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(16, 'CRISTOPHER ALVIN DE GUZMAN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(17, 'DANIEL DELLOSA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(18, 'DANILO SABADO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(19, 'DIANA MARIE BOLO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(20, 'DIONISIO ORIBIANA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(21, 'EDEN RAFALLO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(22, 'EDESA GRAMA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(23, 'EDGARDO CRUZ', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(24, 'ELVIRA MEJIA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(25, 'EMIL LOTEYRO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(26, 'EMILY SICAT', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(27, 'ERA MARIE GANNABAN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(28, 'ERWIN GUERRA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(29, 'ESTRELLA CHAN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(30, 'ETHEL RAMOS', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(31, 'FELIZARDO PLANA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(32, 'FREDERIC ALINAS', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(33, 'FROILAN BANACIA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(34, 'GEOFFERSON TING', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(35, 'GERWYN PASCUAL', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(36, 'GRACE BARAL', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(37, 'HENRY MAGAT', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(38, 'HERNAN ALAR', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(39, 'JARBY GABRIEL', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(40, 'JENNIFER CARPIO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(41, 'JESUS ARGARIN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(42, 'JESUS PERRY CAUDILLA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(43, 'JIMMY SAILANI', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(44, 'JIOFFRE ACOPRA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(45, 'JOEL MANGABA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(46, 'JOMARISS PLAN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(47, 'JOSE EMMERICO CRUZ', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(48, 'JOSE VARONA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(49, 'JOSHUA RAPHAEL ORDONEZ', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(50, 'JOY PASCUAL', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(51, 'JUDITH ARMENDARES', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(52, 'LAARNI EVELYN SANTIAGO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(53, 'LEONILA OSANA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(54, 'LESTER DIAMPOC', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(55, 'LESTER FREDERICK DELGADO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(56, 'LILIBETH ARCALAS', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(57, 'LOLITA MUSA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(58, 'MA. ROWELLA BALIAO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(59, 'MA. THERESA DATU', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(60, 'MARIA BERNADETTE DE JESUS', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(61, 'MARIA CARMELA SISON', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(62, 'MARICOR ANNE CAUTON', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(63, 'MARIJOY SAMSON', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(64, 'MARILYN RONDON', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(65, 'MARIVIC CUIZON', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(66, 'MARY ELLAINE CERVANTES', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(67, 'MAYORICO JR APELADO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(68, 'MICHAEL OLIVO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(69, 'NINO NARIDO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(70, 'NOMAR MAESTRO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(71, 'NORINA LAZARO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(72, 'NORMAN ARALAR', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(73, 'ONY ERISPE', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(74, 'PAUL GILBERT MAGLAYA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(75, 'PERCIVAL ADAO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(76, 'PIO JAGURIN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(77, 'RACQUEL FRANCISCO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(78, 'RAUL DE VERA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(79, 'REYNALDO ALVEZ', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(80, 'RITA FAMINI', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(81, 'ROEL TRABALLO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(82, 'ROGELIO DELA TORRE', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(83, 'ROMMEL DORIN', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(84, 'ROMMEL GARMA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(85, 'ROSALIE DELA CRUZ', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(86, 'ROWENA DAVID', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(87, 'RUEL FERNANDO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(88, 'SUSAN GUEVARRA', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(89, 'VIRGILIO OGBINAR', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(90, 'WILBER SABADO', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(91, 'ZHARINA PASCUAL', 'No Department', 'No Preferred Days', 'No Position Assigned', 0, 0, 0),
(103, 'asd', 'INS', 'Monday', 'Instructor', 0, 0, 0),
(104, 'asd', 'INS', 'Monday', 'Instructor', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomID` int(10) NOT NULL,
  `room_name` varchar(9) DEFAULT NULL,
  `isLab` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomID`, `room_name`, `isLab`) VALUES
(1, 'lab 1', 'true'),
(2, 'room 2', 'false'),
(3, 'room 3', 'false'),
(4, 'lab 2', 'true'),
(5, 'room 2', 'false'),
(6, 'room 4', 'false'),
(7, 'lab 3', 'true'),
(8, 'lab 3', 'true'),
(9, 'lab 4', 'true'),
(10, 'lab 5', 'true'),
(11, 'lab 6', 'true'),
(12, 'lab 7', 'true'),
(13, 'lab 8', 'true'),
(14, 'lab 9', 'true'),
(15, 'lab 10', 'true'),
(16, 'room 5', 'false'),
(17, 'lab 11', 'true'),
(18, 'lab 12', 'true'),
(19, 'lab 13', 'true'),
(20, 'lab 14', 'true'),
(21, 'lab 15', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `scheduleID` int(11) NOT NULL,
  `meetingTime` varchar(50) NOT NULL,
  `room` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `sectionID` int(10) NOT NULL,
  `section_name` varchar(12) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `course_list` varchar(72) NOT NULL,
  `shift` varchar(10) NOT NULL,
  `department` varchar(20) NOT NULL DEFAULT 'No Department'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionID`, `section_name`, `year`, `course_list`, `shift`, `department`) VALUES
(1, 'I-ACSAD', '1', 'INTCOMP,COMPROG1,WEBTOOLS,GEFIL 1,GEAA,GEMMW,GEMST-LITE,PE 1', 'Morning', 'No Department'),
(2, 'I-BCSAD', '1', 'INTCOMP,COMPROG1,WEBTOOLS,GEFIL 1,GEAA,GEMMW,GEMST-LITE,PE 1', 'Afternoon', 'No Department'),
(3, 'II-ACSAD', '2', 'DATASTRU (2018),OPERSYS (2018),ORGCOMM,OOPROGR (2018),GECW,GEE,PE 3', 'Morning', 'No Department'),
(4, 'II-BCSAD', '2', 'DATASTRU (2018),OPERSYS (2018),ORGCOMM,OOPROGR (2018),GECW,GEE,PE 3', 'Afternoon', 'No Department'),
(5, 'III-ACSAD', '3', 'MODSIM,ELECT1,HCI,SOFTENG 1,IAS,DISCTRU 2,ALGOCOM', 'Morning', 'No Department'),
(6, 'III-BCSAD', '3', 'MODSIM,ELECT1,HCI,SOFTENG 1,IAS,DISCTRU 2,ALGOCOM', 'Afternoon', 'No Department'),
(7, 'IV-ACSAD', '4', 'TRENDS,THESIS1 (2018),ELECT2,ELECT3', 'Morning', 'No Department'),
(8, 'II-ACSSC', '2', 'DIGIMEDIA 2,DATASTRU (2018),SDE,MARKETING 1,ORGCOMM,PE 3,GEE,GECW', 'Afternoon', 'No Department'),
(9, 'II-BCSSC', '2', 'DIGIMEDIA 2,DATASTRU (2018),SDE,MARKETING 1,ORGCOMM,PE 3,GEE,GECW', 'Morning', 'No Department'),
(10, 'III-ACSSC', '3', 'MODSIM,OPERSYS (2018),HCI,IAS,CALCULUS,ALGOCOM,SOFTENG 1,DISCTRU2,ELECT1', 'Afternoon', 'No Department'),
(11, 'III-BCSSC', '3', 'MODSIM,OPERSYS (2018),HCI,IAS,CALCULUS,ALGOCOM,SOFTENG 1,DISCTRU2,ELECT1', 'Morning', 'No Department'),
(12, 'IV-ACSSC', '4', 'GAME 2,SOCENG,INFOSECDP,THESIS1 (2018),ELECT3', 'Afternoon', 'No Department'),
(13, 'IV-BCSSC', '4', 'GAME 2,SOCENG,INFOSECDP,THESIS1 (2018),ELECT3', 'Morning', 'No Department'),
(14, 'II-ACDS', '2', 'DATMIN,DATASTRU (2018),MODPHY,GEE,GECW', 'Afternoon', 'No Department'),
(15, 'III-ACDS', '3', 'ELECT1,MODSIM,OPERSYS (2016),HCI,SOFTENG 1,IAS,DISCTRU2,ALGOCOM,CALCULUS', 'Morning', 'No Department'),
(16, 'IV-ACDS', '4', 'WEBINTEL,PRESANA,PROMNGT (2018),INFOSECDP,ELECT3,THESIS1 (2018)', 'Afternoon', 'No Department'),
(17, 'III-DINS-PET', '3', 'NETW2,DISCMAT,QMODSIM,HCI,FUNDDB,ACPRIN', 'Morning', 'No Department'),
(18, 'II-DINS', '2', 'PNETSEC (2018),NETW1,DATASTRU (2018),PE 3,ORGCOMM,GECW,GEE', 'Afternoon', 'No Department'),
(19, 'IV-CINS', '4', 'CAPSTONE 1,EHACK,ELECT3,ELECT2,TECHNO', 'Morning', 'No Department'),
(20, 'III-CINS', '3', 'SERADM,SYSIA,DISCMAT,QMODSIM,HCI,FUNDDB,CALCULUS,ACPRIN', 'Afternoon', 'No Department'),
(21, 'I-CINS', '1', 'ADELEX,COMPROG1,INTCOMP,PE 1,GEMST-LITE,GEAA,GEMMW,GEFIL 1', 'Morning', 'No Department'),
(22, 'II-CINS', '2', 'PNETSEC (2018),NETW1,DATASTRU (2018),PE 3,ORGCOMM,GECW,GEE', 'Afternoon', 'No Department'),
(23, 'I-BINS', '1', 'ADELEX,COMPROG1,INTCOMP,PE 1,GEMST-LITE,GEAA,GEMMW,GEFIL 1', 'Morning', 'No Department'),
(24, 'II-BINS', '2', 'PNETSEC (2018),NETW1,DATASTRU (2018),PE 3,ORGCOMM,GECW,GEE', 'Afternoon', 'No Department'),
(25, 'III-BINS', '3', 'SERADM,SYSIA,DISCMAT,QMODSIM,HCI,FUNDDB,CALCULUS,ACPRIN', 'Morning', 'No Department'),
(26, 'IV-BINS', '4', 'CAPSTONE 1,EHACK,ELECT3,ELECT2,TECHNO', 'Afternoon', 'No Department'),
(27, 'I-AINS', '1', 'ADELEX,COMPROG1,INTCOMP,PE 1,GEMST-LITE,GEAA,GEMMW,GEFIL 1', 'Morning', 'No Department'),
(28, 'II-AINS', '2', 'PNETSEC (2018),NETW1,DATASTRU (2018),PE 3,ORGCOMM,GECW,GEE', 'Afternoon', 'No Department'),
(29, 'III-AINS', '3', 'SERADM,SYSIA,DISCMAT,QMODSIM,HCI,FUNDDB,CALCULUS,ACPRIN', 'Morning', 'No Department'),
(30, 'IV-AINS', '4', 'CAPSTONE 1,EHACK,ELECT3,ELECT2,TECHNO', 'Afternoon', 'No Department'),
(31, 'I-A APDEV', '1', 'COMPROG1,INTCOMP,PE 1,GEFIL 1,GEMST-LITE,GEMMW,GEAA', 'Morning', 'No Department'),
(32, 'II-A APDEV', '2', 'WEBTOOLS,DATASTRU (2018),PE 3,ORGCOMM,PROBSTA,GECW,GEE', 'Afternoon', 'No Department'),
(33, 'III-A APDEV', '3', 'OOPROGR (2018),OPERSYS (2018),DISCTRU1,SYSDEV,CALCULUS', 'Morning', 'No Department'),
(34, 'I-B APDEV', '1', 'COMPROG1,INTCOMP,PE 1,GEFIL 1,GEMST-LITE,GEMMW,GEAA', 'Afternoon', 'No Department'),
(35, 'I-A NETAD', '1', 'ADELEX,INTCOMP,PE 1,GEMST-LITE,GEAA,GEFIL 1,GEMMW', 'Morning', 'No Department'),
(36, 'II-A NETAD', '2', 'TCPIP ,NETW1,PNETSEC (2018),INFOMAN,COMPROG2,PE 1,PROBSTA', 'Afternoon', 'No Department'),
(37, 'III-A NETAD', '3', 'VOIPTEC,MODPHY,INTPT,SWTROU,NETANDES,WEBAMGT 2018,CALCULUS,ORGCOMM', 'Morning', 'No Department'),
(38, 'I-B NETAD', '1', 'ADELEX,INTCOMP,PE 1,GEMST-LITE,GEAA,GEFIL 1,GEMMW', 'Afternoon', 'No Department'),
(39, 'IV-BCSAD', '4', 'TRENDS,THESIS1 (2018),ELECT2,ELECT3', 'Morning', 'No Department'),
(42, 'new', '1', 'INTCOMP', 'Morning', 'INS');

-- --------------------------------------------------------

--
-- Table structure for table `section_course`
--

CREATE TABLE `section_course` (
  `SectionCourseID` int(11) NOT NULL,
  `section_name` varchar(20) NOT NULL,
  `coursecode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `faculty_course`
--
ALTER TABLE `faculty_course`
  ADD PRIMARY KEY (`teacherID`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`professorID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`scheduleID`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sectionID`);

--
-- Indexes for table `section_course`
--
ALTER TABLE `section_course`
  ADD PRIMARY KEY (`SectionCourseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `faculty_course`
--
ALTER TABLE `faculty_course`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `professorID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `scheduleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `sectionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `section_course`
--
ALTER TABLE `section_course`
  MODIFY `SectionCourseID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

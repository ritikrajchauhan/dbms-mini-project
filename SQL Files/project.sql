-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2022 at 04:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `leaderboard` ()  NO SQL
select q.quizname,s.score,s.totalscore,st.name,s.mail from score s,student st,quiz q where s.mail=st.mail and q.quizid=s.quizid order by score DESC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
(1, 'CSE'),
(2, 'ISE'),
(3, 'ECE'),
(4, 'EEE');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qs` varchar(200) NOT NULL,
  `op1` varchar(30) NOT NULL,
  `op2` varchar(30) NOT NULL,
  `op3` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `quizid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qs`, `op1`, `op2`, `op3`, `answer`, `quizid`) VALUES
('/ Assume that integers take 4 bytes.<br>  #include<iostream> <br>    using namespace std; <br>       class Test  { <br>   static int i;<br>    int j;<br>  }; <br>    int Test::i; <br>    int main() { ', '1', '2', '3', '4', 5),
('C primiarily developed as..', 'General purpose language', 'Data processing language D.', 'None of the above.', 'System programming language  ', 4),
('C programs converted into machine language with the help of..', 'An Editor  ', 'An operating system', ' None of these.', 'A compiler  ', 4),
('No. of consonant in english language is..', '20', '22', '28', '21', 6),
('No. of vowels in english language is..', '3', '4', '7', '5', 6),
('Total no of letters in english language is..', '23', '24', '25', '26', 6),
('When a copy constructor may be called?', 'When an object of the class is', 'When an object of the class is', 'When an object is constructed ', 'All of the above', 5),
('Which of the following functions must use reference.', 'Assignment operator function', 'Destructor', 'Parameterized constructor', 'Copy Constructor', 5),
('Which of the following is FALSE about references in C++', 'References cannot be NULL', 'A reference must be initialize', 'Once a reference is created, i', 'References cannot refer to con', 5),
('Which of the following operators cannot be overloaded', '. (Member Access or Dot operat', '?: (Ternary or Conditional Ope', ':: (Scope Resolution Operator)', 'All of the above', 5),
('Which of the followings is/are automatically added to every class, if we do not write our own.', 'Copy Constructor', 'Assignment Operator', 'A constructor without any para', 'All of the above', 5),
('Who is the father of C language?', 'Bjarne Stroustrup', 'James A. Gosling  ', 'Dr. E.F. Codd', 'Dennis Ritchie  ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quizid` int(11) NOT NULL,
  `quizname` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `mail` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizid`, `quizname`, `date_created`, `mail`) VALUES
(4, 'c quiz', '2022-01-21 16:13:50', 'ritikraj250500@gmail.com'),
(5, 'c++ quiz', '2022-01-21 16:17:13', 'ritikraj250500@gmail.com'),
(6, 'english', '2022-01-21 17:04:12', 'ritikraj250500@gmail.com');

--
-- Triggers `quiz`
--
DELIMITER $$
CREATE TRIGGER `ondeleteqs` AFTER DELETE ON `quiz` FOR EACH ROW delete from questions where questions.quizid=old.quizid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `slno` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `quizid` int(11) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `totalscore` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`slno`, `score`, `quizid`, `mail`, `totalscore`, `remark`) VALUES
(13, 6, 5, 'ritikraj250500@gmail.com', 6, 'good'),
(14, 2, 4, 'ritikraj250500@gmail.com', 3, 'good'),
(15, 5, 5, 'vishwasbr259@gmail.com', 6, 'good');

--
-- Triggers `score`
--
DELIMITER $$
CREATE TRIGGER `remarks` BEFORE INSERT ON `score` FOR EACH ROW set NEW.remark = if(NEW.score = 0, 'bad', 'good')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffid`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('007', 'Ritik Raj Chauhan', 'ritikrajchauhan@gmail.com', '9992737370', 'M', '2001-03-25', 'riPURZLCmEMcc', 'CSE'),
('005', 'VISHWAS B R', 'vishwasbr259@gmail.com', '9238482934', 'M', '2000-11-13', 'riPURZLCmEMcc', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('1ar19cs044', 'Ritik Raj Chauhan', 'ritikrajchauhan@gmail.com', '9983763820', 'M', '2001-03-25', 'riPURZLCmEMcc', 'CSE'),
('1ar19cs060', 'VISHWAS B R', 'vishwasbr259@gmail.com', '9623746932', 'M', '2000-11-13', 'riPURZLCmEMcc', 'CSE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD UNIQUE KEY `qs` (`qs`),
  ADD KEY `quizid` (`quizid`),
  ADD KEY `quizid_2` (`quizid`),
  ADD KEY `quizid_3` (`quizid`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quizid`),
  ADD KEY `mail` (`mail`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `quizid` (`quizid`),
  ADD KEY `mail` (`mail`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`mail`),
  ADD UNIQUE KEY `mail` (`mail`,`phno`),
  ADD UNIQUE KEY `staffid` (`staffid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`mail`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `phno` (`phno`),
  ADD UNIQUE KEY `usn` (`usn`),
  ADD KEY `dept` (`dept`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quizid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

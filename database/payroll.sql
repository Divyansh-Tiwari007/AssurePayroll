SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `allowances` (
  `id` int(30) NOT NULL,
  `allowance` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `allowances` (`id`, `allowance`, `description`) VALUES
(6, 'House Rent Allowance', '(Sec. 10(13A) & Rule 2A)'),
(7, 'Children Education Allowance', 'Up to Rs. 100 per month per child up to a maximum of 2 children is exempt'),
(8, 'Transport Allowance', 'expenditure for the purpose of commuting between place of residence and place of duty'),
(9, 'Research Allowance', 'encouraging the academic research and other professional pursuits'),
(10, 'Motor Car / Other Conveyance', 'Section 17(2) with Rule 3(2)'),
(11, 'Travelling & Touring accommodation', 'for  employee or any member of his household for any holiday'),
(12, 'Gift or Voucher or Coupon', 'ceremonial occasions'),
(13, 'Free Recreation/ Club Facilities', 'club facilities for the official purposes are exempt from tax'),
(14, 'Medical facilities', 'medical treatment of the employee or his family'),
(15, 'Pension', 'Allowances provided to retired person\r\n'),
(16, 'Employee’s Provident Fund', 'Employee gratuity and provident funds');

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN,2 = AM out, 3= PM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `attendance` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`) VALUES
(10, 9, 1, '2020-09-16 08:00:00', '2020-09-29 16:16:57'),
(11, 9, 2, '2020-09-16 12:00:00', '2020-09-29 16:16:57'),
(12, 9, 3, '2020-09-16 13:00:00', '2020-09-29 16:16:57'),
(16, 9, 4, '2020-09-16 17:00:00', '2020-09-29 16:16:57'),
(17, 10, 1, '2023-01-01 14:23:00', '2023-01-04 14:23:25'),
(18, 10, 2, '2023-01-01 19:00:00', '2023-01-04 14:23:50'),
(19, 11, 1, '2023-01-21 10:00:00', '2023-01-21 10:09:51'),
(20, 11, 2, '2023-01-21 13:00:00', '2023-01-21 10:10:13'),
(25, 30, 1, '2023-01-01 09:00:00', '2023-01-30 21:46:22'),
(26, 30, 4, '2023-01-01 16:00:00', '2023-01-30 21:46:22'),
(27, 43, 1, '2023-01-01 10:00:00', '2023-01-30 21:47:45'),
(28, 43, 4, '2023-01-01 15:00:00', '2023-01-30 21:47:45'),
(29, 44, 1, '2023-01-01 06:00:00', '2023-01-30 23:45:24'),
(30, 44, 4, '2023-01-01 02:00:00', '2023-01-30 23:45:24'),
(33, 0, 0, '1970-01-01 01:00:00', '2023-01-30 23:45:24'),
(34, 28, 1, '2023-01-01 10:00:00', '2023-01-30 23:45:24'),
(35, 28, 4, '2023-01-01 04:00:00', '2023-01-30 23:45:24'),
(36, 28, 1, '2023-01-01 08:00:00', '2023-01-30 23:50:10'),
(37, 28, 4, '2023-01-01 13:00:00', '2023-01-30 23:50:10'),
(38, 32, 1, '2023-01-01 10:00:00', '2023-01-30 23:50:10'),
(39, 32, 4, '2023-01-01 04:00:00', '2023-01-30 23:50:11'),
(40, 27, 1, '2023-01-01 08:00:00', '2023-01-30 23:50:11'),
(41, 27, 4, '2023-01-01 02:00:00', '2023-01-30 23:50:11'),
(42, 33, 1, '2023-01-01 08:00:00', '2023-01-30 23:50:11'),
(43, 33, 4, '2023-01-01 02:00:00', '2023-01-30 23:50:11');

CREATE TABLE `deductions` (
  `id` int(30) NOT NULL,
  `deduction` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `deductions` (`id`, `deduction`, `description`) VALUES
(5, 'Medical Expenditure and Insurance Premium', 'Section 80D is a deduction you can claim on medical expenses of upto Rs. 50,000'),
(6, 'Interest on Home Loan', ' (Section 80C and Section 24) provides claim up to Rs. 2 lakh as a deduction for interest on home loan'),
(7, 'Deduction for Loan for Higher Studies ', '(Section 80E)\r\nIncome Tax Act provides a deduction for interest on education loans'),
(8, 'Donations', 'Section 80G offers deduction to an assessee, who makes donations to charitable organizations'),
(9, 'Overtime pay', 'overtime pay for the nonexempt employees is 1.5 times their regular pay rate');

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'Accounts Department'),
(2, 'Administrative Department'),
(3, 'Customer Service Department'),
(4, 'Finance Department\r\n'),
(5, 'HR Department'),
(6, 'IT Department'),
(7, 'Marketing & Sales Department\r\n\r\n'),
(8, 'Project Management Department'),
(9, 'R&D Department');

CREATE TABLE `employee` (
  `id` int(20) NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department_id` int(30) NOT NULL,
  `position_id` int(30) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `employee` (`id`, `employee_no`, `firstname`, `middlename`, `lastname`, `department_id`, `position_id`, `salary`) VALUES
(1, '2023-3689', 'RAM ', 'PRAVESH ', 'MISHRA', 1, 27, 50000),
(2, '2023-213', 'SUBODH', 'KUMAR', 'SRIVASTAV', 1, 28, 40000),
(15, '2023-8200', 'RAVI', 'PRATAP ', 'SINGH', 1, 30, 35000),
(16, '2023-8726', 'ANIL', 'SINGH ', 'NEGI', 1, 26, 45000),
(17, '2023-7143', 'KIRAN', 'BALA', 'KUMARI', 1, 29, 60000),
(18, '2023-9681', 'SATYPAL', 'KUMAR ', 'YADAV', 2, 32, 30000),
(19, '2023-5888', 'RAJNISH', 'SINGH ', 'SAINI', 2, 35, 70000),
(20, '2023-9877', 'BALDEV', 'RAJ', 'THAKUR', 2, 31, 60000),
(21, '2023-6274', 'VIMAL ', 'KUMAR', 'CHAURASIA', 2, 33, 30000),
(22, '2023-2885', 'MS', 'SEEMA ', 'TYAGI', 2, 34, 60000),
(23, '2023-6505', 'GOVIND ', 'KUMAR', 'VERMA', 3, 23, 70000),
(24, '2023-2884', 'OM', 'PRAKASH', 'PANDEY ', 3, 24, 50000),
(25, '2023-5340', 'MOHAN', 'KANT', 'TIWARI', 3, 21, 30000),
(26, '2023-4321', 'NEERAJ', 'PRAKASH', 'SHARMA', 3, 25, 70000),
(27, '2023-8547', 'SIDDHANT', 'S', 'CHAUHAN', 4, 36, 100000),
(28, '2023-2294', 'KANCHANA', 'M', 'CHAUDHARY', 4, 37, 80000),
(29, '2023-7476', 'HEM', 'CHANDEL ', 'THAKUR', 4, 40, 90000),
(30, '2023-5339', 'NIRMAL ', 'KUMAR ', 'BIST', 5, 13, 100000),
(31, '2023-7230', 'REGINA ', 'V.', 'TOPPO', 5, 17, 60000),
(32, '2023-6118', 'RAKESH', 'SINGH ', 'CHAUHAN', 5, 14, 50000),
(33, '2023-1190', 'NAVEEN', 'SINGH', 'GEHLOT', 6, 7, 120000),
(34, '2023-5229', 'KAMAL', 'KUMAR', 'PANDEY', 6, 8, 90000),
(35, '2023-5298', 'Divyansh', '', 'Tiwari', 6, 10, 100000),
(36, '2023-8558', 'DHARMENDRA', 'M', 'NANADWAR', 7, 41, 80000),
(37, '2023-7350', 'AMARJEET', 'KAUR', 'SINGH', 7, 42, 100000);


CREATE TABLE `employee_allowances` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `allowance_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(6, 11, 3, 1, 10000, '0000-00-00', '2023-01-21 08:33:39'),
(8, 10, 4, 1, 20000, '0000-00-00', '2023-01-21 08:45:10'),
(9, 11, 2, 1, 3000, '0000-00-00', '2023-01-21 10:18:59'),
(10, 10, 2, 1, 2000, '0000-00-00', '2023-01-21 10:19:57'),
(11, 33, 7, 1, 1000, '0000-00-00', '2023-01-30 23:54:24'),
(12, 33, 6, 1, 2000, '0000-00-00', '2023-01-30 23:54:24'),
(13, 33, 10, 1, 500, '0000-00-00', '2023-01-30 23:54:24'),
(14, 33, 11, 1, 1000, '0000-00-00', '2023-01-30 23:54:24');


CREATE TABLE `employee_deductions` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `deduction_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(4, 10, 1, 1, 5000, '0000-00-00', '2023-01-21 08:43:05'),
(7, 33, 7, 3, 6000, '2023-01-10', '2023-01-30 23:57:14'),
(8, 33, 5, 3, 3500, '2023-01-15', '2023-01-30 23:57:14');


CREATE TABLE `payroll` (
  `id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = monthly ,2 semi-monthly',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =New,1 = computed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `payroll` (`id`, `ref_no`, `date_from`, `date_to`, `type`, `status`, `date_created`) VALUES
(3, '2023-2645', '2023-01-01', '2023-01-31', 1, 1, '2023-01-30 21:39:55'),
(5, '2023-5939', '2023-01-01', '2023-01-16', 2, 1, '2023-01-30 21:41:57');


CREATE TABLE `payroll_items` (
  `id` int(30) NOT NULL,
  `payroll_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `present` int(30) NOT NULL,
  `absent` int(10) NOT NULL,
  `late` text NOT NULL,
  `salary` double NOT NULL,
  `allowance_amount` double NOT NULL,
  `allowances` text NOT NULL,
  `deduction_amount` double NOT NULL,
  `deductions` text NOT NULL,
  `net` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `payroll_items` (`id`, `payroll_id`, `employee_id`, `present`, `absent`, `late`, `salary`, `allowance_amount`, `allowances`, `deduction_amount`, `deductions`, `net`, `date_created`) VALUES
(31, 1, 10, 0, 11, '0', 200000, 0, '[]', 0, '[]', 0, '2023-01-21 09:01:48'),
(32, 1, 11, 0, 11, '0', 49231, 0, '[]', 2000, '[{\"did\":\"4\",\"amount\":\"2000\"}]', -2000, '2023-01-21 09:01:48'),
(43, 2, 10, 0, 22, '0', 200000, 22000, '[{\"aid\":\"4\",\"amount\":\"20000\"},{\"aid\":\"2\",\"amount\":\"2000\"}]', 5000, '[{\"did\":\"1\",\"amount\":\"5000\"}]', 17000, '2023-01-21 10:23:52'),
(44, 2, 11, 0, 22, '0', 50231, 13000, '[{\"aid\":\"3\",\"amount\":\"10000\"},{\"aid\":\"2\",\"amount\":\"3000\"}]', 0, '[]', 13000, '2023-01-21 10:23:52'),
(45, 4, 1, 0, 11, '0', 50000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(46, 4, 2, 0, 11, '0', 40000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(47, 4, 15, 0, 11, '0', 35000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(48, 4, 16, 0, 11, '0', 45000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(49, 4, 17, 0, 11, '0', 60000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(50, 4, 18, 0, 11, '0', 30000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(51, 4, 19, 0, 11, '0', 70000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(52, 4, 20, 0, 11, '0', 60000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(53, 4, 21, 0, 11, '0', 30000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(54, 4, 22, 0, 11, '0', 60000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(55, 4, 23, 0, 11, '0', 70000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(56, 4, 24, 0, 11, '0', 50000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(57, 4, 25, 0, 11, '0', 30000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(58, 4, 26, 0, 11, '0', 70000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(59, 4, 27, 0, 11, '0', 100000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(60, 4, 28, 0, 11, '0', 80000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(61, 4, 29, 0, 11, '0', 90000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(62, 4, 30, 0, 11, '0', 100000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(63, 4, 31, 0, 11, '0', 60000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(64, 4, 32, 0, 11, '0', 50000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32'),
(65, 4, 33, 0, 11, '0', 120000, 0, '[]', 0, '[]', 0, '2023-01-30 21:40:32');


CREATE TABLE `position` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `position` (`id`, `department_id`, `name`) VALUES
(1, 6, 'System Engineere'),
(7, 6, 'IT Director'),
(8, 6, 'Software Engineer'),
(9, 6, 'Network Engineer'),
(10, 6, 'Security Engineer'),
(13, 5, 'Chief Human Resource Officer'),
(14, 5, 'HR Administrator'),
(16, 5, 'HR Analyst'),
(17, 5, 'Recruitment Manager'),
(18, 5, 'HR Manager'),
(21, 3, 'Customer Service Representative'),
(22, 3, 'Customer Service Specialist'),
(23, 3, 'Chief Customer Officer'),
(24, 3, 'Customer Experience Manager'),
(25, 3, 'Multilingual Customer Support Specialist'),
(26, 1, 'Staff Accountant'),
(27, 1, 'Accounting Clerk'),
(28, 1, 'Auditor'),
(29, 1, 'Tax Accountant'),
(30, 1, 'Bookkeeper'),
(31, 2, 'Office Managers'),
(32, 2, 'Administrative Assistants'),
(33, 2, 'General Office Clerks'),
(34, 2, 'Secretaries'),
(35, 2, 'Departmental Managers\r\n');


CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'ADMIN', 'Admin@123', 1),
(2, 0, 'DIVYANSH TIWARI', '', '', 'DIVYANSH', 'Divyansh@123', 2),
(3, 0, 'NAVEEN SINGH GEHLOT', '', '', 'NAVEEN', 'Naveen@123', 2),
(4, 0, 'MS SEEMA TYAGI', '', '', 'SEEMA', 'Seema@123', 2),
(5, 0, 'LUCAS RATAN BIRLA', '', '', 'LUCAS', 'Lucas@123', 2);

ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `employee_allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `employee_deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `payroll`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `payroll_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `position`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

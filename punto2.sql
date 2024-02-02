-- 1) ---------------------------------------------------

CREATE TABLE `administrators` (
  `admin_id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `hire_date` date DEFAULT NULL,
  `department` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `administrators`
--

INSERT INTO `administrators` (`admin_id`, `first_name`, `last_name`, `hire_date`, `department`) VALUES
(1, 'John', 'Doe', '2022-01-01', 'Administration'),
(2, 'Alice', 'Smith', '2022-02-15', 'HR'),
(3, 'Bob', 'Johnson', '2022-03-10', 'Finance');


-- Estructura de tabla para la tabla `courses`
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` text NOT NULL,
  `course_description` text DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcado de datos para la tabla `courses`
INSERT INTO `courses` (`course_id`, `course_name`, `course_description`) VALUES
(101, 'Introduction to Programming', 'Fundamentals of programming and coding'),
(102, 'Calculus I', 'Basic calculus concepts and applications'),
(103, 'Physics for Engineers', 'Principles of physics for engineering students');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `professors`
--

CREATE TABLE `professors` (
  `professor_id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `hire_date` date DEFAULT NULL,
  `department` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `professors`
--

INSERT INTO `professors` (`professor_id`, `first_name`, `last_name`, `hire_date`, `department`) VALUES
(101, 'Michael', 'Brown', '2021-12-01', 'Computer Science'),
(102, 'Emily', 'Taylor', '2022-01-20', 'Mathematics'),
(103, 'David', 'Anderson', '2022-02-28', 'Physics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `age` int(11) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `students`
--


-- Volcado de datos para la tabla `students`
INSERT INTO `students` (`student_id`, `name`, `age`, `email`, `course_id`) VALUES
(10001, 'Sarah Johnson', 20, 'sarah@email.com', (SELECT `course_id` FROM `courses` WHERE `course_name` = 'Introduction to Programming')),
(10002, 'Alex Rodriguez', 22, 'alex@email.com', (SELECT `course_id` FROM `courses` WHERE `course_name` = 'Calculus I')),
(10003, 'Emma White', 21, 'emma@email.com', (SELECT `course_id` FROM `courses` WHERE `course_name` = 'Physics for Engineers')),
(10004, 'Daniel Smith', 23, 'daniel@email.com', (SELECT `course_id` FROM `courses` WHERE `course_name` = 'Introduction to Programming')),
(10005, 'Olivia Brown', 19, 'olivia@email.com', (SELECT `course_id` FROM `courses` WHERE `course_name` = 'Calculus I'));

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indices de la tabla `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`professor_id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;



-- 2) ---------------------------------------------------

-- Inner Join entre estudiantes y cursos
SELECT 
    students.name AS student_name,
    students.age,
    courses.course_name AS course_name
FROM students
INNER JOIN courses ON students.course_id = courses.course_id;

-- Left Join entre profesores y estudiantes
SELECT 
    professors.first_name AS professor_first_name,
    professors.last_name AS professor_last_name,
    students.name AS student_name
FROM professors
LEFT JOIN students ON professors.professor_id = students.course_id;

-- Cross Join entre profesores y estudiantes
SELECT 
    professors.first_name AS professor_first_name,
    professors.last_name AS professor_last_name,
    students.name AS student_name
FROM professors
CROSS JOIN students;

-- Seleccionar todos los campos de la tabla "administrators"
-- y los campos correspondientes de la tabla "professors"
-- donde hay coincidencias en la columna "admin_id" y "professor_id" respectivamente.
SELECT *
FROM administrators
INNER JOIN professors ON administrators.admin_id = professors.professor_id

-- Combinar los resultados con la siguiente consulta utilizando UNION.

-- Seleccionar todos los campos de la tabla "professors"
-- y los campos correspondientes de la tabla "administrators"
-- donde hay coincidencias en la columna "professor_id" y "admin_id" respectivamente.
UNION

-- Seleccionar todos los campos de la tabla "administrators"
-- y los campos correspondientes de la tabla "professors"
-- donde hay coincidencias en la columna "admin_id" y "professor_id" respectivamente.
-- Utilizando RIGHT JOIN, se incluirán todos los registros de "professors"
-- y los registros correspondientes de "administrators" que tienen coincidencias en "professor_id".
SELECT *
FROM administrators
RIGHT JOIN professors ON administrators.admin_id = professors.professor_id;

-- 3) --------------------------------------------------- 

-- Traer los administradores con ese identificador
SELECT * FROM `administrators` WHERE `admin_id` = 1;

-- Traer los estudiantes que tengan una "s" en su nombre
SELECT * FROM `students` WHERE `name` LIKE '%s%';

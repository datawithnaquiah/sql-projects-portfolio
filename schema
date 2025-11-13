CREATE DATABASE SCM_System_db;
USE SCM_System_db;

CREATE TABLE Students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  major VARCHAR(50)
);

CREATE TABLE Courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  credits INT
);

CREATE TABLE Enrollments (
  student_id INT,
  course_id INT,
  grade CHAR(2),
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Attendance (
  attendance_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  course_id INT,
  attendance_date DATE,
  status ENUM('Present', 'Absent'),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Database
CREATE DATABASE library_management;
USE library_management;

-- Table for Librarians
CREATE TABLE Librarians (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Table for Members (Library Users)
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Table for Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year YEAR NOT NULL,
    is_available BOOLEAN DEFAULT TRUE
);

-- Table for Loans
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    librarian_id INT NOT NULL,
    date_borrowed DATE NOT NULL,
    date_returned DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
);

-- Insert sample Librarians
INSERT INTO Librarians (name, email) VALUES
('Alice Johnson', 'alice.johnson@library.com'),
('David Smith', 'david.smith@library.com');

-- Insert sample Members
INSERT INTO Members (name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Brown', 'jane.brown@example.com'),
('Michael Green', 'michael.green@example.com');

-- Insert sample Books
INSERT INTO Books (title, author, published_year) VALUES
('Introduction to Databases', 'C. J. Date', 2019),
('Database Management Systems', 'Raghu Ramakrishnan', 2018),
('SQL for Beginners', 'Mark Spencer', 2021),
('Library Science Fundamentals', 'Anne White', 2017);

-- Insert sample Loans
INSERT INTO Loans (book_id, member_id, librarian_id, date_borrowed, date_returned) VALUES
(1, 1, 1, '2025-09-01', '2025-09-10'),
(2, 2, 2, '2025-09-05', NULL), -- Not yet returned
(3, 3, 1, '2025-09-07', '2025-09-15');

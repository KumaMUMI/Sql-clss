CREATE DATABASE student;

USE student;

CREATE TABLE faculty(
    fid CHARACTER(15) not null,
    fname VARCHAR(15),
    flocation VARCHAR(40),
    PRIMARY KEY (fid)
);

CREATE TABLE student (
    sid CHARACTER(15) not null,
    fname VARCHAR(15) not null,
    lname VARCHAR(15) not null,
    dob date ,
    sex CHAR(1) not null,
    tel TEXT not null,
    fid CHARACTER(15) not NULL,
    PRIMARY KEY(sid),
    foreign KEY(fid) REFERENCES faculty(fid)
);
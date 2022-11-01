CREATE DATABASE ship;

USE ship;

CREATE TABLE state(
	scname CHARACTER(30) not null,
    continent VARCHAR(30) not null,
    PRIMARY KEY (scname)
);

CREATE TABLE sea(
    sol_name CHARACTER(30) not null,
    PRIMARY KEY (sol_name)
);

CREATE TABLE port(
	scname CHARACTER(30) not null,
    sol_name CHARACTER(30) not null,
    pname CHARACTER(30) not null,
    PRIMARY KEY (pname),
    FOREIGN KEY (scname) REFERENCES state(scname),
    FOREIGN KEY (sol_name) REFERENCES sea (sol_name)
);

CREATE TABLE ship_type(
	type CHARACTER(30) not null,
    tonnage text(30) not null,
    hull text(30) not null,
    PRIMARY KEY (type)
);

CREATE TABLE ship(
	sname CHARACTER(30) not null,
    owner VARCHAR(30) not null,
    type CHARACTER(30) not null,
    sol_name CHARACTER(30) not null,
    scname CHARACTER(30) not null,
    pname CHARACTER(30) not null,
    PRIMARY KEY (sname),
    FOREIGN KEY (type) REFERENCES ship_type(type),
    FOREIGN KEY (sol_name) REFERENCES sea(sol_name),
    FOREIGN KEY (scname) REFERENCES state(scname),
    FOREIGN KEY (pname) REFERENCES port(pname)
);

CREATE TABLE time_stamp(
    t_stamp CHARACTER(30) not null,
    date date,
    time text(8),
    PRIMARY KEY(t_stamp)
);

CREATE TABLE ship_movement(
	s_move CHARACTER(30) not null,
    sname CHARACTER(30),
    t_stamp CHARACTER(30) not null,
    longitude text(30) not null,
    lagitude text(30) not null,
    PRIMARY KEY(s_move),
    FOREIGN KEY(sname) REFERENCES ship(sname),
    FOREIGN KEY(t_stamp) REFERENCES time_stamp(t_stamp)
);
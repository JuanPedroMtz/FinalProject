-- Create Tables
--Creating tables for Final Project

CREATE TABLE productos_clean (
    Product_ID INTEGER PRIMARY KEY,
    Description VARCHAR(255),
    categ_id VARCHAR(255)
);

CREATE TABLE almacenes_dimovil (
    name VARCHAR(255)PRIMARY KEY,
    create_uid VARCHAR (255)
);

CREATE TABLE ventas_contado_devices (
    id INTEGER,
    date date, 
    Product_ID INTEGER,
    Description VARCHAR(255),
    qty FLOAT,
    create_uid VARCHAR (255),
    price_unit FLOAT,
    price_subtotal FLOAT,
    PRIMARY KEY (id)
);

CREATE TABLE ventas_linea_device (
    id INTEGER,
    date date,
    Product_ID INTEGER,
    Description VARCHAR(255),
    qty FLOAT,
    create_uid VARCHAR (255),
    price_unit FLOAT,
    price_subtotal FLOAT,
	PRIMARY KEY (id)
);

DROP TABLE almacenes_dimovil
DROP TABLE ventas_linea_device
DROP TABLE ventas_linea_contado_devices
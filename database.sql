CREATE TABLE products_clean (
 Product_ID INT PRIMARY KEY NOT NULL
);

CREATE TABLE ventas_linea_contado_devices (
 id INT PRIMARY KEY NOT NULL,
 Product_ID INT NOT NULL,
 order_id 	INT,
	qty INT, 
	create_uid INT,
	price_unit FLOAT,
	price_subtotal FLOAT,
 FOREIGN KEY (Product_ID) REFERENCES products_clean (Product_ID)
);


select * from products_clean
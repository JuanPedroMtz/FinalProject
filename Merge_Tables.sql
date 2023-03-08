--Merge of productos_clean, ventas_linea_device and almacenes_dimovil
SELECT pc.product_id, vld.description, vld.date, aldi.name, vld.qty, vld.price_unit
INTO db_almacenes_ventas_linea
FROM productos_clean as pc
inner join ventas_linea_device as vld
on pc.product_id = vld.product_id
inner join almacenes_dimovil as aldi
on vld.create_uid = aldi.create_uid;

DELETE FROM db_almacenes_ventas_linea
WHERE (qty <= 0);

SELECT * FROM db_almacenes_ventas_linea;

-- Merge of productos_clean, ventas_linea_contado_devices and almacenes_dimovil
SELECT pc.product_id, vcd.description, vcd.date, aldi.name, vcd.qty, vcd.price_unit
INTO db_almacenes_ventas_contado
FROM productos_clean as pc
inner join ventas_contado_devices as vcd
on pc.product_id = vcd.product_id
inner join almacenes_dimovil as aldi
on vcd.create_uid = aldi.create_uid;

DELETE FROM db_almacenes_ventas_contado
WHERE (qty <= 0);

SELECT * FROM db_almacenes_ventas_contado;


-- Merge db_almacenes_ventas_linea and db_almacenes_ventas_contado
SELECT *
into db_almacenes_ventas
FROM db_almacenes_ventas_linea;

INSERT INTO db_almacenes_ventas
SELECT * FROM db_almacenes_ventas_contado;

SELECT * FROM db_almacenes_ventas;
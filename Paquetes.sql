@ -1,359 +0,0 @@

CREATE OR REPLACE PACKAGE usuarios_pkg AS
  PROCEDURE agregar_usuario(p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE actualizar_usuario(p_id_usuario IN NUMBER, p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER);
  FUNCTION obtener_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2;
END usuarios_pkg;
/
CREATE OR REPLACE PACKAGE BODY productos_pkg AS
  PROCEDURE agregar_producto(p_nombre IN VARCHAR2, p_descripcion IN CLOB, p_stock IN NUMBER, p_precio IN NUMBER, p_id_proveedor IN NUMBER) IS
  BEGIN
    INSERT INTO productos (ID_Producto, Nombre, Descripcion, Stock, Precio, ID_Proveedor)
    VALUES (seq_productos.NEXTVAL, p_nombre, p_descripcion, p_stock, p_precio, p_id_proveedor);
  END agregar_producto;

  PROCEDURE actualizar_producto(p_id_producto IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN CLOB, p_stock IN NUMBER, p_precio IN NUMBER) IS
  BEGIN
    UPDATE productos
    SET Nombre = p_nombre, Descripcion = p_descripcion, Stock = p_stock, Precio = p_precio
    WHERE ID_Producto = p_id_producto;
  END actualizar_producto;

  PROCEDURE eliminar_producto(p_id_producto IN NUMBER) IS
  BEGIN
    DELETE FROM productos WHERE ID_Producto = p_id_producto;
  END eliminar_producto;

  FUNCTION obtener_producto(p_id_producto IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM productos WHERE ID_Producto = p_id_producto;
    RETURN v_nombre;
  END obtener_producto;
END productos_pkg;
/


CREATE OR REPLACE PACKAGE usuarios_pkg AS
  PROCEDURE agregar_usuario(p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE actualizar_usuario(p_id_usuario IN NUMBER, p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER);
  FUNCTION obtener_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2;
END usuarios_pkg;
/
CREATE OR REPLACE PACKAGE BODY usuarios_pkg AS
  PROCEDURE agregar_usuario(p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    INSERT INTO usuarios (ID_Usuario, Nombre, Email, Telefono)
    VALUES (seq_usuarios.NEXTVAL, p_nombre, p_email, p_telefono);
  END agregar_usuario;

  PROCEDURE actualizar_usuario(p_id_usuario IN NUMBER, p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    UPDATE usuarios
    SET Nombre = p_nombre, Email = p_email, Telefono = p_telefono
    WHERE ID_Usuario = p_id_usuario;
  END actualizar_usuario;

  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER) IS
  BEGIN
    DELETE FROM usuarios WHERE ID_Usuario = p_id_usuario;
  END eliminar_usuario;

  FUNCTION obtener_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM usuarios WHERE ID_Usuario = p_id_usuario;
    RETURN v_nombre;
  END obtener_usuario;
END usuarios_pkg;
/

CREATE OR REPLACE PACKAGE proveedores_pkg AS
  PROCEDURE agregar_proveedor(p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE actualizar_proveedor(p_id_proveedor IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE eliminar_proveedor(p_id_proveedor IN NUMBER);
  FUNCTION obtener_proveedor(p_id_proveedor IN NUMBER) RETURN VARCHAR2;
END proveedores_pkg;
/
CREATE OR REPLACE PACKAGE BODY proveedores_pkg AS
  PROCEDURE agregar_proveedor(p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    INSERT INTO proveedores (ID_Proveedor, Nombre, Direccion, Telefono)
    VALUES (seq_proveedores.NEXTVAL, p_nombre, p_direccion, p_telefono);
  END agregar_proveedor;

  PROCEDURE actualizar_proveedor(p_id_proveedor IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    UPDATE proveedores
    SET Nombre = p_nombre, Direccion = p_direccion, Telefono = p_telefono
    WHERE ID_Proveedor = p_id_proveedor;
  END actualizar_proveedor;

  PROCEDURE eliminar_proveedor(p_id_proveedor IN NUMBER) IS
  BEGIN
    DELETE FROM proveedores WHERE ID_Proveedor = p_id_proveedor;
  END eliminar_proveedor;

  FUNCTION obtener_proveedor(p_id_proveedor IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM proveedores WHERE ID_Proveedor = p_id_proveedor;
    RETURN v_nombre;
  END obtener_proveedor;
END proveedores_pkg;
/


CREATE OR REPLACE PACKAGE usuarios_pkg AS
  PROCEDURE agregar_usuario(p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE actualizar_usuario(p_id_usuario IN NUMBER, p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER);
  FUNCTION obtener_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2;
END usuarios_pkg;
/

CREATE OR REPLACE PACKAGE BODY usuarios_pkg AS
  PROCEDURE agregar_usuario(p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    INSERT INTO usuarios (ID_Usuario, Nombre, Email, Telefono)
    VALUES (seq_usuarios.NEXTVAL, p_nombre, p_email, p_telefono);
  END agregar_usuario;

  PROCEDURE actualizar_usuario(p_id_usuario IN NUMBER, p_nombre IN VARCHAR2, p_email IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    UPDATE usuarios
    SET Nombre = p_nombre, Email = p_email, Telefono = p_telefono
    WHERE ID_Usuario = p_id_usuario;
  END actualizar_usuario;

  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER) IS
  BEGIN
    DELETE FROM usuarios WHERE ID_Usuario = p_id_usuario;
  END eliminar_usuario;

  FUNCTION obtener_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM usuarios WHERE ID_Usuario = p_id_usuario;
    RETURN v_nombre;
  END obtener_usuario;
END usuarios_pkg;
/

CREATE OR REPLACE PACKAGE mascotas_pkg AS
  PROCEDURE agregar_mascota(p_nombre IN VARCHAR2, p_raza IN VARCHAR2, p_edad IN NUMBER, p_id_cliente IN NUMBER);
  PROCEDURE actualizar_mascota(p_id_mascota IN NUMBER, p_nombre IN VARCHAR2, p_raza IN VARCHAR2, p_edad IN NUMBER);
  PROCEDURE eliminar_mascota(p_id_mascota IN NUMBER);
  FUNCTION obtener_mascota(p_id_mascota IN NUMBER) RETURN VARCHAR2;
END mascotas_pkg;
/

CREATE OR REPLACE PACKAGE BODY mascotas_pkg AS
  PROCEDURE agregar_mascota(p_nombre IN VARCHAR2, p_raza IN VARCHAR2, p_edad IN NUMBER, p_id_cliente IN NUMBER) IS
  BEGIN
    INSERT INTO mascota (ID_Mascota, Nombre, Raza, Edad, ID_Cliente)
    VALUES (seq_mascota.NEXTVAL, p_nombre, p_raza, p_edad, p_id_cliente);
  END agregar_mascota;

  PROCEDURE actualizar_mascota(p_id_mascota IN NUMBER, p_nombre IN VARCHAR2, p_raza IN VARCHAR2, p_edad IN NUMBER) IS
  BEGIN
    UPDATE mascota
    SET Nombre = p_nombre, Raza = p_raza, Edad = p_edad
    WHERE ID_Mascota = p_id_mascota;
  END actualizar_mascota;

  PROCEDURE eliminar_mascota(p_id_mascota IN NUMBER) IS
  BEGIN
    DELETE FROM mascota WHERE ID_Mascota = p_id_mascota;
  END eliminar_mascota;

  FUNCTION obtener_mascota(p_id_mascota IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM mascota WHERE ID_Mascota = p_id_mascota;
    RETURN v_nombre;
  END obtener_mascota;
END mascotas_pkg;
/

CREATE OR REPLACE PACKAGE servicios_pkg AS
  PROCEDURE agregar_servicio(p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_precio IN NUMBER);
  PROCEDURE actualizar_servicio(p_id_servicio IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_precio IN NUMBER);
  PROCEDURE eliminar_servicio(p_id_servicio IN NUMBER);
  FUNCTION obtener_servicio(p_id_servicio IN NUMBER) RETURN VARCHAR2;
END servicios_pkg;
/

CREATE OR REPLACE PACKAGE BODY servicios_pkg AS
  PROCEDURE agregar_servicio(p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_precio IN NUMBER) IS
  BEGIN
    INSERT INTO servicios (ID_Servicio, Nombre, Descripcion, Precio)
    VALUES (seq_servicios.NEXTVAL, p_nombre, p_descripcion, p_precio);
  END agregar_servicio;

  PROCEDURE actualizar_servicio(p_id_servicio IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_precio IN NUMBER) IS
  BEGIN
    UPDATE servicios
    SET Nombre = p_nombre, Descripcion = p_descripcion, Precio = p_precio
    WHERE ID_Servicio = p_id_servicio;
  END actualizar_servicio;

  PROCEDURE eliminar_servicio(p_id_servicio IN NUMBER) IS
  BEGIN
    DELETE FROM servicios WHERE ID_Servicio = p_id_servicio;
  END eliminar_servicio;

  FUNCTION obtener_servicio(p_id_servicio IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM servicios WHERE ID_Servicio = p_id_servicio;
    RETURN v_nombre;
  END obtener_servicio;
END servicios_pkg;
/

CREATE OR REPLACE PACKAGE citas_pkg AS
  PROCEDURE agregar_cita(p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_servicio IN NUMBER);
  PROCEDURE actualizar_cita(p_id_cita IN NUMBER, p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_servicio IN NUMBER);
  PROCEDURE eliminar_cita(p_id_cita IN NUMBER);
  FUNCTION obtener_cita(p_id_cita IN NUMBER) RETURN VARCHAR2;
END citas_pkg;
/

CREATE OR REPLACE PACKAGE BODY citas_pkg AS
  PROCEDURE agregar_cita(p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_servicio IN NUMBER) IS
  BEGIN
    INSERT INTO citas (ID_Cita, Fecha, ID_Cliente, ID_Servicio)
    VALUES (seq_citas.NEXTVAL, p_fecha, p_id_cliente, p_id_servicio);
  END agregar_cita;

  PROCEDURE actualizar_cita(p_id_cita IN NUMBER, p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_servicio IN NUMBER) IS
  BEGIN
    UPDATE citas
    SET Fecha = p_fecha, ID_Cliente = p_id_cliente, ID_Servicio = p_id_servicio
    WHERE ID_Cita = p_id_cita;
  END actualizar_cita;

  PROCEDURE eliminar_cita(p_id_cita IN NUMBER) IS
  BEGIN
    DELETE FROM citas WHERE ID_Cita = p_id_cita;
  END eliminar_cita;

  FUNCTION obtener_cita(p_id_cita IN NUMBER) RETURN VARCHAR2 IS
    v_fecha DATE;
  BEGIN
    SELECT Fecha INTO v_fecha FROM citas WHERE ID_Cita = p_id_cita;
    RETURN TO_CHAR(v_fecha, 'YYYY-MM-DD');
  END obtener_cita;
END citas_pkg;
/

CREATE OR REPLACE PACKAGE clientes_pkg AS
  PROCEDURE agregar_cliente(p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE actualizar_cliente(p_id_cliente IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2);
  PROCEDURE eliminar_cliente(p_id_cliente IN NUMBER);
  FUNCTION obtener_cliente(p_id_cliente IN NUMBER) RETURN VARCHAR2;
END clientes_pkg;
/

CREATE OR REPLACE PACKAGE BODY clientes_pkg AS
  PROCEDURE agregar_cliente(p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    INSERT INTO clientes (ID_Cliente, Nombre, Direccion, Telefono)
    VALUES (seq_clientes.NEXTVAL, p_nombre, p_direccion, p_telefono);
  END agregar_cliente;

  PROCEDURE actualizar_cliente(p_id_cliente IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    UPDATE clientes
    SET Nombre = p_nombre, Direccion = p_direccion, Telefono = p_telefono
    WHERE ID_Cliente = p_id_cliente;
  END actualizar_cliente;

  PROCEDURE eliminar_cliente(p_id_cliente IN NUMBER) IS
  BEGIN
    DELETE FROM clientes WHERE ID_Cliente = p_id_cliente;
  END eliminar_cliente;

  FUNCTION obtener_cliente(p_id_cliente IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    SELECT Nombre INTO v_nombre FROM clientes WHERE ID_Cliente = p_id_cliente;
    RETURN v_nombre;
  END obtener_cliente;
END clientes_pkg;
/

CREATE OR REPLACE PACKAGE ventas_pkg AS
  PROCEDURE agregar_venta(p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_producto IN NUMBER, p_cantidad IN NUMBER);
  PROCEDURE actualizar_venta(p_id_venta IN NUMBER, p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_producto IN NUMBER, p_cantidad IN NUMBER);
  PROCEDURE eliminar_venta(p_id_venta IN NUMBER);
  FUNCTION obtener_venta(p_id_venta IN NUMBER) RETURN VARCHAR2;
END ventas_pkg;
/

CREATE OR REPLACE PACKAGE BODY ventas_pkg AS
  PROCEDURE agregar_venta(p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_producto IN NUMBER, p_cantidad IN NUMBER) IS
  BEGIN
    INSERT INTO ventas (ID_Venta, Fecha, ID_Cliente, ID_Producto, Cantidad)
    VALUES (seq_ventas.NEXTVAL, p_fecha, p_id_cliente, p_id_producto, p_cantidad);
  END agregar_venta;

  PROCEDURE actualizar_venta(p_id_venta IN NUMBER, p_fecha IN DATE, p_id_cliente IN NUMBER, p_id_producto IN NUMBER, p_cantidad IN NUMBER) IS
  BEGIN
    UPDATE ventas
    SET Fecha = p_fecha, ID_Cliente = p_id_cliente, ID_Producto = p_id_producto, Cantidad = p_cantidad
    WHERE ID_Venta = p_id_venta;
  END actualizar_venta;

  PROCEDURE eliminar_venta(p_id_venta IN NUMBER) IS
  BEGIN
    DELETE FROM ventas WHERE ID_Venta = p_id_venta;
  END eliminar_venta;

  FUNCTION obtener_venta(p_id_venta IN NUMBER) RETURN VARCHAR2 IS
    v_fecha DATE;
  BEGIN
    SELECT Fecha INTO v_fecha FROM ventas WHERE ID_Venta = p_id_venta;
    RETURN TO_CHAR(v_fecha, 'YYYY-MM-DD');
  END obtener_venta;
END ventas_pkg;
/

CREATE OR REPLACE PACKAGE pagos_pkg AS
  PROCEDURE agregar_pago(p_fecha IN DATE, p_id_cliente IN NUMBER, p_monto IN NUMBER);
  PROCEDURE actualizar_pago(p_id_pago IN NUMBER, p_fecha IN DATE, p_id_cliente IN NUMBER, p_monto IN NUMBER);
  PROCEDURE eliminar_pago(p_id_pago IN NUMBER);
  FUNCTION obtener_pago(p_id_pago IN NUMBER) RETURN VARCHAR2;
END pagos_pkg;
/
CREATE OR REPLACE PACKAGE BODY pagos_pkg AS
  PROCEDURE agregar_pago(p_fecha IN DATE, p_id_cliente IN NUMBER, p_monto IN NUMBER) IS
  BEGIN
    INSERT INTO pagos (ID_Pago, Fecha, ID_Cliente, Monto)
    VALUES (seq_pagos.NEXTVAL, p_fecha, p_id_cliente, p_monto);
  END agregar_pago;

  PROCEDURE actualizar_pago(p_id_pago IN NUMBER, p_fecha IN DATE, p_id_cliente IN NUMBER, p_monto IN NUMBER) IS
  BEGIN
    UPDATE pagos
    SET Fecha = p_fecha, ID_Cliente = p_id_cliente, Monto = p_monto
    WHERE ID_Pago = p_id_pago;
  END actualizar_pago;

  PROCEDURE eliminar_pago(p_id_pago IN NUMBER) IS
  BEGIN
    DELETE FROM pagos WHERE ID_Pago = p_id_pago;
  END eliminar_pago;

  FUNCTION obtener_pago(p_id_pago IN NUMBER) RETURN VARCHAR2 IS
    v_fecha DATE;
  BEGIN
    SELECT Fecha INTO v_fecha FROM pagos WHERE ID_Pago = p_id_pago;
    RETURN TO_CHAR(v_fecha, 'YYYY-MM-DD');
  END obtener_pago;
END pagos_pkg;
/

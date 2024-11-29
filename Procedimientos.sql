--Insertar Usuario
CREATE OR REPLACE PROCEDURE insertar_usuario (
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_rol IN VARCHAR2 DEFAULT 'Usuario',
    p_usuario_id OUT NUMBER
) AS
BEGIN
    INSERT INTO usuarios (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
    VALUES (seq_usuarios.NEXTVAL, p_nombre, p_apellido, p_telefono, p_email, p_rol, SYSDATE)
    RETURNING ID_Usuario INTO p_usuario_id;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar usuario: ' || SQLERRM);
        ROLLBACK;
        p_usuario_id := NULL;
END;



--Actualizar Usuario
CREATE OR REPLACE PROCEDURE actualizar_usuario (
    p_id_usuario IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    UPDATE usuarios
    SET Nombre = p_nombre,
        Apellido = p_apellido,
        Telefono = p_telefono,
        Email = p_email,
        Fecha_Actualizacion = SYSDATE
    WHERE ID_Usuario = p_id_usuario;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar usuario: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Usuario
CREATE OR REPLACE PROCEDURE eliminar_usuario (
    p_id_usuario IN NUMBER
) AS
BEGIN
    DELETE FROM usuarios
    WHERE ID_Usuario = p_id_usuario;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar usuario: ' || SQLERRM);
        ROLLBACK;
END;



--Insertar Proveedor
CREATE OR REPLACE PROCEDURE insertar_proveedor (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_proveedor_id OUT NUMBER
) AS
BEGIN
    INSERT INTO proveedores (ID_Proveedor, Nombre, Descripcion, Telefono, Email)
    VALUES (seq_proveedores.NEXTVAL, p_nombre, p_descripcion, p_telefono, p_email)
    RETURNING ID_Proveedor INTO p_proveedor_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar proveedor: ' || SQLERRM);
        ROLLBACK;
        p_proveedor_id := NULL;
END;



--Actualizar Proveedor
CREATE OR REPLACE PROCEDURE actualizar_proveedor (
    p_id_proveedor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    UPDATE proveedores
    SET Nombre = p_nombre,
        Descripcion = p_descripcion,
        Telefono = p_telefono,
        Email = p_email
    WHERE ID_Proveedor = p_id_proveedor;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar proveedor: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Proveedor
CREATE OR REPLACE PROCEDURE eliminar_proveedor (
    p_id_proveedor IN NUMBER
) AS
BEGIN
    DELETE FROM proveedores
    WHERE ID_Proveedor = p_id_proveedor;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar proveedor: ' || SQLERRM);
        ROLLBACK;
END;



--Insertar Mascota
CREATE OR REPLACE PROCEDURE insertar_mascota (
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER,
    p_id_usuario IN NUMBER,
    p_mascota_id OUT NUMBER
) AS
BEGIN
    INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Usuario)
    VALUES (seq_mascota.NEXTVAL, p_nombre, p_especie, p_raza, p_edad, p_id_usuario)
    RETURNING ID_Mascota INTO p_mascota_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar mascota: ' || SQLERRM);
        ROLLBACK;
        p_mascota_id := NULL;
END;



--Actualizar Mascota
CREATE OR REPLACE PROCEDURE actualizar_mascota (
    p_id_mascota IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER
) AS
BEGIN
    UPDATE mascota
    SET Nombre = p_nombre,
        Especie = p_especie,
        Raza = p_raza,
        Edad = p_edad
    WHERE ID_Mascota = p_id_mascota;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar mascota: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Mascota
CREATE OR REPLACE PROCEDURE eliminar_mascota (
    p_id_mascota IN NUMBER
) AS
BEGIN
    DELETE FROM mascota
    WHERE ID_Mascota = p_id_mascota;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar mascota: ' || SQLERRM);
        ROLLBACK;
END;



--Insertar Producto
CREATE OR REPLACE PROCEDURE insertar_producto (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_producto_id OUT NUMBER
) AS
BEGIN
    INSERT INTO productos (ID_Producto, Nombre, Descripcion, Stock, Precio, ID_Proveedor)
    VALUES (seq_productos.NEXTVAL, p_nombre, p_descripcion, p_stock, p_precio, p_id_proveedor)
    RETURNING ID_Producto INTO p_producto_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar producto: ' || SQLERRM);
        ROLLBACK;
        p_producto_id := NULL;
END;



--Actualizar Producto
CREATE OR REPLACE PROCEDURE actualizar_producto (
    p_id_producto IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER
) AS
BEGIN
    UPDATE productos
    SET Nombre = p_nombre,
        Descripcion = p_descripcion,
        Stock = p_stock,
        Precio = p_precio
    WHERE ID_Producto = p_id_producto;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar producto: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Producto
CREATE OR REPLACE PROCEDURE eliminar_producto (
    p_id_producto IN NUMBER
) AS
BEGIN
    DELETE FROM productos
    WHERE ID_Producto = p_id_producto;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar producto: ' || SQLERRM);
        ROLLBACK;
END;



--Insertar Servicio
CREATE OR REPLACE PROCEDURE insertar_servicio (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_servicio_id OUT NUMBER
) AS
BEGIN
    INSERT INTO servicios (ID_Servicio, Nombre, Descripcion, Precio, ID_Proveedor)
    VALUES (seq_servicios.NEXTVAL, p_nombre, p_descripcion, p_precio, p_id_proveedor)
    RETURNING ID_Servicio INTO p_servicio_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar servicio: ' || SQLERRM);
        ROLLBACK;
        p_servicio_id := NULL;
END;



--Actualizar Servicio
CREATE OR REPLACE PROCEDURE actualizar_servicio (
    p_id_servicio IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER
) AS
BEGIN
    UPDATE servicios
    SET Nombre = p_nombre,
        Descripcion = p_descripcion,
        Precio = p_precio
    WHERE ID_Servicio = p_id_servicio;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar servicio: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Servicio
CREATE OR REPLACE PROCEDURE eliminar_servicio (
    p_id_servicio IN NUMBER
) AS
BEGIN
    DELETE FROM servicios
    WHERE ID_Servicio = p_id_servicio;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar servicio: ' || SQLERRM);
        ROLLBACK;
END;



--Registrar Cita
CREATE OR REPLACE PROCEDURE registrar_cita (
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_cita_id OUT NUMBER
) AS
BEGIN
    INSERT INTO citas (ID_Cita, Fecha, Hora, Motivo, ID_Mascota, ID_Usuario)
    VALUES (seq_citas.NEXTVAL, p_fecha, p_hora, p_motivo, p_id_mascota, p_id_usuario)
    RETURNING ID_Cita INTO p_cita_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al registrar cita: ' || SQLERRM);
        ROLLBACK;
        p_cita_id := NULL;
END;



--Actualizar Cita
CREATE OR REPLACE PROCEDURE actualizar_cita (
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2
) AS
BEGIN
    UPDATE citas
    SET Fecha = p_fecha,
        Hora = p_hora,
        Motivo = p_motivo
    WHERE ID_Cita = p_id_cita;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar cita: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Cita
CREATE OR REPLACE PROCEDURE eliminar_cita (
    p_id_cita IN NUMBER
) AS
BEGIN
    DELETE FROM citas
    WHERE ID_Cita = p_id_cita;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar cita: ' || SQLERRM);
        ROLLBACK;
END;



--Registrar Historial Médico
CREATE OR REPLACE PROCEDURE registrar_historial (
    p_descripcion IN CLOB,
    p_fecha IN DATE,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_historial_id OUT NUMBER
) AS
BEGIN
    INSERT INTO historial_medico (ID_Historial, Descripcion, Fecha, ID_Mascota, ID_Usuario)
    VALUES (seq_historial_medico.NEXTVAL, p_descripcion, p_fecha, p_id_mascota, p_id_usuario)
    RETURNING ID_Historial INTO p_historial_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al registrar historial médico: ' || SQLERRM);
        ROLLBACK;
        p_historial_id := NULL;
END;



--Actualizar Historial Médico
CREATE OR REPLACE PROCEDURE actualizar_historial (
    p_id_historial IN NUMBER,
    p_descripcion IN CLOB,
    p_fecha IN DATE
) AS
BEGIN
    UPDATE historial_medico
    SET Descripcion = p_descripcion,
        Fecha = p_fecha
    WHERE ID_Historial = p_id_historial;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar historial médico: ' || SQLERRM);
        ROLLBACK;
END;



--Insertar Tratamiento
CREATE OR REPLACE PROCEDURE insertar_tratamiento (
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER,
    p_id_historial IN NUMBER,
    p_id_producto IN NUMBER,
    p_id_usuario IN NUMBER,
    p_tratamiento_id OUT NUMBER
) AS
BEGIN
    INSERT INTO tratamientos (ID_Tratamiento, Descripcion, Medicina, Duracion, ID_Historial, ID_Producto, ID_Usuario)
    VALUES (seq_tratamientos.NEXTVAL, p_descripcion, p_medicina, p_duracion, p_id_historial, p_id_producto, p_id_usuario)
    RETURNING ID_Tratamiento INTO p_tratamiento_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar tratamiento: ' || SQLERRM);
        ROLLBACK;
        p_tratamiento_id := NULL;
END;



--Actualizar Tratamiento
CREATE OR REPLACE PROCEDURE actualizar_tratamiento (
    p_id_tratamiento IN NUMBER,
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER
) AS
BEGIN
    UPDATE tratamientos
    SET Descripcion = p_descripcion,
        Medicina = p_medicina,
        Duracion = p_duracion
    WHERE ID_Tratamiento = p_id_tratamiento;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar tratamiento: ' || SQLERRM);
        ROLLBACK;
END;



--Eliminar Tratamiento
CREATE OR REPLACE PROCEDURE eliminar_tratamiento (
    p_id_tratamiento IN NUMBER
) AS
BEGIN
    DELETE FROM tratamientos
    WHERE ID_Tratamiento = p_id_tratamiento;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar tratamiento: ' || SQLERRM);
        ROLLBACK;
END;



--Insertar Ubicación
CREATE OR REPLACE PROCEDURE insertar_ubicacion (
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_ubicacion_id OUT NUMBER
) AS
BEGIN
    INSERT INTO ubicaciones (ID_Ubicacion, Nombre, Direccion)
    VALUES (seq_ubicaciones.NEXTVAL, p_nombre, p_direccion)
    RETURNING ID_Ubicacion INTO p_ubicacion_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar ubicación: ' || SQLERRM);
        ROLLBACK;
        p_ubicacion_id := NULL;
END;



--Actualizar Ubicación
CREATE OR REPLACE PROCEDURE actualizar_ubicacion (
    p_id_ubicacion IN NUMBER,
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2
) AS
BEGIN
    UPDATE ubicaciones
    SET Nombre = p_nombre,
        Direccion = p_direccion
    WHERE ID_Ubicacion = p_id_ubicacion;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar ubicación: ' || SQLERRM);
        ROLLBACK;
END;

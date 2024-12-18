-- Insertar Usuario
CREATE OR REPLACE PROCEDURE insertar_usuario (
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_rol IN VARCHAR2 DEFAULT 'Usuario',
    p_usuario_id OUT NUMBER
) AS
BEGIN
    INSERT INTO usuario (id_usuario, nombre, apellido, telefono, email, rol, fecha_creacion)
    VALUES (seq_usuarios.NEXTVAL, p_nombre, p_apellido, p_telefono, p_email, p_rol, SYSDATE)
    RETURNING id_usuario INTO p_usuario_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_usuario_id := NULL;
        RAISE_APPLICATION_ERROR(-20001, 'Error al insertar usuario: ' || SQLERRM);
END;
/

-- Actualizar Usuario
CREATE OR REPLACE PROCEDURE actualizar_usuario (
    p_id_usuario IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    UPDATE usuario
    SET nombre = p_nombre,
        apellido = p_apellido,
        telefono = p_telefono,
        email = p_email,
        fecha_actualizacion = SYSDATE
    WHERE id_usuario = p_id_usuario;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Error al actualizar usuario: ' || SQLERRM);
END;
/

-- Eliminar Usuario
CREATE OR REPLACE PROCEDURE eliminar_usuario (
    p_id_usuario IN NUMBER
) AS
BEGIN
    DELETE FROM usuario
    WHERE id_usuario = p_id_usuario;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar usuario: ' || SQLERRM);
END;
/

-- Insertar Proveedor
CREATE OR REPLACE PROCEDURE insertar_proveedor (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_proveedor_id OUT NUMBER
) AS
BEGIN
    INSERT INTO proveedor (id_proveedor, nombre, descripcion, telefono, email)
    VALUES (seq_proveedores.NEXTVAL, p_nombre, p_descripcion, p_telefono, p_email)
    RETURNING id_proveedor INTO p_proveedor_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_proveedor_id := NULL;
        RAISE_APPLICATION_ERROR(-20004, 'Error al insertar proveedor: ' || SQLERRM);
END;
/

-- Actualizar Proveedor
CREATE OR REPLACE PROCEDURE actualizar_proveedor (
    p_id_proveedor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    UPDATE proveedor
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        telefono = p_telefono,
        email = p_email
    WHERE id_proveedor = p_id_proveedor;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20005, 'Error al actualizar proveedor: ' || SQLERRM);
END;
/

-- Eliminar Proveedor
CREATE OR REPLACE PROCEDURE eliminar_proveedor (
    p_id_proveedor IN NUMBER
) AS
BEGIN
    DELETE FROM proveedor
    WHERE id_proveedor = p_id_proveedor;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20006, 'Error al eliminar proveedor: ' || SQLERRM);
END;
/

-- Insertar Mascota
CREATE OR REPLACE PROCEDURE insertar_mascota (
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER,
    p_id_usuario IN NUMBER,
    p_mascota_id OUT NUMBER
) AS
BEGIN
    INSERT INTO mascota (id_mascota, nombre, especie, raza, edad, id_usuario)
    VALUES (seq_mascota.NEXTVAL, p_nombre, p_especie, p_raza, p_edad, p_id_usuario)
    RETURNING id_mascota INTO p_mascota_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_mascota_id := NULL;
        RAISE_APPLICATION_ERROR(-20007, 'Error al insertar mascota: ' || SQLERRM);
END;
/

-- Actualizar Mascota
CREATE OR REPLACE PROCEDURE actualizar_mascota (
    p_id_mascota IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER
) AS
BEGIN
    UPDATE mascota
    SET nombre = p_nombre,
        especie = p_especie,
        raza = p_raza,
        edad = p_edad
    WHERE id_mascota = p_id_mascota;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20008, 'Error al actualizar mascota: ' || SQLERRM);
END;
/

-- Eliminar Mascota
CREATE OR REPLACE PROCEDURE eliminar_mascota (
    p_id_mascota IN NUMBER
) AS
BEGIN
    DELETE FROM mascota
    WHERE id_mascota = p_id_mascota;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20009, 'Error al eliminar mascota: ' || SQLERRM);
END;
/

-- Insertar Producto
CREATE OR REPLACE PROCEDURE insertar_producto (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_producto_id OUT NUMBER
) AS
BEGIN
    INSERT INTO producto (id_producto, nombre, descripcion, stock, precio, id_proveedor)
    VALUES (seq_productos.NEXTVAL, p_nombre, p_descripcion, p_stock, p_precio, p_id_proveedor)
    RETURNING id_producto INTO p_producto_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_producto_id := NULL;
        RAISE_APPLICATION_ERROR(-20010, 'Error al insertar producto: ' || SQLERRM);
END;
/

-- Actualizar Producto
CREATE OR REPLACE PROCEDURE actualizar_producto (
    p_id_producto IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER
) AS
BEGIN
    UPDATE producto
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        stock = p_stock,
        precio = p_precio
    WHERE id_producto = p_id_producto;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20011, 'Error al actualizar producto: ' || SQLERRM);
END;
/


-- Eliminar Producto
CREATE OR REPLACE PROCEDURE eliminar_producto (
    p_id_producto IN NUMBER
) AS
BEGIN
    DELETE FROM producto
    WHERE id_producto = p_id_producto;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20012, 'Error al eliminar producto: ' || SQLERRM);
END;
/

-- Insertar Servicio
CREATE OR REPLACE PROCEDURE insertar_servicio (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_servicio_id OUT NUMBER
) AS
BEGIN
    INSERT INTO servicio (id_servicio, nombre, descripcion, precio, id_proveedor)
    VALUES (seq_servicios.NEXTVAL, p_nombre, p_descripcion, p_precio, p_id_proveedor)
    RETURNING id_servicio INTO p_servicio_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_servicio_id := NULL;
        RAISE_APPLICATION_ERROR(-20013, 'Error al insertar servicio: ' || SQLERRM);
END;
/

-- Actualizar Servicio
CREATE OR REPLACE PROCEDURE actualizar_servicio (
    p_id_servicio IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER
) AS
BEGIN
    UPDATE servicio
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        precio = p_precio
    WHERE id_servicio = p_id_servicio;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20014, 'Error al actualizar servicio: ' || SQLERRM);
END;
/

-- Eliminar Servicio
CREATE OR REPLACE PROCEDURE eliminar_servicio (
    p_id_servicio IN NUMBER
) AS
BEGIN
    DELETE FROM servicio
    WHERE id_servicio = p_id_servicio;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015, 'Error al eliminar servicio: ' || SQLERRM);
END;
/

-- Registrar Cita
CREATE OR REPLACE PROCEDURE registrar_cita (
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_cita_id OUT NUMBER
) AS
BEGIN
    INSERT INTO cita (id_cita, fecha, hora, motivo, id_mascota, id_usuario)
    VALUES (seq_citas.NEXTVAL, p_fecha, p_hora, p_motivo, p_id_mascota, p_id_usuario)
    RETURNING id_cita INTO p_cita_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_cita_id := NULL;
        RAISE_APPLICATION_ERROR(-20016, 'Error al registrar cita: ' || SQLERRM);
END;
/

-- Actualizar Cita
CREATE OR REPLACE PROCEDURE actualizar_cita (
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2
) AS
BEGIN
    UPDATE cita
    SET fecha = p_fecha,
        hora = p_hora,
        motivo = p_motivo
    WHERE id_cita = p_id_cita;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20017, 'Error al actualizar cita: ' || SQLERRM);
END;
/

-- Eliminar Cita
CREATE OR REPLACE PROCEDURE eliminar_cita (
    p_id_cita IN NUMBER
) AS
BEGIN
    DELETE FROM cita
    WHERE id_cita = p_id_cita;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20018, 'Error al eliminar cita: ' || SQLERRM);
END;
/

-- Registrar Historial Médico
CREATE OR REPLACE PROCEDURE insertar_historial_medico(
    p_descripcion IN CLOB,
    p_fecha IN DATE,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER
) AS
BEGIN
    INSERT INTO historial_medico (id_historial, descripcion, fecha, id_mascota, id_usuario)
    VALUES (historial_medico_seq.NEXTVAL, p_descripcion, p_fecha, p_id_mascota, p_id_usuario);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

/

-- Actualizar Historial Médico
CREATE OR REPLACE PROCEDURE actualizar_historial (
    p_id_historial IN NUMBER,
    p_descripcion IN CLOB,
    p_fecha IN DATE
) AS
BEGIN
    UPDATE historial_medico
    SET descripcion = p_descripcion,
        fecha = p_fecha
    WHERE id_historial = p_id_historial;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20020, 'Error al actualizar historial médico: ' || SQLERRM);
END;
/

-- Insertar Tratamiento
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
    INSERT INTO tratamiento (id_tratamiento, descripcion, medicina, duracion, id_historial, id_producto, id_usuario)
    VALUES (seq_tratamientos.NEXTVAL, p_descripcion, p_medicina, p_duracion, p_id_historial, p_id_producto, p_id_usuario)
    RETURNING id_tratamiento INTO p_tratamiento_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_tratamiento_id := NULL;
        RAISE_APPLICATION_ERROR(-20021, 'Error al insertar tratamiento: ' || SQLERRM);
END;
/

-- Actualizar Tratamiento
CREATE OR REPLACE PROCEDURE actualizar_tratamiento (
    p_id_tratamiento IN NUMBER,
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER
) AS
BEGIN
    UPDATE tratamiento
    SET descripcion = p_descripcion,
        medicina = p_medicina,
        duracion = p_duracion
    WHERE id_tratamiento = p_id_tratamiento;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20022, 'Error al actualizar tratamiento: ' || SQLERRM);
END;
/

-- Eliminar Tratamiento
CREATE OR REPLACE PROCEDURE eliminar_tratamiento (
    p_id_tratamiento IN NUMBER
) AS
BEGIN
    DELETE FROM tratamiento
    WHERE id_tratamiento = p_id_tratamiento;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20023, 'Error al eliminar tratamiento: ' || SQLERRM);
END;
/

-- Insertar Ubicación
CREATE OR REPLACE PROCEDURE insertar_ubicacion (
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_ubicacion_id OUT NUMBER
) AS
BEGIN
    INSERT INTO ubicacion (id_ubicacion, nombre, direccion)
    VALUES (seq_ubicaciones.NEXTVAL, p_nombre, p_direccion)
    RETURNING id_ubicacion INTO p_ubicacion_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_ubicacion_id := NULL;
        RAISE_APPLICATION_ERROR(-20024, 'Error al insertar ubicación: ' || SQLERRM);
END;
/

-- Actualizar Ubicación
CREATE OR REPLACE PROCEDURE actualizar_ubicacion (
    p_id_ubicacion IN NUMBER,
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2
) AS
BEGIN
    UPDATE ubicacion
    SET nombre = p_nombre,
        direccion = p_direccion
    WHERE id_ubicacion = p_id_ubicacion;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025, 'Error al actualizar ubicación: ' || SQLERRM);
END;
/

--consultar usuario
CREATE OR REPLACE PROCEDURE consultar_usuario (
    p_id_usuario IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_apellido OUT VARCHAR2,
    p_telefono OUT VARCHAR2,
    p_email OUT VARCHAR2,
    p_rol OUT VARCHAR2
) AS
BEGIN
    SELECT nombre, apellido, telefono, email, rol
    INTO p_nombre, p_apellido, p_telefono, p_email, p_rol
    FROM usuario
    WHERE id_usuario = p_id_usuario;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20021, 'Usuario no encontrado');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20022, 'Error al consultar usuario: ' || SQLERRM);
END;
/


--Consultar mascota
CREATE OR REPLACE PROCEDURE consultar_mascota (
    p_id_mascota IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_especie OUT VARCHAR2,
    p_raza OUT VARCHAR2,
    p_edad OUT NUMBER,
    p_id_usuario OUT NUMBER
) AS
BEGIN
    SELECT nombre, especie, raza, edad, id_usuario
    INTO p_nombre, p_especie, p_raza, p_edad, p_id_usuario
    FROM mascota
    WHERE id_mascota = p_id_mascota;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20023, 'Mascota no encontrada');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20024, 'Error al consultar mascota: ' || SQLERRM);
END;
/
----
--Crear mascota
CREATE OR REPLACE PROCEDURE insertar_mascota (
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER,
    p_id_usuario IN NUMBER,
    p_mascota_id OUT NUMBER
) AS
BEGIN
    INSERT INTO mascota (id_mascota, nombre, especie, raza, edad, id_usuario)
    VALUES (seq_mascota.NEXTVAL, p_nombre, p_especie, p_raza, p_edad, p_id_usuario)
    RETURNING id_mascota INTO p_mascota_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_mascota_id := NULL;
        RAISE_APPLICATION_ERROR(-20007, 'Error al insertar mascota: ' || SQLERRM);
END;
/

--Consultar mascota por id
CREATE OR REPLACE PROCEDURE consultar_mascota (
    p_id_mascota IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_especie OUT VARCHAR2,
    p_raza OUT VARCHAR2,
    p_edad OUT NUMBER,
    p_id_usuario OUT NUMBER
) AS
BEGIN
    SELECT nombre, especie, raza, edad, id_usuario
    INTO p_nombre, p_especie, p_raza, p_edad, p_id_usuario
    FROM mascota
    WHERE id_mascota = p_id_mascota;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20010, 'Mascota no encontrada');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20011, 'Error al consultar mascota: ' || SQLERRM);
END;
/

--modificar mascota
CREATE OR REPLACE PROCEDURE actualizar_mascota (
    p_id_mascota IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER
) AS
BEGIN
    UPDATE mascota
    SET nombre = p_nombre,
        especie = p_especie,
        raza = p_raza,
        edad = p_edad
    WHERE id_mascota = p_id_mascota;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Mascota no encontrada para actualizar');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20008, 'Error al actualizar mascota: ' || SQLERRM);
END;
/

--Eliminar mascota
CREATE OR REPLACE PROCEDURE eliminar_mascota (
    p_id_mascota IN NUMBER
) AS
BEGIN
    DELETE FROM mascota
    WHERE id_mascota = p_id_mascota;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20009, 'Mascota no encontrada para eliminar');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20009, 'Error al eliminar mascota: ' || SQLERRM);
END;
/
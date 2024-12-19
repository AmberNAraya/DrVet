-- Procedimientos CRUD para Usuario
--Insertar
CREATE OR REPLACE PROCEDURE insertar_usuario (
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_rol IN VARCHAR2 DEFAULT 'Usuario',
    p_usuario_id OUT NUMBER
) AS
BEGIN
    INSERT INTO usuario (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
    VALUES (seq_usuarios.NEXTVAL, p_nombre, p_apellido, p_telefono, p_email, p_rol, SYSDATE)
    RETURNING ID_Usuario INTO p_usuario_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar usuario: ' || SQLERRM);
        ROLLBACK;
        p_usuario_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_usuario (
    p_id_usuario IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_rol IN VARCHAR2
) AS
BEGIN
    UPDATE usuario
    SET nombre = p_nombre,
        apellido = p_apellido,
        telefono = p_telefono,
        email = p_email,
        rol = p_rol
    WHERE id_usuario = p_id_usuario;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar usuario: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_usuario (
    p_id_usuario IN NUMBER
) AS
BEGIN
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar usuario: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Proveedor
--Insertar
CREATE OR REPLACE PROCEDURE insertar_proveedor (
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al insertar proveedor: ' || SQLERRM);
        ROLLBACK;
        p_proveedor_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_proveedor (
    p_id_proveedor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al actualizar proveedor: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_proveedor (
    p_id_proveedor IN NUMBER
) AS
BEGIN
    DELETE FROM proveedor WHERE id_proveedor = p_id_proveedor;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar proveedor: ' || SQLERRM);
        ROLLBACK;
END;
/



-- Procedimientos CRUD para Mascota
--Insertar
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
    VALUES (seq_mascotas.NEXTVAL, p_nombre, p_especie, p_raza, p_edad, p_id_usuario)
    RETURNING id_mascota INTO p_mascota_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar mascota: ' || SQLERRM);
        ROLLBACK;
        p_mascota_id := NULL;
END;
/

--Actualizar
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
        DBMS_OUTPUT.PUT_LINE('Error al actualizar mascota: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_mascota (
    p_id_mascota IN NUMBER
) AS
BEGIN
    DELETE FROM mascota WHERE id_mascota = p_id_mascota;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar mascota: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Producto
--Insertar
CREATE OR REPLACE PROCEDURE insertar_producto (
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al insertar producto: ' || SQLERRM);
        ROLLBACK;
        p_producto_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_producto (
    p_id_producto IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al actualizar producto: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_producto (
    p_id_producto IN NUMBER
) AS
BEGIN
    DELETE FROM producto WHERE id_producto = p_id_producto;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar producto: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Servicio
--Insertar
CREATE OR REPLACE PROCEDURE insertar_servicio (
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al insertar servicio: ' || SQLERRM);
        ROLLBACK;
        p_servicio_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_servicio (
    p_id_servicio IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al actualizar servicio: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_servicio (
    p_id_servicio IN NUMBER
) AS
BEGIN
    DELETE FROM servicio WHERE id_servicio = p_id_servicio;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar servicio: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Cita
--Insertar
CREATE OR REPLACE PROCEDURE INSERTAR_CITA (
    p_fecha_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_asistencia IN VARCHAR2,
    p_cita_id OUT NUMBER
) AS
BEGIN
    INSERT INTO cita (id_cita, fecha, motivo, id_mascota, id_usuario, asistencia)
    VALUES (seq_citas.NEXTVAL, p_fecha_hora, p_motivo, p_id_mascota, p_id_usuario, p_asistencia)
    RETURNING id_cita INTO p_cita_id;  
END;
/
--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_cita (
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_asistencia IN VARCHAR2
) AS
BEGIN
    UPDATE cita
    SET fecha = p_fecha,
        hora = p_hora,
        motivo = p_motivo,
        asistencia = p_asistencia
    WHERE id_cita = p_id_cita;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar cita: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_cita (
    p_id_cita IN NUMBER
) AS
BEGIN
    DELETE FROM cita WHERE id_cita = p_id_cita;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar cita: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Historial Médico
--Insertar
CREATE OR REPLACE PROCEDURE insertar_historial (
    p_descripcion IN VARCHAR2,
    p_fecha IN DATE,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_historial_id OUT NUMBER
) AS
BEGIN
    INSERT INTO historial_medico (id_historial, descripcion, fecha, id_mascota, id_usuario)
    VALUES (seq_historial_medico.NEXTVAL, p_descripcion, p_fecha, p_id_mascota, p_id_usuario)
    RETURNING id_historial INTO p_historial_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar historial médico: ' || SQLERRM);
        ROLLBACK;
        p_historial_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_historial (
    p_id_historial IN NUMBER,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al actualizar historial médico: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_historial (
    p_id_historial IN NUMBER
) AS
BEGIN
    DELETE FROM historial_medico WHERE id_historial = p_id_historial;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar historial médico: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Tratamiento
--Insertar
CREATE OR REPLACE PROCEDURE insertar_tratamiento (
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al insertar tratamiento: ' || SQLERRM);
        ROLLBACK;
        p_tratamiento_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_tratamiento (
    p_id_tratamiento IN NUMBER,
    p_descripcion IN VARCHAR2,
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
        DBMS_OUTPUT.PUT_LINE('Error al actualizar tratamiento: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_tratamiento (
    p_id_tratamiento IN NUMBER
) AS
BEGIN
    DELETE FROM tratamiento WHERE id_tratamiento = p_id_tratamiento;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar tratamiento: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Medicamento
--Insertar
CREATE OR REPLACE PROCEDURE insertar_medicamento (
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
    p_precio IN NUMBER,
    p_stock IN NUMBER,
    p_fecha_vencimiento IN DATE,
    p_id_proveedor IN NUMBER,
    p_medicamento_id OUT NUMBER
) AS
BEGIN
    INSERT INTO medicamento (id_medicamento, nombre, descripcion, precio, stock, fecha_vencimiento, id_proveedor)
    VALUES (seq_medicamentos.NEXTVAL, p_nombre, p_descripcion, p_precio, p_stock, p_fecha_vencimiento, p_id_proveedor)
    RETURNING id_medicamento INTO p_medicamento_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar medicamento: ' || SQLERRM);
        ROLLBACK;
        p_medicamento_id := NULL;
END;
/

--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_medicamento (
    p_id_medicamento IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
    p_precio IN NUMBER,
    p_stock IN NUMBER,
    p_fecha_vencimiento IN DATE
) AS
BEGIN
    UPDATE medicamento
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        precio = p_precio,
        stock = p_stock,
        fecha_vencimiento = p_fecha_vencimiento
    WHERE id_medicamento = p_id_medicamento;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar medicamento: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_medicamento (
    p_id_medicamento IN NUMBER
) AS
BEGIN
    DELETE FROM medicamento WHERE id_medicamento = p_id_medicamento;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar medicamento: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Inventario
--Insertar
CREATE OR REPLACE PROCEDURE insertar_inventario (
    p_id_producto IN NUMBER,
    p_cantidad IN NUMBER,
    p_id_inventario OUT NUMBER
) AS
BEGIN
    INSERT INTO inventario (id_inventario, id_producto, cantidad, fecha_actualizacion)
    VALUES (seq_inventario.NEXTVAL, p_id_producto, p_cantidad, SYSDATE)
    RETURNING id_inventario INTO p_id_inventario;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar inventario: ' || SQLERRM);
        ROLLBACK;
        p_id_inventario := NULL;
END;
/


--Actualizar
CREATE OR REPLACE PROCEDURE actualizar_inventario (
    p_id_inventario IN NUMBER,
    p_id_producto IN NUMBER,
    p_cantidad IN NUMBER
) AS
BEGIN
    UPDATE inventario
    SET id_producto = p_id_producto,
        cantidad = p_cantidad,
        fecha_actualizacion = SYSDATE
    WHERE id_inventario = p_id_inventario;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar inventario: ' || SQLERRM);
        ROLLBACK;
END;
/

--Eliminar
CREATE OR REPLACE PROCEDURE eliminar_inventario (
    p_id_inventario IN NUMBER
) AS
BEGIN
    DELETE FROM inventario WHERE id_inventario = p_id_inventario;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar inventario: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Examen
--Insertar
CREATE OR REPLACE PROCEDURE insertar_examen (
    p_tipo IN VARCHAR2,
    p_fecha IN DATE,
    p_resultado IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_tratamiento IN NUMBER,
    p_examen_id OUT NUMBER
) AS
BEGIN
    -- Usar la secuencia para generar el ID_EXAMEN automáticamente
    INSERT INTO examen (id_examen, tipo, fecha, resultado, id_mascota, id_tratamiento)
    VALUES (seq_examenes.NEXTVAL, p_tipo, p_fecha, p_resultado, p_id_mascota, p_id_tratamiento)
    RETURNING id_examen INTO p_examen_id;
END;
/

-- Actualizar
CREATE OR REPLACE PROCEDURE actualizar_examen (
    p_id_examen IN NUMBER,
    p_id_mascota IN NUMBER,
    p_id_tratamiento IN NUMBER,
    p_tipo IN VARCHAR2,
    p_fecha IN DATE,
    p_resultado IN VARCHAR2
) AS
BEGIN
    UPDATE examen
    SET id_mascota = p_id_mascota,
        id_tratamiento = p_id_tratamiento,
        tipo = p_tipo,
        fecha = p_fecha,
        resultado = p_resultado
    WHERE id_examen = p_id_examen;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar examen: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Eliminar
CREATE OR REPLACE PROCEDURE eliminar_examen (
    p_id_examen IN NUMBER
) AS
BEGIN
    DELETE FROM examen WHERE id_examen = p_id_examen;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar examen: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimientos CRUD para Cliente
--Insertar
CREATE OR REPLACE PROCEDURE insertar_cliente (
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_cliente_id OUT NUMBER
) AS
BEGIN
    INSERT INTO cliente (id_cliente, nombre, apellido, direccion, telefono, email)
    VALUES (seq_clientes.NEXTVAL, p_nombre, p_apellido, p_direccion, p_telefono, p_email)
    RETURNING id_cliente INTO p_cliente_id;
END;
/

-- Actualizar
CREATE OR REPLACE PROCEDURE actualizar_cliente (
    p_id_cliente IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    UPDATE cliente
    SET nombre = p_nombre,
        apellido = p_apellido,
        direccion = p_direccion,
        telefono = p_telefono,
        email = p_email
    WHERE id_cliente = p_id_cliente;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar cliente: ' || SQLERRM);
        ROLLBACK;
END;
/


-- Eliminar
CREATE OR REPLACE PROCEDURE eliminar_cliente (
    p_id_cliente IN NUMBER
) AS
BEGIN
    DELETE FROM cliente WHERE id_cliente = p_id_cliente;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar cliente: ' || SQLERRM);
        ROLLBACK;
END;
/

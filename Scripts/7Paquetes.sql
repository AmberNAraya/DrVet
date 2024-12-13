-------------------------------------------------------------------
--1
CREATE OR REPLACE PACKAGE usuarios_pkg AS
  PROCEDURE insertar_usuario(
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_rol IN VARCHAR2 DEFAULT 'Usuario',
    p_usuario_id OUT NUMBER);

  PROCEDURE actualizar_usuario(
    p_id_usuario IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2);

  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER);

  FUNCTION obtener_nombre_completo_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2;

  PROCEDURE listar_usuarios_activos;
END usuarios_pkg;
/

CREATE OR REPLACE PACKAGE BODY usuarios_pkg AS
  PROCEDURE insertar_usuario(
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_rol IN VARCHAR2 DEFAULT 'Usuario',
    p_usuario_id OUT NUMBER) IS
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
  END insertar_usuario;

  PROCEDURE actualizar_usuario(
    p_id_usuario IN NUMBER,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2) IS
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
  END actualizar_usuario;

  PROCEDURE eliminar_usuario(p_id_usuario IN NUMBER) IS
  BEGIN
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar usuario: ' || SQLERRM);
  END eliminar_usuario;

  FUNCTION obtener_nombre_completo_usuario(p_id_usuario IN NUMBER) RETURN VARCHAR2 IS
    v_nombre_completo VARCHAR2(100);
  BEGIN
    SELECT nombre || ' ' || apellido INTO v_nombre_completo
    FROM usuario
    WHERE id_usuario = p_id_usuario;

    RETURN v_nombre_completo;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 'Error al obtener el nombre completo: ' || SQLERRM;
  END obtener_nombre_completo_usuario;

  PROCEDURE listar_usuarios_activos IS
  BEGIN
    FOR r IN (SELECT id_usuario, nombre, apellido, fecha_creacion
              FROM usuario
              WHERE fecha_fin IS NULL) LOOP
      DBMS_OUTPUT.PUT_LINE('Usuario: ' || r.nombre || ' ' || r.apellido || ', Fecha Creación: ' || r.fecha_creacion);
    END LOOP;
  END listar_usuarios_activos;
END usuarios_pkg;
/

------------------------------------------------------------------------
--2
CREATE OR REPLACE PACKAGE proveedores_pkg AS
  PROCEDURE insertar_proveedor(
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_proveedor_id OUT NUMBER);

  PROCEDURE actualizar_proveedor(
    p_id_proveedor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2);

  PROCEDURE eliminar_proveedor(p_id_proveedor IN NUMBER);

  PROCEDURE listar_proveedores;
END proveedores_pkg;
/

CREATE OR REPLACE PACKAGE BODY proveedores_pkg AS
  PROCEDURE insertar_proveedor(
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_proveedor_id OUT NUMBER) IS
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
  END insertar_proveedor;

  PROCEDURE actualizar_proveedor(
    p_id_proveedor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2) IS
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
  END actualizar_proveedor;

  PROCEDURE eliminar_proveedor(p_id_proveedor IN NUMBER) IS
  BEGIN
    DELETE FROM proveedor WHERE id_proveedor = p_id_proveedor;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20006, 'Error al eliminar proveedor: ' || SQLERRM);
  END eliminar_proveedor;

  PROCEDURE listar_proveedores IS
  BEGIN
    FOR r IN (SELECT id_proveedor, nombre, descripcion, telefono, email
              FROM proveedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Proveedor: ' || r.nombre || ', Teléfono: ' || r.telefono || ', Email: ' || r.email);
    END LOOP;
  END listar_proveedores;
END proveedores_pkg;
/

-----------------------------------------------------------------------------------------------
--3 
CREATE OR REPLACE PACKAGE productos_pkg AS
  PROCEDURE insertar_producto(
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_producto_id OUT NUMBER);

  PROCEDURE actualizar_producto(
    p_id_producto IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER);

  PROCEDURE eliminar_producto(p_id_producto IN NUMBER);

  PROCEDURE listar_productos_por_proveedor(p_id_proveedor IN NUMBER);
END productos_pkg;
/

CREATE OR REPLACE PACKAGE BODY productos_pkg AS
  PROCEDURE insertar_producto(
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_producto_id OUT NUMBER) IS
  BEGIN
    INSERT INTO producto (id_producto, nombre, descripcion, stock, precio, id_proveedor)
    VALUES (seq_productos.NEXTVAL, p_nombre, p_descripcion, p_stock, p_precio, p_id_proveedor)
    RETURNING id_producto INTO p_producto_id;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_producto_id := NULL;
      RAISE_APPLICATION_ERROR(-20007, 'Error al insertar producto: ' || SQLERRM);
  END insertar_producto;

  PROCEDURE actualizar_producto(
    p_id_producto IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_stock IN NUMBER,
    p_precio IN NUMBER) IS
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
      RAISE_APPLICATION_ERROR(-20008, 'Error al actualizar producto: ' || SQLERRM);
  END actualizar_producto;

  PROCEDURE eliminar_producto(p_id_producto IN NUMBER) IS
  BEGIN
    DELETE FROM producto WHERE id_producto = p_id_producto;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20009, 'Error al eliminar producto: ' || SQLERRM);
  END eliminar_producto;

  PROCEDURE listar_productos_por_proveedor(p_id_proveedor IN NUMBER) IS
  BEGIN
    FOR r IN (SELECT id_producto, nombre, descripcion, stock, precio
              FROM producto
              WHERE id_proveedor = p_id_proveedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ', Stock: ' || r.stock || ', Precio: ' || r.precio);
    END LOOP;
  END listar_productos_por_proveedor;
END productos_pkg;
/
-------------------------------------------------------------------------------
--4

CREATE OR REPLACE PACKAGE mascotas_pkg AS
  PROCEDURE insertar_mascota(
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER,
    p_id_usuario IN NUMBER,
    p_mascota_id OUT NUMBER);

  PROCEDURE actualizar_mascota(
    p_id_mascota IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER);

  PROCEDURE eliminar_mascota(p_id_mascota IN NUMBER);

  PROCEDURE listar_mascotas_por_usuario(p_id_usuario IN NUMBER);
END mascotas_pkg;
/

CREATE OR REPLACE PACKAGE BODY mascotas_pkg AS
  PROCEDURE insertar_mascota(
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER,
    p_id_usuario IN NUMBER,
    p_mascota_id OUT NUMBER) IS
  BEGIN
    INSERT INTO mascota (id_mascota, nombre, especie, raza, edad, id_usuario)
    VALUES (seq_mascota.NEXTVAL, p_nombre, p_especie, p_raza, p_edad, p_id_usuario)
    RETURNING id_mascota INTO p_mascota_id;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_mascota_id := NULL;
      RAISE_APPLICATION_ERROR(-20010, 'Error al insertar mascota: ' || SQLERRM);
  END insertar_mascota;

  PROCEDURE actualizar_mascota(
    p_id_mascota IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especie IN VARCHAR2,
    p_raza IN VARCHAR2,
    p_edad IN NUMBER) IS
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
      RAISE_APPLICATION_ERROR(-20011, 'Error al actualizar mascota: ' || SQLERRM);
  END actualizar_mascota;

  PROCEDURE eliminar_mascota(p_id_mascota IN NUMBER) IS
  BEGIN
    DELETE FROM mascota WHERE id_mascota = p_id_mascota;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20012, 'Error al eliminar mascota: ' || SQLERRM);
  END eliminar_mascota;

  PROCEDURE listar_mascotas_por_usuario(p_id_usuario IN NUMBER) IS
  BEGIN
    FOR r IN (SELECT id_mascota, nombre, especie, raza, edad
              FROM mascota
              WHERE id_usuario = p_id_usuario) LOOP
      DBMS_OUTPUT.PUT_LINE('Mascota: ' || r.nombre || ', Especie: ' || r.especie || ', Raza: ' || r.raza || ', Edad: ' || r.edad);
    END LOOP;
  END listar_mascotas_por_usuario;
END mascotas_pkg;
/

------------------------------------------------------------------------------------------------
--5
CREATE OR REPLACE PACKAGE servicios_pkg AS
  PROCEDURE insertar_servicio(
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_servicio_id OUT NUMBER);

  PROCEDURE actualizar_servicio(
    p_id_servicio IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER);

  PROCEDURE eliminar_servicio(p_id_servicio IN NUMBER);

  PROCEDURE listar_servicios_por_proveedor(p_id_proveedor IN NUMBER);
END servicios_pkg;
/

CREATE OR REPLACE PACKAGE BODY servicios_pkg AS
  PROCEDURE insertar_servicio(
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER,
    p_id_proveedor IN NUMBER,
    p_servicio_id OUT NUMBER) IS
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
  END insertar_servicio;

  PROCEDURE actualizar_servicio(
    p_id_servicio IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER) IS
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
  END actualizar_servicio;

  PROCEDURE eliminar_servicio(p_id_servicio IN NUMBER) IS
  BEGIN
    DELETE FROM servicio WHERE id_servicio = p_id_servicio;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20015, 'Error al eliminar servicio: ' || SQLERRM);
  END eliminar_servicio;

  PROCEDURE listar_servicios_por_proveedor(p_id_proveedor IN NUMBER) IS
  BEGIN
    FOR r IN (SELECT id_servicio, nombre, descripcion, precio
              FROM servicio
              WHERE id_proveedor = p_id_proveedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Servicio: ' || r.nombre || ', Precio: ' || r.precio);
    END LOOP;
  END listar_servicios_por_proveedor;
END servicios_pkg;
/
-------------------------------------------------------------------------------
--6
CREATE OR REPLACE PACKAGE citas_pkg AS
  PROCEDURE registrar_cita(
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_cita_id OUT NUMBER);

  PROCEDURE actualizar_cita(
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2);

  PROCEDURE eliminar_cita(p_id_cita IN NUMBER);

  PROCEDURE listar_citas_por_mascota(p_id_mascota IN NUMBER);
END citas_pkg;
/

CREATE OR REPLACE PACKAGE BODY citas_pkg AS
  PROCEDURE registrar_cita(
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_cita_id OUT NUMBER) IS
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
  END registrar_cita;

  PROCEDURE actualizar_cita(
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2) IS
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
  END actualizar_cita;

  PROCEDURE eliminar_cita(p_id_cita IN NUMBER) IS
  BEGIN
    DELETE FROM cita WHERE id_cita = p_id_cita;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20018, 'Error al eliminar cita: ' || SQLERRM);
  END eliminar_cita;

  PROCEDURE listar_citas_por_mascota(p_id_mascota IN NUMBER) IS
  BEGIN
    FOR r IN (SELECT id_cita, fecha, hora, motivo
              FROM cita
              WHERE id_mascota = p_id_mascota) LOOP
      DBMS_OUTPUT.PUT_LINE('Cita: ' || r.fecha || ', Hora: ' || r.hora || ', Motivo: ' || r.motivo);
    END LOOP;
  END listar_citas_por_mascota;
END citas_pkg;
/
-----------------------------------------------------------------------------------
--7
CREATE OR REPLACE PACKAGE tratamientos_pkg AS
  PROCEDURE insertar_tratamiento(
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER,
    p_id_historial IN NUMBER,
    p_id_producto IN NUMBER,
    p_id_usuario IN NUMBER,
    p_tratamiento_id OUT NUMBER);

  PROCEDURE actualizar_tratamiento(
    p_id_tratamiento IN NUMBER,
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER);

  PROCEDURE eliminar_tratamiento(p_id_tratamiento IN NUMBER);

  PROCEDURE listar_tratamientos_por_mascota(p_id_mascota IN NUMBER);
END tratamientos_pkg;
/

CREATE OR REPLACE PACKAGE BODY tratamientos_pkg AS
  PROCEDURE insertar_tratamiento(
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER,
    p_id_historial IN NUMBER,
    p_id_producto IN NUMBER,
    p_id_usuario IN NUMBER,
    p_tratamiento_id OUT NUMBER) IS
  BEGIN
    INSERT INTO tratamiento (id_tratamiento, descripcion, medicina, duracion, id_historial, id_producto, id_usuario)
    VALUES (seq_tratamientos.NEXTVAL, p_descripcion, p_medicina, p_duracion, p_id_historial, p_id_producto, p_id_usuario)
    RETURNING id_tratamiento INTO p_tratamiento_id;

    -- Actualizar el stock del producto usado
    UPDATE producto
    SET stock = stock - 1
    WHERE id_producto = p_id_producto;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_tratamiento_id := NULL;
      RAISE_APPLICATION_ERROR(-20019, 'Error al insertar tratamiento: ' || SQLERRM);
  END insertar_tratamiento;

  PROCEDURE actualizar_tratamiento(
    p_id_tratamiento IN NUMBER,
    p_descripcion IN CLOB,
    p_medicina IN VARCHAR2,
    p_duracion IN NUMBER) IS
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
      RAISE_APPLICATION_ERROR(-20020, 'Error al actualizar tratamiento: ' || SQLERRM);
  END actualizar_tratamiento;

  PROCEDURE eliminar_tratamiento(p_id_tratamiento IN NUMBER) IS
  BEGIN
    DELETE FROM tratamiento WHERE id_tratamiento = p_id_tratamiento;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20021, 'Error al eliminar tratamiento: ' || SQLERRM);
  END eliminar_tratamiento;

  PROCEDURE listar_tratamientos_por_mascota(p_id_mascota IN NUMBER) IS
  BEGIN
    FOR r IN (SELECT t.descripcion, t.medicina, t.duracion
              FROM tratamiento t
              JOIN historial_medico h ON t.id_historial = h.id_historial
              WHERE h.id_mascota = p_id_mascota) LOOP
      DBMS_OUTPUT.PUT_LINE('Tratamiento: ' || r.descripcion || ', Medicina: ' || r.medicina || ', Duración: ' || r.duracion);
    END LOOP;
  END listar_tratamientos_por_mascota;
END tratamientos_pkg;
/

----------------------------------------------------------------------------
--8
CREATE OR REPLACE PACKAGE historial_medico_pkg AS
  PROCEDURE registrar_historial(
    p_descripcion IN CLOB,
    p_fecha IN DATE,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_historial_id OUT NUMBER);

  PROCEDURE actualizar_historial(
    p_id_historial IN NUMBER,
    p_descripcion IN CLOB,
    p_fecha IN DATE);

  PROCEDURE listar_historial_por_mascota(p_id_mascota IN NUMBER);
END historial_medico_pkg;
/

CREATE OR REPLACE PACKAGE BODY historial_medico_pkg AS
  PROCEDURE registrar_historial(
    p_descripcion IN CLOB,
    p_fecha IN DATE,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER,
    p_historial_id OUT NUMBER) IS
  BEGIN
    INSERT INTO historial_medico (id_historial, descripcion, fecha, id_mascota, id_usuario)
    VALUES (seq_historial_medico.NEXTVAL, p_descripcion, p_fecha, p_id_mascota, p_id_usuario)
    RETURNING id_historial INTO p_historial_id;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      p_historial_id := NULL;
      RAISE_APPLICATION_ERROR(-20022, 'Error al registrar historial médico: ' || SQLERRM);
  END registrar_historial;

  PROCEDURE actualizar_historial(
    p_id_historial IN NUMBER,
    p_descripcion IN CLOB,
    p_fecha IN DATE) IS
  BEGIN
    UPDATE historial_medico
    SET descripcion = p_descripcion,
        fecha = p_fecha
    WHERE id_historial = p_id_historial;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20023, 'Error al actualizar historial médico: ' || SQLERRM);
  END actualizar_historial;

  PROCEDURE listar_historial_por_mascota(p_id_mascota IN NUMBER) IS
  BEGIN
    FOR r IN (SELECT descripcion, fecha
              FROM historial_medico
              WHERE id_mascota = p_id_mascota) LOOP
      DBMS_OUTPUT.PUT_LINE('Historial: ' || r.descripcion || ', Fecha: ' || r.fecha);
    END LOOP;
  END listar_historial_por_mascota;
END historial_medico_pkg;
/
------------------------------------------------------------------------------------
--9
CREATE OR REPLACE PACKAGE ubicaciones_pkg AS
  PROCEDURE insertar_ubicacion(
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_ubicacion_id OUT NUMBER);

  PROCEDURE actualizar_ubicacion(
    p_id_ubicacion IN NUMBER,
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2);
END ubicaciones_pkg;
/

CREATE OR REPLACE PACKAGE BODY ubicaciones_pkg AS
  PROCEDURE insertar_ubicacion(
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_ubicacion_id OUT NUMBER) IS
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
  END insertar_ubicacion;

  PROCEDURE actualizar_ubicacion(
    p_id_ubicacion IN NUMBER,
    p_nombre IN VARCHAR2,
    p_direccion IN VARCHAR2) IS
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
  END actualizar_ubicacion;
END ubicaciones_pkg;
/

--------------------------------------------------------------------------------
-- 10
CREATE OR REPLACE PACKAGE estadisticas_pkg AS
  FUNCTION calcular_ingresos_estimados RETURN NUMBER;
  FUNCTION proveedor_mas_productos RETURN VARCHAR2;
  FUNCTION contar_citas_pendientes_por_usuario(p_id_usuario IN NUMBER) RETURN NUMBER;
  PROCEDURE listar_productos_disponibles;
  PROCEDURE listar_usuarios_con_citas_pendientes;
END estadisticas_pkg;
/

CREATE OR REPLACE PACKAGE BODY estadisticas_pkg AS
  FUNCTION calcular_ingresos_estimados RETURN NUMBER IS
    v_total_ingresos NUMBER;
  BEGIN
    SELECT SUM(precio) INTO v_total_ingresos FROM servicio;
    RETURN NVL(v_total_ingresos, 0);
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20030, 'Error al calcular ingresos estimados: ' || SQLERRM);
  END calcular_ingresos_estimados;

  FUNCTION proveedor_mas_productos RETURN VARCHAR2 IS
    v_nombre_proveedor VARCHAR2(100);
  BEGIN
    SELECT p.nombre
    INTO v_nombre_proveedor
    FROM proveedor p
    JOIN producto pr ON p.id_proveedor = pr.id_proveedor
    GROUP BY p.nombre
    ORDER BY COUNT(pr.id_producto) DESC
    FETCH FIRST 1 ROWS ONLY;

    RETURN v_nombre_proveedor;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Sin proveedor destacado';
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20031, 'Error al obtener el proveedor con más productos: ' || SQLERRM);
  END proveedor_mas_productos;

  FUNCTION contar_citas_pendientes_por_usuario(p_id_usuario IN NUMBER) RETURN NUMBER IS
    v_total_citas NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO v_total_citas
    FROM cita
    WHERE id_usuario = p_id_usuario
      AND fecha >= TRUNC(SYSDATE);

    RETURN NVL(v_total_citas, 0);
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20032, 'Error al contar citas pendientes: ' || SQLERRM);
  END contar_citas_pendientes_por_usuario;

  PROCEDURE listar_productos_disponibles IS
  BEGIN
    FOR r IN (SELECT id_producto, nombre, descripcion, stock, precio
              FROM producto
              WHERE stock > 0) LOOP
      DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ', Stock: ' || r.stock || ', Precio: ' || r.precio);
    END LOOP;
  END listar_productos_disponibles;

  PROCEDURE listar_usuarios_con_citas_pendientes IS
  BEGIN
    FOR r IN (SELECT DISTINCT u.id_usuario, u.nombre, u.apellido
              FROM usuario u
              JOIN cita c ON u.id_usuario = c.id_usuario
              WHERE c.fecha >= TRUNC(SYSDATE)) LOOP
      DBMS_OUTPUT.PUT_LINE('Usuario: ' || r.nombre || ' ' || r.apellido);
    END LOOP;
  END listar_usuarios_con_citas_pendientes;
END estadisticas_pkg;
/

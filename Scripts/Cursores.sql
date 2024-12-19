SET SERVEROUTPUT ON;

-- Cursor 1: Obtener todos los usuarios activos
DECLARE
  v_count NUMBER;
BEGIN
  -- Contar los usuarios activos
  SELECT COUNT(*) INTO v_count
  FROM usuario
  WHERE fecha_fin IS NULL;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No hay usuarios activos.');
  ELSE
    FOR r IN (SELECT id_usuario, nombre, apellido, fecha_creacion
              FROM usuario
              WHERE fecha_fin IS NULL) LOOP
      DBMS_OUTPUT.PUT_LINE('Usuario: ' || r.nombre || ' ' || r.apellido || ', Fecha Creación: ' || r.fecha_creacion);
    END LOOP;
  END IF;
END;
/

-- Cursor 2: Obtener todas las mascotas de un usuario
DECLARE
  p_id_usuario NUMBER := 1; -- ID del usuario a filtrar
  v_count NUMBER;
BEGIN
  -- Contar las mascotas del usuario
  SELECT COUNT(*) INTO v_count
  FROM mascota m
  WHERE m.id_usuario = p_id_usuario;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No se encontraron mascotas para el usuario ' || p_id_usuario);
  ELSE
    FOR r IN (SELECT m.id_mascota, m.nombre, m.especie, m.raza, m.edad
              FROM mascota m
              WHERE m.id_usuario = p_id_usuario) LOOP
      DBMS_OUTPUT.PUT_LINE('Mascota: ' || r.nombre || ', Especie: ' || r.especie || ', Raza: ' || r.raza || ', Edad: ' || r.edad);
    END LOOP;
  END IF;
END;
/

-- Cursor 3: Obtener todos los proveedores
DECLARE
  v_count NUMBER;
BEGIN
  -- Contar los proveedores
  SELECT COUNT(*) INTO v_count
  FROM proveedor;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No hay proveedores registrados.');
  ELSE
    FOR r IN (SELECT id_proveedor, nombre, descripcion, telefono, email
              FROM proveedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Proveedor: ' || r.nombre || ', Descripción: ' || r.descripcion || ', Teléfono: ' || r.telefono || ', Email: ' || r.email);
    END LOOP;
  END IF;
END;
/

-- Cursor 4: Obtener todos los productos de un proveedor
DECLARE
  p_id_proveedor NUMBER := 1; -- ID del proveedor a filtrar
  v_count NUMBER;
BEGIN
  -- Contar los productos del proveedor
  SELECT COUNT(*) INTO v_count
  FROM producto p
  WHERE p.id_proveedor = p_id_proveedor;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No hay productos para el proveedor ' || p_id_proveedor);
  ELSE
    FOR r IN (SELECT p.id_producto, p.nombre, p.descripcion, p.stock, p.precio
              FROM producto p
              WHERE p.id_proveedor = p_id_proveedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ', Descripción: ' || r.descripcion || ', Stock: ' || r.stock || ', Precio: ' || r.precio);
    END LOOP;
  END IF;
END;
/

-- Cursor 5: Obtener todos los servicios de un proveedor
DECLARE
  p_id_proveedor NUMBER := 1; -- ID del proveedor a filtrar
  v_count NUMBER;
BEGIN
  -- Contar los servicios del proveedor
  SELECT COUNT(*) INTO v_count
  FROM servicio s
  WHERE s.id_proveedor = p_id_proveedor;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No hay servicios para el proveedor ' || p_id_proveedor);
  ELSE
    FOR r IN (SELECT s.id_servicio, s.nombre, s.descripcion, s.precio
              FROM servicio s
              WHERE s.id_proveedor = p_id_proveedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Servicio: ' || r.nombre || ', Descripción: ' || r.descripcion || ', Precio: ' || r.precio);
    END LOOP;
  END IF;
END;
/

-- Cursor 6: Obtener todas las citas programadas para una mascota
DECLARE
  p_id_mascota NUMBER := 1; -- ID de la mascota a filtrar
  v_count NUMBER;
BEGIN
  -- Contar las citas de la mascota
  SELECT COUNT(*) INTO v_count
  FROM cita c
  WHERE c.id_mascota = p_id_mascota;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No se encontraron citas para la mascota ' || p_id_mascota);
  ELSE
    FOR r IN (SELECT c.id_cita, c.fecha, c.hora, c.motivo, u.nombre AS usuario
              FROM cita c
              JOIN usuario u ON c.id_usuario = u.id_usuario
              WHERE c.id_mascota = p_id_mascota) LOOP
      DBMS_OUTPUT.PUT_LINE('Cita: ' || r.id_cita || ', Fecha: ' || r.fecha || ', Hora: ' || r.hora || ', Motivo: ' || r.motivo || ', Usuario: ' || r.usuario);
    END LOOP;
  END IF;
END;
/

-- Cursor 7: Obtener el historial médico de una mascota
DECLARE
  p_id_mascota NUMBER := 1; -- ID de la mascota a filtrar
  v_count NUMBER;
BEGIN
  -- Contar el historial médico de la mascota
  SELECT COUNT(*) INTO v_count
  FROM historial_medico h
  WHERE h.id_mascota = p_id_mascota;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No se encontró historial médico para la mascota ' || p_id_mascota);
  ELSE
    FOR r IN (SELECT h.id_historial, h.fecha, h.descripcion, u.nombre AS usuario
              FROM historial_medico h
              JOIN usuario u ON h.id_usuario = u.id_usuario
              WHERE h.id_mascota = p_id_mascota) LOOP
      DBMS_OUTPUT.PUT_LINE('Historial: ' || r.id_historial || ', Fecha: ' || r.fecha || ', Descripción: ' || r.descripcion || ', Usuario: ' || r.usuario);
    END LOOP;
  END IF;
END;
/

-- Cursor 8: Obtener todos los tratamientos realizados para una mascota
DECLARE
  p_id_mascota NUMBER := 1; -- ID de la mascota a filtrar
  v_count NUMBER;
BEGIN
  -- Contar los tratamientos de la mascota
  SELECT COUNT(*) INTO v_count
  FROM tratamiento t
  WHERE t.id_historial IN (SELECT id_historial
                            FROM historial_medico
                            WHERE id_mascota = p_id_mascota);

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No se encontraron tratamientos para la mascota ' || p_id_mascota);
  ELSE
    FOR r IN (SELECT t.id_tratamiento, t.descripcion, t.medicina, t.duracion, p.nombre AS producto
              FROM tratamiento t
              LEFT JOIN producto p ON t.id_producto = p.id_producto
              WHERE t.id_historial IN (SELECT id_historial
                                        FROM historial_medico
                                        WHERE id_mascota = p_id_mascota)) LOOP
      DBMS_OUTPUT.PUT_LINE('Tratamiento: ' || r.descripcion || ', Medicina: ' || r.medicina || ', Duración: ' || r.duracion || ', Producto: ' || r.producto);
    END LOOP;
  END IF;
END;
/

-- Cursor 9: Obtener todos los productos disponibles (stock > 0)
DECLARE
  v_count NUMBER;
BEGIN
  -- Contar los productos disponibles
  SELECT COUNT(*) INTO v_count
  FROM producto
  WHERE stock > 0;

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No hay productos disponibles en stock.');
  ELSE
    FOR r IN (SELECT id_producto, nombre, descripcion, stock, precio
              FROM producto
              WHERE stock > 0) LOOP
      DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ', Descripción: ' || r.descripcion || ', Stock: ' || r.stock || ', Precio: ' || r.precio);
    END LOOP;
  END IF;
END;
/

-- Cursor 10: Obtener todos los usuarios con citas pendientes
DECLARE
  v_count NUMBER;
BEGIN
  -- Contar los usuarios con citas pendientes
  SELECT COUNT(DISTINCT u.id_usuario) INTO v_count
  FROM usuario u
  JOIN cita c ON u.id_usuario = c.id_usuario
  WHERE c.fecha >= TRUNC(SYSDATE);

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No hay usuarios con citas pendientes.');
  ELSE
    FOR r IN (SELECT DISTINCT u.id_usuario, u.nombre, u.apellido
              FROM usuario u
              JOIN cita c ON u.id_usuario = c.id_usuario
              WHERE c.fecha >= TRUNC(SYSDATE)) LOOP
      DBMS_OUTPUT.PUT_LINE('Usuario: ' || r.nombre || ' ' || r.apellido);
    END LOOP;
  END IF;
END;
/


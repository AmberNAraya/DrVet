-- Trigger 1: Actualizar el stock de productos después de insertar un tratamiento
CREATE OR REPLACE TRIGGER actualizar_stock_producto
AFTER INSERT ON tratamiento
FOR EACH ROW
BEGIN
  UPDATE producto
  SET stock = stock - 1
  WHERE id_producto = :NEW.id_producto;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 2: Prevenir citas duplicadas para la misma fecha y hora
CREATE OR REPLACE TRIGGER prevenir_citas_duplicadas
BEFORE INSERT ON cita
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM cita
  WHERE fecha = :NEW.fecha AND hora = :NEW.hora AND id_mascota = :NEW.id_mascota;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Ya existe una cita para esta mascota en la misma fecha y hora.');
  END IF;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 3: Actualizar la fecha de modificación de un usuario
CREATE OR REPLACE TRIGGER actualizar_fecha_usuario
BEFORE UPDATE ON usuario
FOR EACH ROW
BEGIN
  :NEW.fecha_actualizacion := SYSDATE;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 4: Registrar en el historial médico después de insertar un tratamiento
CREATE OR REPLACE TRIGGER registrar_historial_tratamiento
AFTER INSERT ON tratamiento
FOR EACH ROW
BEGIN
  INSERT INTO historial_medico (id_historial, descripcion, fecha, id_mascota, id_usuario)
  VALUES (seq_historial_medico.NEXTVAL, 'Tratamiento realizado', SYSDATE, 
          (SELECT id_mascota FROM historial_medico WHERE id_historial = :NEW.id_historial), 
          :NEW.id_usuario);
END;
/
-- ----------------------------------------------------------------------

-- Trigger 5: Validar que el stock de productos no sea negativo
CREATE OR REPLACE TRIGGER validar_stock_producto
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
  IF :NEW.stock < 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'El stock no puede ser negativo.');
  END IF;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 6: Notificar después de insertar un nuevo proveedor
CREATE OR REPLACE TRIGGER notificar_nuevo_proveedor
AFTER INSERT ON proveedor
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Nuevo proveedor registrado: ' || :NEW.nombre);
END;
/
-- ----------------------------------------------------------------------

-- Trigger 7: Prevenir la eliminación de usuarios con mascotas activas
CREATE OR REPLACE TRIGGER prevenir_eliminacion_usuario
BEFORE DELETE ON usuario
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM mascota
  WHERE id_usuario = :OLD.id_usuario;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20003, 'No se puede eliminar un usuario con mascotas activas.');
  END IF;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 8: Validar la duración de tratamientos antes de insertar
CREATE OR REPLACE TRIGGER validar_duracion_tratamiento
BEFORE INSERT OR UPDATE ON tratamiento
FOR EACH ROW
BEGIN
  IF :NEW.duracion <= 0 THEN
    RAISE_APPLICATION_ERROR(-20004, 'La duración del tratamiento debe ser mayor a 0.');
  END IF;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 9: Prevenir eliminación de productos en uso por tratamientos
CREATE OR REPLACE TRIGGER prevenir_eliminacion_producto
BEFORE DELETE ON producto
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM tratamiento
  WHERE id_producto = :OLD.id_producto;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20005, 'No se puede eliminar un producto en uso en tratamientos.');
  END IF;
END;
/
-- ----------------------------------------------------------------------

-- Trigger 10: Registrar la última modificación en ubicaciones
CREATE OR REPLACE TRIGGER registrar_modificacion_ubicacion
BEFORE UPDATE ON ubicacion
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('La ubicación ' || :OLD.nombre || ' ha sido modificada.');
END;
/
-- ----------------------------------------------------------------------

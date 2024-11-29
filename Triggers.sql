-- Trigger para auditar la inserción de usuarios
CREATE OR REPLACE TRIGGER trg_auditar_usuario_insert
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
  INSERT INTO auditoria (ID_Auditoria, Accion, Tabla, Fecha, Usuario)
  VALUES (auditoria_seq.NEXTVAL, 'INSERT', 'usuarios', SYSDATE, USER);
END trg_auditar_usuario_insert;
/

-- Trigger para auditar la actualización de productos
CREATE OR REPLACE TRIGGER trg_auditar_producto_update
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
  INSERT INTO auditoria (ID_Auditoria, Accion, Tabla, Fecha, Usuario)
  VALUES (auditoria_seq.NEXTVAL, 'UPDATE', 'productos', SYSDATE, USER);
END trg_auditar_producto_update;
/

-- Trigger para auditar la eliminación de mascotas
CREATE OR REPLACE TRIGGER trg_auditar_mascota_delete
AFTER DELETE ON mascota
FOR EACH ROW
BEGIN
  INSERT INTO auditoria (ID_Auditoria, Accion, Tabla, Fecha, Usuario)
  VALUES (auditoria_seq.NEXTVAL, 'DELETE', 'mascota', SYSDATE, USER);
END trg_auditar_mascota_delete;
/

-- Trigger para evitar insertar productos con stock negativo
CREATE OR REPLACE TRIGGER trg_prevenir_stock_negativo
BEFORE INSERT OR UPDATE ON productos
FOR EACH ROW
BEGIN
  IF :NEW.Stock < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'El stock no puede ser negativo.');
  END IF;
END trg_prevenir_stock_negativo;
/

-- Trigger para asegurar que no se agenden citas para mascotas desactivadas
CREATE OR REPLACE TRIGGER trg_prevenir_cita_mascota_inactiva
BEFORE INSERT ON citas
FOR EACH ROW
BEGIN
  DECLARE
    v_estado VARCHAR2(10);
  BEGIN
    SELECT Estado INTO v_estado FROM mascota WHERE ID_Mascota = :NEW.ID_Mascota;
    IF v_estado = 'Inactivo' THEN
      RAISE_APPLICATION_ERROR(-20002, 'No se puede agendar cita para una mascota desactivada.');
    END IF;
  END;
END trg_prevenir_cita_mascota_inactiva;
/

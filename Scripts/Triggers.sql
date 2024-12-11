-- Trigger 1: Actualizar el stock de los medicamentos luego de una venta
CREATE OR REPLACE TRIGGER actualizar_stock_medicamento
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
  UPDATE medicamento
  SET stock = stock - :NEW.cantidad
  WHERE id_medicamento = :NEW.id_medicamento;
END;
/

-- Trigger 2: Verificar si se puede registrar una cita
CREATE OR REPLACE TRIGGER verificar_cita_disponible
BEFORE INSERT ON cita
FOR EACH ROW
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM cita
  WHERE fecha = :NEW.fecha AND hora = :NEW.hora;
  
  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'La cita ya está ocupada para este horario.');
  END IF;
END;
/

-- Trigger 3: Notificar cuando se inserta una nueva cita
CREATE OR REPLACE TRIGGER notificar_nueva_cita
AFTER INSERT ON cita
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Se ha creado una nueva cita para la mascota con ID ' || :NEW.id_mascota || 
                       ' en la fecha: ' || TO_CHAR(:NEW.fecha, 'DD-MM-YYYY') || 
                       ' y hora: ' || TO_CHAR(:NEW.hora, 'HH24:MI:SS'));
END;
/

-- Trigger 4: Mostrar última inserción de examen
CREATE OR REPLACE TRIGGER mostrar_ultima_insercion_examen
AFTER INSERT ON examen
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Última inserción de examen realizada en: ' || TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH24:MI:SS'));
END;
/

-- Trigger 5: Validar que el teléfono solo contenga caracteres numéricos
CREATE OR REPLACE TRIGGER validar_telefono_administrador
BEFORE INSERT OR UPDATE ON administrador
FOR EACH ROW
BEGIN
  IF :NEW.telefono IS NOT NULL AND NOT REGEXP_LIKE(:NEW.telefono, '^[0-9]+$') THEN
    RAISE_APPLICATION_ERROR(-20005, 'El teléfono solo debe contener números.');
  END IF;
END;
/

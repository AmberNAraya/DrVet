--Nueva columna de tabla citas (Asistencia)

-- Tabla Citas
CREATE TABLE citas (
  ID_Cita NUMBER PRIMARY KEY,
  Fecha DATE DEFAULT NULL,
  Hora DATE DEFAULT NULL,
  Motivo VARCHAR2(255) DEFAULT NULL,
  ID_Mascota NUMBER,
  ID_Usuario NUMBER,
  Asistencia VARCHAR2(10), --nueva columna
  CONSTRAINT citas_fk_mascota FOREIGN KEY (ID_Mascota)
    REFERENCES mascota (ID_Mascota),
  CONSTRAINT citas_fk_usuario FOREIGN KEY (ID_Usuario)
    REFERENCES usuarios (ID_Usuario)
);


--Citas
/*
1. Crear cita
2. Modificar cita
3. Cancelar cita
4. Reprogramar cita
5. Consultar citas
6. Confirmar si asistio o no
*/

--Crea cita
CREATE OR REPLACE PROCEDURE crear_cita(
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2,
    p_id_mascota IN NUMBER,
    p_id_usuario IN NUMBER
) IS
BEGIN
    INSERT INTO citas (ID_Cita, Fecha, Hora, Motivo, ID_Mascota, ID_Usuario)
    VALUES (p_id_cita, p_fecha, p_hora, p_motivo, p_id_mascota, p_id_usuario);
END crear_cita;
/



--Modificar cita
CREATE OR REPLACE PROCEDURE modificar_cita(
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE,
    p_motivo IN VARCHAR2
) IS
BEGIN
    UPDATE citas
    SET Fecha = p_fecha,
        Hora = p_hora,
        Motivo = p_motivo
    WHERE ID_Cita = p_id_cita;
END modificar_cita;
/



--cancelar cita
CREATE OR REPLACE PROCEDURE cancelar_cita(
    p_id_cita IN NUMBER
) IS
BEGIN
    DELETE FROM citas
    WHERE ID_Cita = p_id_cita;
END cancelar_cita;
/



--Programa una cita
CREATE OR REPLACE PROCEDURE reprogramar_cita(
    p_id_cita IN NUMBER,
    p_nueva_fecha IN DATE,
    p_nueva_hora IN DATE
) IS
BEGIN
    UPDATE citas
    SET Fecha = p_nueva_fecha,
        Hora = p_nueva_hora
    WHERE ID_Cita = p_id_cita;
END reprogramar_cita;
/



--consulta de cita
CREATE OR REPLACE PROCEDURE consultar_citas(
    p_id_usuario IN NUMBER
) IS
BEGIN
    FOR rec IN (SELECT * FROM citas WHERE ID_Usuario = p_id_usuario) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Cita: ' || rec.ID_Cita || ', Fecha: ' || rec.Fecha || ', Hora: ' || rec.Hora || ', Motivo: ' || rec.Motivo);
    END LOOP;
END consultar_citas;
/



--Confirmar asistencia
CREATE OR REPLACE PROCEDURE marcar_asistencia(
    p_id_cita IN NUMBER,
    p_asistencia IN VARCHAR2
) IS
BEGIN
    -- Verificar asistencia ('Sí' o 'No')
    IF p_asistencia NOT IN ('Sí', 'No') THEN
        DBMS_OUTPUT.PUT_LINE('Valor de asistencia inválido. Use "Sí" o "No".');
        RETURN;
    END IF;

    -- Actualizar la columna de asistencia en la tabla citas
    UPDATE citas
    SET Asistencia = p_asistencia
    WHERE ID_Cita = p_id_cita;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una cita con el ID proporcionado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La asistencia para la cita con ID ' || p_id_cita || ' ha sido actualizada a: ' || p_asistencia);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al marcar la asistencia: ' || SQLERRM);
END marcar_asistencia;
/

--Ejecucion
-- Marcar asistencia como "Sí" para la cita con ID 1
EXEC marcar_asistencia(1, 'Sí');

-- Marcar asistencia como "No" para la cita con ID 2
EXEC marcar_asistencia(2, 'No');
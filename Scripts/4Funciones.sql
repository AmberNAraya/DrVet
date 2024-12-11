-- Obtener el nombre completo del usuario
CREATE OR REPLACE FUNCTION obtener_nombre_completo_usuario(ID IN NUMBER) RETURN VARCHAR2 AS
  nombre_completo VARCHAR2(100);
BEGIN
  SELECT nombre || ' ' || apellido INTO nombre_completo
  FROM usuario
  WHERE id_usuario = ID;
  RETURN nombre_completo;
END;
/

-- Calcular el número de mascotas de un usuario
CREATE OR REPLACE FUNCTION contar_mascotas_usuario(ID IN NUMBER) RETURN NUMBER AS
  total_mascotas NUMBER;
BEGIN
  SELECT COUNT(*) INTO total_mascotas
  FROM mascota
  WHERE id_usuario = ID;
  RETURN total_mascotas;
END;
/

-- Calcular el total de stock de productos
CREATE OR REPLACE FUNCTION calcular_stock_total RETURN NUMBER AS
  total_stock NUMBER;
BEGIN
  SELECT SUM(stock) INTO total_stock
  FROM producto;
  RETURN total_stock;
END;
/

-- Precio promedio de los servicios
CREATE OR REPLACE FUNCTION precio_promedio_servicios RETURN NUMBER AS
  promedio NUMBER;
BEGIN
  SELECT AVG(precio) INTO promedio
  FROM servicio;
  RETURN promedio;
END;
/

-- Verificar disponibilidad de productos
CREATE OR REPLACE FUNCTION verificar_disponibilidad_producto(ID IN NUMBER) RETURN VARCHAR2 AS
  resultado VARCHAR2(50);
BEGIN
  SELECT CASE WHEN stock > 0 THEN 'Disponible' ELSE 'Agotado' END INTO resultado
  FROM producto
  WHERE id_producto = ID;
  RETURN resultado;
END;
/

-- Obtener los ingresos estimados por servicios
CREATE OR REPLACE FUNCTION ingresos_estimados RETURN NUMBER AS
  total_ingresos NUMBER;
BEGIN
  SELECT SUM(precio) INTO total_ingresos
  FROM servicio;
  RETURN total_ingresos;
END;
/

-- Obtener el número total de citas de un usuario
CREATE OR REPLACE FUNCTION total_citas_usuario(ID IN NUMBER) RETURN NUMBER AS
  total_citas NUMBER;
BEGIN
  SELECT COUNT(*) INTO total_citas
  FROM cita
  WHERE id_usuario = ID;
  RETURN total_citas;
END;
/

-- Obtener el proveedor con más productos
CREATE OR REPLACE FUNCTION proveedor_mas_productos RETURN VARCHAR2 AS
  nombre_proveedor VARCHAR2(100);
BEGIN
  SELECT p.nombre INTO nombre_proveedor
  FROM proveedor p
  JOIN producto pr ON p.id_proveedor = pr.id_proveedor
  GROUP BY p.nombre
  ORDER BY COUNT(pr.id_producto) DESC
  FETCH FIRST 1 ROWS ONLY;
  RETURN nombre_proveedor;
END;
/

-- Calcular el tiempo total de tratamientos
CREATE OR REPLACE FUNCTION tiempo_total_tratamientos RETURN NUMBER AS
  total_tiempo NUMBER;
BEGIN
  SELECT SUM(duracion) INTO total_tiempo
  FROM tratamiento;
  RETURN total_tiempo;
END;
/

-- Determinar si una mascota tiene historial médico
CREATE OR REPLACE FUNCTION tiene_historial_medico(p_ID IN NUMBER) RETURN VARCHAR2 AS
  cantidad NUMBER;
  resultado VARCHAR2(50);
BEGIN
  SELECT COUNT(*) INTO cantidad
  FROM historial_medico
  WHERE id_mascota = p_ID;

  IF cantidad > 0 THEN
    resultado := 'Sí tiene historial';
  ELSE
    resultado := 'No tiene historial';
  END IF;

  RETURN resultado;
EXCEPTION
  WHEN OTHERS THEN
    RETURN 'Error al verificar el historial';
END;
/

-- Calcular el total de gastos de un usuario en citas y servicios
CREATE OR REPLACE FUNCTION calcular_gastos_usuario(ID IN NUMBER) RETURN NUMBER AS
  total_gastos NUMBER;
BEGIN
  SELECT COALESCE(SUM(s.precio), 0)
  INTO total_gastos
  FROM cita c
  JOIN servicio s ON c.id_usuario = ID
  WHERE c.id_usuario = ID;

  RETURN total_gastos;
END;
/

-- Obtener el proveedor de un producto específico
CREATE OR REPLACE FUNCTION obtener_proveedor_producto(ID IN NUMBER) RETURN VARCHAR2 AS
  proveedor_nombre VARCHAR2(100);
BEGIN
  SELECT p.nombre
  INTO proveedor_nombre
  FROM producto prod
  JOIN proveedor p ON prod.id_proveedor = p.id_proveedor
  WHERE prod.id_producto = ID;

  RETURN proveedor_nombre;
END;
/

-- Contar tratamientos realizados para una mascota específica
CREATE OR REPLACE FUNCTION contar_tratamientos_mascota(ID IN NUMBER) RETURN NUMBER AS
  total_tratamientos NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO total_tratamientos
  FROM tratamiento t
  JOIN historial_medico h ON t.id_historial = h.id_historial
  WHERE h.id_mascota = ID;

  RETURN total_tratamientos;
END;
/

-- Verificar si un usuario tiene citas pendientes
CREATE OR REPLACE FUNCTION verificar_citas_pendientes(p_ID IN NUMBER) RETURN VARCHAR2 AS
  cantidad NUMBER;
  resultado VARCHAR2(20);
BEGIN
  SELECT COUNT(*)
  INTO cantidad
  FROM cita
  WHERE id_usuario = p_ID
    AND fecha >= TRUNC(SYSDATE); 

  IF cantidad > 0 THEN
    resultado := 'Citas pendientes';
  ELSE
    resultado := 'Sin citas pendientes';
  END IF;

  RETURN resultado;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Sin información';
  WHEN OTHERS THEN
    RETURN 'Error al verificar citas';
END;
/

-- Obtener el nombre de la última mascota registrada
CREATE OR REPLACE FUNCTION ultima_mascota_registrada RETURN VARCHAR2 AS
  nombre_mascota VARCHAR2(50);
BEGIN
  SELECT nombre
  INTO nombre_mascota
  FROM mascota
  WHERE id_mascota = (SELECT MAX(id_mascota) FROM mascota);

  RETURN nombre_mascota;
END;
/

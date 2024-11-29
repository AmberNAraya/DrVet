CREATE OR REPLACE FUNCTION obtener_nombre_completo_usuario(ID IN NUMBER) RETURN VARCHAR2 AS
  nombre_completo VARCHAR2(100);
BEGIN
  SELECT Nombre || ' ' || Apellido INTO nombre_completo
  FROM usuarios
  WHERE ID_Usuario = ID;
  RETURN nombre_completo;
END;

CREATE OR REPLACE FUNCTION contar_mascotas_usuario(ID IN NUMBER) RETURN NUMBER AS
  total_mascotas NUMBER;
BEGIN
  SELECT COUNT(*) INTO total_mascotas
  FROM mascota
  WHERE ID_Usuario = ID;
  RETURN total_mascotas;
END;

CREATE OR REPLACE FUNCTION calcular_stock_total RETURN NUMBER AS
  total_stock NUMBER;
BEGIN
  SELECT SUM(Stock) INTO total_stock
  FROM productos;
  RETURN total_stock;
END;

CREATE OR REPLACE FUNCTION precio_promedio_servicios RETURN NUMBER AS
  promedio NUMBER;
BEGIN
  SELECT AVG(Precio) INTO promedio
  FROM servicios;
  RETURN promedio;
END;

CREATE OR REPLACE FUNCTION verificar_disponibilidad_producto(ID IN NUMBER) RETURN VARCHAR2 AS
  resultado VARCHAR2(50);
BEGIN
  SELECT CASE WHEN Stock > 0 THEN 'Disponible' ELSE 'Agotado' END INTO resultado
  FROM productos
  WHERE ID_Producto = ID;
  RETURN resultado;
END;

CREATE OR REPLACE FUNCTION ingresos_estimados RETURN NUMBER AS
  total_ingresos NUMBER;
BEGIN
  SELECT SUM(Precio) INTO total_ingresos
  FROM servicios;
  RETURN total_ingresos;
END;

CREATE OR REPLACE FUNCTION total_citas_usuario(ID IN NUMBER) RETURN NUMBER AS
  total_citas NUMBER;
BEGIN
  SELECT COUNT(*) INTO total_citas
  FROM citas
  WHERE ID_Usuario = ID;
  RETURN total_citas;
END;

CREATE OR REPLACE FUNCTION proveedor_mas_productos RETURN VARCHAR2 AS
  nombre_proveedor VARCHAR2(100);
BEGIN
  SELECT p.Nombre INTO nombre_proveedor
  FROM proveedores p
  JOIN productos pr ON p.ID_Proveedor = pr.ID_Proveedor
  GROUP BY p.Nombre
  ORDER BY COUNT(pr.ID_Producto) DESC
  FETCH FIRST 1 ROWS ONLY;
  RETURN nombre_proveedor;
END;

CREATE OR REPLACE FUNCTION tiempo_total_tratamientos RETURN NUMBER AS
  total_tiempo NUMBER;
BEGIN
  SELECT SUM(Duracion) INTO total_tiempo
  FROM tratamientos;
  RETURN total_tiempo;
END;

CREATE OR REPLACE FUNCTION tiene_historial_medico(p_ID IN NUMBER) RETURN VARCHAR2 AS
  cantidad NUMBER;
  resultado VARCHAR2(50);
BEGIN
  SELECT COUNT(*)
  INTO cantidad
  FROM historial_medico
  WHERE ID_Mascota = p_ID;

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

CREATE OR REPLACE FUNCTION calcular_gastos_usuario(ID IN NUMBER) RETURN NUMBER AS
  total_gastos NUMBER;
BEGIN
  SELECT COALESCE(SUM(s.Precio), 0)
  INTO total_gastos
  FROM citas c
  JOIN servicios s ON c.ID_Usuario = ID
  WHERE c.ID_Usuario = ID;

  RETURN total_gastos;
END;

CREATE OR REPLACE FUNCTION obtener_proveedor_producto(ID IN NUMBER) RETURN VARCHAR2 AS
  proveedor_nombre VARCHAR2(100);
BEGIN
  SELECT p.Nombre
  INTO proveedor_nombre
  FROM productos prod
  JOIN proveedores p ON prod.ID_Proveedor = p.ID_Proveedor
  WHERE prod.ID_Producto = ID;

  RETURN proveedor_nombre;
END;

CREATE OR REPLACE FUNCTION contar_tratamientos_mascota(ID IN NUMBER) RETURN NUMBER AS
  total_tratamientos NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO total_tratamientos
  FROM tratamientos t
  JOIN historial_medico h ON t.ID_Historial = h.ID_Historial
  WHERE h.ID_Mascota = ID;

  RETURN total_tratamientos;
END;

CREATE OR REPLACE FUNCTION verificar_citas_pendientes(p_ID IN NUMBER) RETURN VARCHAR2 AS
  cantidad NUMBER;
  resultado VARCHAR2(20);
BEGIN
  SELECT COUNT(*)
  INTO cantidad
  FROM citas
  WHERE ID_Usuario = p_ID
    AND Fecha >= TRUNC(SYSDATE); 

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

CREATE OR REPLACE FUNCTION ultima_mascota_registrada RETURN VARCHAR2 AS
  nombre_mascota VARCHAR2(50);
BEGIN
  SELECT Nombre
  INTO nombre_mascota
  FROM mascota
  WHERE ROWNUM = 1
  ORDER BY ID_Mascota DESC;

  RETURN nombre_mascota;
END;

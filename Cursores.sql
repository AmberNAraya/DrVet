-- Cursor 1: Obtener todos los usuarios activos
CURSOR c_usuarios_activos IS
  SELECT ID_Usuario, Nombre, Apellido, Fecha_Creacion
  FROM usuarios
  WHERE Fecha_Fin IS NULL;

-- Cursor 2: Obtener todas las mascotas de un usuario
CURSOR c_mascotas_por_usuario (p_id_usuario IN NUMBER) IS
  SELECT m.ID_Mascota, m.Nombre, m.Especie, m.Raza, m.Edad
  FROM mascota m
  WHERE m.ID_Usuario = p_id_usuario;

-- Cursor 3: Obtener todos los proveedores
CURSOR c_proveedores IS
  SELECT ID_Proveedor, Nombre, Descripcion, Telefono, Email
  FROM proveedores;

-- Cursor 4: Obtener todos los productos de un proveedor
CURSOR c_productos_por_proveedor (p_id_proveedor IN NUMBER) IS
  SELECT p.ID_Producto, p.Nombre, p.Descripcion, p.Stock, p.Precio
  FROM productos p
  WHERE p.ID_Proveedor = p_id_proveedor;

-- Cursor 5: Obtener todos los servicios de un proveedor
CURSOR c_servicios_por_proveedor (p_id_proveedor IN NUMBER) IS
  SELECT s.ID_Servicio, s.Nombre, s.Descripcion, s.Precio
  FROM servicios s
  WHERE s.ID_Proveedor = p_id_proveedor;

-- Cursor 6: Obtener todas las citas programadas para una mascota
CURSOR c_citas_por_mascota (p_id_mascota IN NUMBER) IS
  SELECT c.ID_Cita, c.Fecha, c.Hora, c.Motivo, u.Nombre AS Usuario
  FROM citas c
  JOIN usuarios u ON c.ID_Usuario = u.ID_Usuario
  WHERE c.ID_Mascota = p_id_mascota;

-- Cursor 7: Obtener el historial médico de una mascota
CURSOR c_historial_medico_por_mascota (p_id_mascota IN NUMBER) IS
  SELECT h.ID_Historial, h.Fecha, h.Descripcion, u.Nombre AS Usuario
  FROM historial_medico h
  JOIN usuarios u ON h.ID_Usuario = u.ID_Usuario
  WHERE h.ID_Mascota = p_id_mascota;

-- Cursor 8: Obtener todos los tratamientos realizados para una mascota
CURSOR c_tratamientos_por_mascota (p_id_mascota IN NUMBER) IS
  SELECT t.ID_Tratamiento, t.Descripcion, t.Medicina, t.Duracion, p.Nombre AS Producto
  FROM tratamientos t
  JOIN productos p ON t.ID_Producto = p.ID_Producto
  WHERE t.ID_Mascota = p_id_mascota;

-- Cursor 9: Obtener todas las ubicaciones registradas
CURSOR c_ubicaciones IS
  SELECT ID_Ubicacion, Nombre, Direccion
  FROM ubicaciones;

-- Cursor 10: Obtener todos los productos en stock de un proveedor
CURSOR c_productos_en_stock_por_proveedor (p_id_proveedor IN NUMBER) IS
  SELECT p.ID_Producto, p.Nombre, p.Stock
  FROM productos p
  WHERE p.ID_Proveedor = p_id_proveedor AND p.Stock > 0;

-- Cursor 11: Obtener todos los servicios que cuestan más de 500
CURSOR c_servicios_costosos IS
  SELECT s.ID_Servicio, s.Nombre, s.Precio
  FROM servicios s
  WHERE s.Precio > 500;

-- Cursor 12: Obtener todas las mascotas con más de 5 años de edad
CURSOR c_mascotas_mayores_de_5_anios IS
  SELECT m.ID_Mascota, m.Nombre, m.Especie, m.Raza, m.Edad
  FROM mascota m
  WHERE m.Edad > 5;

-- Cursor 13: Obtener todos los tratamientos realizados en una fecha específica
CURSOR c_tratamientos_por_fecha (p_fecha IN DATE) IS
  SELECT t.ID_Tratamiento, t.Descripcion, t.Medicina, t.Duracion, m.Nombre AS Mascota
  FROM tratamientos t
  JOIN mascota m ON t.ID_Mascota = m.ID_Mascota
  WHERE t.Fecha = p_fecha;

-- Cursor 14: Obtener todas las citas de una fecha específica
CURSOR c_citas_por_fecha (p_fecha IN DATE) IS
  SELECT c.ID_Cita, c.Fecha, c.Hora, c.Motivo, u.Nombre AS Usuario, m.Nombre AS Mascota
  FROM citas c
  JOIN usuarios u ON c.ID_Usuario = u.ID_Usuario
  JOIN mascota m ON c.ID_Mascota = m.ID_Mascota
  WHERE c.Fecha = p_fecha;

-- Cursor 15: Obtener todos los proveedores con productos en stock
CURSOR c_proveedores_con_productos_en_stock IS
  SELECT p.Nombre AS Proveedor, prod.Nombre AS Producto, prod.Stock
  FROM proveedores p
  JOIN productos prod ON p.ID_Proveedor = prod.ID_Proveedor
  WHERE prod.Stock > 0;

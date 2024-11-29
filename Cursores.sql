Revert "Commit"
This reverts commit 8d1684a23f9d3de62c865d087cded2dc42953073.
f0e344a
Cursores.sql
@@ -1,94 +0,0 @@
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
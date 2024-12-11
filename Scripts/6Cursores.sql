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
  LEFT JOIN productos p ON t.ID_Producto = p.ID_Producto
  WHERE t.ID_Historial IN (
    SELECT ID_Historial
    FROM historial_medico
    WHERE ID_Mascota = p_id_mascota
  );

-- Cursor 9: Obtener todos los productos disponibles (stock > 0)
CURSOR c_productos_disponibles IS
  SELECT ID_Producto, Nombre, Descripcion, Stock, Precio
  FROM productos
  WHERE Stock > 0;

-- Cursor 10: Obtener todos los usuarios con citas pendientes
CURSOR c_usuarios_con_citas IS
  SELECT DISTINCT u.ID_Usuario, u.Nombre, u.Apellido
  FROM usuarios u
  JOIN citas c ON u.ID_Usuario = c.ID_Usuario
  WHERE c.Fecha >= TRUNC(SYSDATE);

-- Cursor 11: Obtener las citas programadas para un usuario específico
CURSOR c_citas_por_usuario (p_id_usuario IN NUMBER) IS
  SELECT ID_Cita, Fecha, Hora, Motivo
  FROM citas
  WHERE ID_Usuario = p_id_usuario;

-- Cursor 12: Obtener todos los medicamentos de un proveedor específico
CURSOR c_medicamentos_por_proveedor (p_id_proveedor IN NUMBER) IS
  SELECT ID_Medicamento, Nombre, Descripcion, Precio, Stock, Fecha_Vencimiento
  FROM medicamentos
  WHERE ID_Proveedor = p_id_proveedor;

-- Cursor 13: Obtener las ubicaciones registradas
CURSOR c_ubicaciones IS
  SELECT ID_Ubicacion, Nombre, Direccion
  FROM ubicaciones;

-- Cursor 14: Obtener los tratamientos asociados a un producto específico
CURSOR c_tratamientos_por_producto (p_id_producto IN NUMBER) IS
  SELECT t.ID_Tratamiento, t.Descripcion, t.Medicina, t.Duracion
  FROM tratamientos t
  WHERE t.ID_Producto = p_id_producto;

-- Cursor 15: Obtener todas las citas pasadas para un usuario
CURSOR c_citas_pasadas_por_usuario (p_id_usuario IN NUMBER) IS
  SELECT ID_Cita, Fecha, Hora, Motivo
  FROM citas
  WHERE ID_Usuario = p_id_usuario
    AND Fecha < TRUNC(SYSDATE);

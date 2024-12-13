-- Vista de Usuarios y sus Mascotas
CREATE OR REPLACE VIEW vista_usuarios_mascotas AS
SELECT u.Nombre AS Usuario,
       u.Apellido AS Apellido_Usuario,
       m.Nombre AS Mascota,
       m.Especie,
       m.Raza,
       m.Edad
FROM usuario u
JOIN mascota m ON u.ID_Usuario = m.ID_Usuario;

-- Vista de Servicios ofrecidos por Proveedores
CREATE OR REPLACE VIEW vista_servicios_proveedores AS
SELECT s.Nombre AS Servicio,
       s.Precio,
       p.Nombre AS Proveedor
FROM servicio s
JOIN proveedor p ON s.ID_Proveedor = p.ID_Proveedor;

-- Vista de Productos con su Stock
CREATE OR REPLACE VIEW vista_productos_stock AS
SELECT p.Nombre AS Producto,
       p.Stock,
       p.Precio,
       pr.Nombre AS Proveedor
FROM producto p
JOIN proveedor pr ON p.ID_Proveedor = pr.ID_Proveedor;

-- Vista de Historial Médico de Mascotas
CREATE OR REPLACE VIEW vista_historial_medico AS
SELECT h.ID_Historial,
       h.Fecha,
       m.Nombre AS Mascota,
       u.Nombre AS Usuario,
       h.Descripcion
FROM historial_medico h
JOIN mascota m ON h.ID_Mascota = m.ID_Mascota
JOIN usuario u ON h.ID_Usuario = u.ID_Usuario;

-- Vista de Tratamientos realizados
CREATE OR REPLACE VIEW vista_tratamientos AS
SELECT t.ID_Tratamiento,
       t.Descripcion,
       t.Medicina,
       t.Duracion,
       m.Nombre AS Mascota,
       p.Nombre AS Producto
FROM tratamiento t
JOIN historial_medico h ON t.ID_Historial = h.ID_Historial
JOIN mascota m ON h.ID_Mascota = m.ID_Mascota
LEFT JOIN producto p ON t.ID_Producto = p.ID_Producto;

-- Vista de Citas programadas por Usuarios
CREATE OR REPLACE VIEW vista_citas_usuarios AS
SELECT c.Fecha,
       c.Hora,
       c.Motivo,
       m.Nombre AS Mascota,
       u.Nombre AS Usuario
FROM cita c
JOIN mascota m ON c.ID_Mascota = m.ID_Mascota
JOIN usuario u ON c.ID_Usuario = u.ID_Usuario;

-- Vista de Servicios más costosos
CREATE OR REPLACE VIEW vista_servicios_costosos AS
SELECT Nombre AS Servicio,
       Precio
FROM servicio
WHERE Precio > 500;

-- Vista de Usuarios activos
CREATE OR REPLACE VIEW vista_usuarios_activos AS
SELECT u.ID_Usuario,
       u.Nombre,
       u.Apellido,
       u.Fecha_Creacion,
       COUNT(m.ID_Mascota) AS Total_Mascotas
FROM usuario u
LEFT JOIN mascota m ON u.ID_Usuario = m.ID_Usuario
WHERE u.Fecha_Fin IS NULL
GROUP BY u.ID_Usuario, u.Nombre, u.Apellido, u.Fecha_Creacion;

-- Vista de Ubicaciones registradas
CREATE OR REPLACE VIEW vista_ubicaciones AS
SELECT ID_Ubicacion,
       Nombre,
       Direccion
FROM ubicacion;

-- Vista de Proveedores con Productos
CREATE OR REPLACE VIEW vista_proveedores_productos AS
SELECT p.Nombre AS Proveedor,
       prod.Nombre AS Producto,
       prod.Stock
FROM proveedor p
JOIN producto prod ON p.ID_Proveedor = prod.ID_Proveedor;

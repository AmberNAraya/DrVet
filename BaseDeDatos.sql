-- Crear tablas en el orden correcto
-- Tabla Usuarios
CREATE TABLE usuarios (
  ID_Usuario NUMBER PRIMARY KEY,
  Nombre VARCHAR2(50) DEFAULT NULL,
  Apellido VARCHAR2(50) DEFAULT NULL,
  Telefono VARCHAR2(20) DEFAULT NULL,
  Email VARCHAR2(50) DEFAULT NULL,
  Rol VARCHAR2(50) DEFAULT 'Usuario', -- Puede ser 'Administrador' o 'Usuario'
  Fecha_Creacion DATE DEFAULT SYSDATE, -- Fecha de creación del registro
  Fecha_Actualizacion DATE DEFAULT NULL, -- Fecha de la última actualización
  Fecha_Fin DATE DEFAULT NULL -- Fecha de baja del usuario (opcional)
);

-- Tabla Proveedores
CREATE TABLE proveedores (
  ID_Proveedor NUMBER PRIMARY KEY,
  Nombre VARCHAR2(100) DEFAULT NULL,
  Descripcion CLOB DEFAULT NULL,
  Telefono VARCHAR2(20) DEFAULT NULL,
  Email VARCHAR2(50) DEFAULT NULL
);

-- Tabla Mascotas
CREATE TABLE mascota (
  ID_Mascota NUMBER PRIMARY KEY,
  Nombre VARCHAR2(50) DEFAULT NULL,
  Especie VARCHAR2(50) DEFAULT NULL,
  Raza VARCHAR2(50) DEFAULT NULL,
  Edad NUMBER DEFAULT NULL,
  ID_Usuario NUMBER,
  CONSTRAINT mascota_fk_usuario FOREIGN KEY (ID_Usuario)
    REFERENCES usuarios (ID_Usuario)
);

-- Tabla Productos
CREATE TABLE productos (
  ID_Producto NUMBER PRIMARY KEY,
  Nombre VARCHAR2(100) DEFAULT NULL,
  Descripcion CLOB DEFAULT NULL,
  Stock NUMBER DEFAULT NULL,
  Precio NUMBER(10,2) DEFAULT NULL,
  ID_Proveedor NUMBER,
  CONSTRAINT productos_fk_proveedor FOREIGN KEY (ID_Proveedor)
    REFERENCES proveedores (ID_Proveedor)
);

-- Tabla Servicios
CREATE TABLE servicios (
  ID_Servicio NUMBER PRIMARY KEY,
  Nombre VARCHAR2(100) DEFAULT NULL,
  Descripcion CLOB DEFAULT NULL,
  Precio NUMBER(10,2) DEFAULT NULL,
  ID_Proveedor NUMBER,
  CONSTRAINT servicios_fk_proveedor FOREIGN KEY (ID_Proveedor)
    REFERENCES proveedores (ID_Proveedor)
);

-- Tabla Citas
CREATE TABLE citas (
  ID_Cita NUMBER PRIMARY KEY,
  Fecha DATE DEFAULT NULL,
  Hora DATE DEFAULT NULL,
  Motivo VARCHAR2(255) DEFAULT NULL,
  ID_Mascota NUMBER,
  ID_Usuario NUMBER,
  CONSTRAINT citas_fk_mascota FOREIGN KEY (ID_Mascota)
    REFERENCES mascota (ID_Mascota),
  CONSTRAINT citas_fk_usuario FOREIGN KEY (ID_Usuario)
    REFERENCES usuarios (ID_Usuario)
);

-- Tabla Historial Médico
CREATE TABLE historial_medico (
  ID_Historial NUMBER PRIMARY KEY,
  Descripcion CLOB DEFAULT NULL,
  Fecha DATE DEFAULT NULL,
  ID_Mascota NUMBER,
  ID_Usuario NUMBER,
  CONSTRAINT historial_medico_fk_mascota FOREIGN KEY (ID_Mascota)
    REFERENCES mascota (ID_Mascota),
  CONSTRAINT historial_medico_fk_usuario FOREIGN KEY (ID_Usuario)
    REFERENCES usuarios (ID_Usuario)
);

-- Tabla Tratamientos
CREATE TABLE tratamientos (
  ID_Tratamiento NUMBER PRIMARY KEY,
  Descripcion CLOB DEFAULT NULL,
  Medicina VARCHAR2(100) DEFAULT NULL,
  Duracion NUMBER DEFAULT NULL,
  ID_Historial NUMBER,
  ID_Producto NUMBER,
  ID_Usuario NUMBER,
  CONSTRAINT tratamientos_fk_historial FOREIGN KEY (ID_Historial)
    REFERENCES historial_medico (ID_Historial),
  CONSTRAINT tratamientos_fk_producto FOREIGN KEY (ID_Producto)
    REFERENCES productos (ID_Producto),
  CONSTRAINT tratamientos_fk_usuario FOREIGN KEY (ID_Usuario)
    REFERENCES usuarios (ID_Usuario)
);

-- Tabla Ubicaciones
CREATE TABLE ubicaciones (
  ID_Ubicacion NUMBER PRIMARY KEY,
  Nombre VARCHAR2(255) NOT NULL,
  Direccion VARCHAR2(255) NOT NULL
);

-- Insertar usuarios
INSERT INTO usuarios (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
VALUES (1, 'Juan', 'Pérez', '5551234567', 'juan.perez@email.com', 'Usuario', SYSDATE);

INSERT INTO usuarios (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
VALUES (2, 'Ana', 'Gómez', '5552345678', 'ana.gomez@email.com', 'Administrador', SYSDATE);

INSERT INTO usuarios (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
VALUES (3, 'Carlos', 'Sánchez', '5553456789', 'carlos.sanchez@email.com', 'Usuario', SYSDATE);

INSERT INTO usuarios (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
VALUES (4, 'Laura', 'Martínez', '5554567890', 'laura.martinez@email.com', 'Usuario', SYSDATE);

INSERT INTO usuarios (ID_Usuario, Nombre, Apellido, Telefono, Email, Rol, Fecha_Creacion)
VALUES (5, 'Pedro', 'López', '5555678901', 'pedro.lopez@email.com', 'Administrador', SYSDATE);

-- Insertar proveedores
INSERT INTO proveedores (ID_Proveedor, Nombre, Descripcion, Telefono, Email)
VALUES (1, 'Veterinaria San José', 'Servicios veterinarios de calidad', '5553456789', 'veterinaria@sanjose.com');

INSERT INTO proveedores (ID_Proveedor, Nombre, Descripcion, Telefono, Email)
VALUES (2, 'Pet Supplies', 'Venta de productos para mascotas', '5554567890', 'petsupplies@email.com');

INSERT INTO proveedores (ID_Proveedor, Nombre, Descripcion, Telefono, Email)
VALUES (3, 'Paw Care', 'Cuidado y servicios para mascotas', '5555678902', 'pawcare@email.com');

-- Insertar mascotas
INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Usuario)
VALUES (1, 'Firulais', 'Perro', 'Labrador', 3, 1);

INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Usuario)
VALUES (2, 'Miau', 'Gato', 'Siames', 2, 2);

INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Usuario)
VALUES (3, 'Rocky', 'Perro', 'Bulldog', 5, 3);

INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Usuario)
VALUES (4, 'Luna', 'Gato', 'Persa', 4, 4);

INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Usuario)
VALUES (5, 'Bella', 'Perro', 'Beagle', 2, 5);

-- Insertar productos
INSERT INTO productos (ID_Producto, Nombre, Descripcion, Stock, Precio, ID_Proveedor)
VALUES (1, 'Comida Perro', 'Comida balanceada para perros', 50, 200.00, 2);

INSERT INTO productos (ID_Producto, Nombre, Descripcion, Stock, Precio, ID_Proveedor)
VALUES (2, 'Arena Gato', 'Arena sanitaria para gatos', 100, 50.00, 2);

INSERT INTO productos (ID_Producto, Nombre, Descripcion, Stock, Precio, ID_Proveedor)
VALUES (3, 'Juguete Perro', 'Pelota para perro', 200, 15.00, 3);

INSERT INTO productos (ID_Producto, Nombre, Descripcion, Stock, Precio, ID_Proveedor)
VALUES (4, 'Cama Gato', 'Cama cómoda para gatos', 75, 60.00, 2);

-- Insertar servicios
INSERT INTO servicios (ID_Servicio, Nombre, Descripcion, Precio, ID_Proveedor)
VALUES (1, 'Consulta Veterinaria', 'Consulta general para mascotas', 300.00, 1);

INSERT INTO servicios (ID_Servicio, Nombre, Descripcion, Precio, ID_Proveedor)
VALUES (2, 'Vacunación', 'Vacuna anual para perros y gatos', 150.00, 1);

INSERT INTO servicios (ID_Servicio, Nombre, Descripcion, Precio, ID_Proveedor)
VALUES (3, 'Peluquería Canina', 'Corte de pelo para perros', 120.00, 3);

INSERT INTO servicios (ID_Servicio, Nombre, Descripcion, Precio, ID_Proveedor)
VALUES (4, 'Desparacitación', 'Desparacitación para mascotas', 80.00, 1);

-- Insertar citas
INSERT INTO citas (ID_Cita, Fecha, Hora, Motivo, ID_Mascota, ID_Usuario)
VALUES (1, TO_DATE('2024-11-25', 'YYYY-MM-DD'), TO_DATE('10:00:00', 'HH24:MI:SS'), 'Consulta médica', 1, 1);

INSERT INTO citas (ID_Cita, Fecha, Hora, Motivo, ID_Mascota, ID_Usuario)
VALUES (2, TO_DATE('2024-11-26', 'YYYY-MM-DD'), TO_DATE('14:00:00', 'HH24:MI:SS'), 'Vacunación', 2, 2);

INSERT INTO citas (ID_Cita, Fecha, Hora, Motivo, ID_Mascota, ID_Usuario)
VALUES (3, TO_DATE('2024-11-27', 'YYYY-MM-DD'), TO_DATE('09:00:00', 'HH24:MI:SS'), 'Peluquería', 3, 3);

INSERT INTO citas (ID_Cita, Fecha, Hora, Motivo, ID_Mascota, ID_Usuario)
VALUES (4, TO_DATE('2024-11-28', 'YYYY-MM-DD'), TO_DATE('16:00:00', 'HH24:MI:SS'), 'Desparacitación', 4, 4);

-- Insertar historial médico
INSERT INTO historial_medico (ID_Historial, Descripcion, Fecha, ID_Mascota, ID_Usuario)
VALUES (1, 'Consulta de rutina y revisión general', TO_DATE('2024-11-25', 'YYYY-MM-DD'), 1, 1);

INSERT INTO historial_medico (ID_Historial, Descripcion, Fecha, ID_Mascota, ID_Usuario)
VALUES (2, 'Vacunación anual contra rabia', TO_DATE('2024-11-26', 'YYYY-MM-DD'), 2, 2);

-- Insertar tratamientos
INSERT INTO tratamientos (ID_Tratamiento, Descripcion, Medicina, Duracion, ID_Historial, ID_Producto, ID_Usuario)
VALUES (1, 'Tratamiento para pulgas', 'Fipronil', 30, 1, 1, 1);

INSERT INTO tratamientos (ID_Tratamiento, Descripcion, Medicina, Duracion, ID_Historial, ID_Producto, ID_Usuario)
VALUES (2, 'Antibióticos para infección', 'Amoxicilina', 15, 2, 2, 2);

-- Insertar ubicaciones
INSERT INTO ubicaciones (ID_Ubicacion, Nombre, Direccion)
VALUES (1, 'Veterinaria San José', 'Calle 123, Ciudad, País');

INSERT INTO ubicaciones (ID_Ubicacion, Nombre, Direccion)
VALUES (2, 'Pet Supplies', 'Avenida 456, Ciudad, País');


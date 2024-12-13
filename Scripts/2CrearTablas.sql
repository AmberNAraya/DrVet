-- Tabla Usuarios
CREATE TABLE usuario (
  id_usuario NUMBER PRIMARY KEY,
  nombre VARCHAR2(50) DEFAULT NULL,
  apellido VARCHAR2(50) DEFAULT NULL,
  telefono VARCHAR2(20) DEFAULT NULL,
  email VARCHAR2(50) DEFAULT NULL,
  rol VARCHAR2(50) DEFAULT 'Usuario',
  fecha_creacion DATE DEFAULT SYSDATE,
  fecha_actualizacion DATE DEFAULT NULL,
  fecha_fin DATE DEFAULT NULL
);

-- Tabla Proveedores
CREATE TABLE proveedor (
  id_proveedor NUMBER PRIMARY KEY,
  nombre VARCHAR2(100) DEFAULT NULL,
  descripcion CLOB DEFAULT NULL,
  telefono VARCHAR2(20) DEFAULT NULL,
  email VARCHAR2(50) DEFAULT NULL
);

-- Tabla Mascotas
CREATE TABLE mascota (
  id_mascota NUMBER PRIMARY KEY,
  nombre VARCHAR2(50) DEFAULT NULL,
  especie VARCHAR2(50) DEFAULT NULL,
  raza VARCHAR2(50) DEFAULT NULL,
  edad NUMBER DEFAULT NULL,
  id_usuario NUMBER,
  CONSTRAINT fk_mascota_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
);

-- Tabla Productos
CREATE TABLE producto (
  id_producto NUMBER PRIMARY KEY,
  nombre VARCHAR2(100) DEFAULT NULL,
  descripcion CLOB DEFAULT NULL,
  stock NUMBER DEFAULT NULL,
  precio NUMBER(10,2) DEFAULT NULL,
  id_proveedor NUMBER,
  CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES proveedor (id_proveedor)
);

-- Tabla Servicios
CREATE TABLE servicio (
  id_servicio NUMBER PRIMARY KEY,
  nombre VARCHAR2(100) DEFAULT NULL,
  descripcion CLOB DEFAULT NULL,
  precio NUMBER(10,2) DEFAULT NULL,
  id_proveedor NUMBER,
  CONSTRAINT fk_servicio_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES proveedor (id_proveedor)
);

-- Tabla Citas
CREATE TABLE cita (
  id_cita NUMBER PRIMARY KEY,
  fecha DATE DEFAULT NULL,
  hora DATE DEFAULT NULL,
  motivo VARCHAR2(255) DEFAULT NULL,
  id_mascota NUMBER,
  id_usuario NUMBER,
  Asistencia VARCHAR2(10),
  CONSTRAINT fk_cita_mascota FOREIGN KEY (id_mascota)
    REFERENCES mascota (id_mascota),
  CONSTRAINT fk_cita_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
);

-- Tabla Historial Médico
CREATE TABLE historial_medico (
  id_historial NUMBER PRIMARY KEY,
  descripcion CLOB DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  id_mascota NUMBER,
  id_usuario NUMBER,
  CONSTRAINT fk_historial_mascota FOREIGN KEY (id_mascota)
    REFERENCES mascota (id_mascota),
  CONSTRAINT fk_historial_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
);

-- Tabla Tratamientos
CREATE TABLE tratamiento (
  id_tratamiento NUMBER PRIMARY KEY,
  descripcion CLOB DEFAULT NULL,
  medicina VARCHAR2(100) DEFAULT NULL,
  duracion NUMBER DEFAULT NULL,
  id_historial NUMBER,
  id_producto NUMBER,
  id_usuario NUMBER,
  CONSTRAINT fk_tratamiento_historial FOREIGN KEY (id_historial)
    REFERENCES historial_medico (id_historial),
  CONSTRAINT fk_tratamiento_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto),
  CONSTRAINT fk_tratamiento_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
);

-- Tabla Ubicaciones
CREATE TABLE ubicacion (
  id_ubicacion NUMBER PRIMARY KEY,
  nombre VARCHAR2(255) NOT NULL,
  direccion VARCHAR2(255) NOT NULL
);

-- Tabla Medicamentos (opcional)
CREATE TABLE medicamento (
  id_medicamento NUMBER PRIMARY KEY,
  nombre VARCHAR2(100),
  descripcion CLOB,
  precio NUMBER(10,2),
  stock NUMBER,
  fecha_vencimiento DATE DEFAULT NULL,
  id_proveedor NUMBER,
  CONSTRAINT fk_medicamento_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES proveedor (id_proveedor)
);

-- Tabla Exámenes (opcional)
CREATE TABLE examen (
  id_examen NUMBER PRIMARY KEY,
  tipo VARCHAR2(50),
  fecha DATE,
  resultado CLOB,
  id_mascota NUMBER,
  CONSTRAINT fk_examen_mascota FOREIGN KEY (id_mascota)
    REFERENCES mascota (id_mascota)
);

-- Tabla Clientes (opcional)
CREATE TABLE cliente (
  id_cliente NUMBER PRIMARY KEY,
  nombre VARCHAR2(100),
  apellido VARCHAR2(100),
  direccion VARCHAR2(255),
  telefono VARCHAR2(20),
  email VARCHAR2(100)
);

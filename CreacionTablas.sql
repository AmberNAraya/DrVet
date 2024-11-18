-- -----------------------------------------------------
-- Tabla administrador
-- -----------------------------------------------------
CREATE TABLE administrador (
  ID_Administrador NUMBER PRIMARY KEY,
  Nombre VARCHAR2(50) DEFAULT NULL,
  Apellido VARCHAR2(50) DEFAULT NULL,
  Telefono VARCHAR2(20) DEFAULT NULL,
  Email VARCHAR2(50) DEFAULT NULL,
  Rol VARCHAR2(50) DEFAULT NULL
);

-- -----------------------------------------------------
-- Tabla cliente
-- -----------------------------------------------------
CREATE TABLE cliente (
  ID_Cliente NUMBER PRIMARY KEY,
  Nombre VARCHAR2(50) DEFAULT NULL,
  Apellido VARCHAR2(50) DEFAULT NULL,
  Direccion VARCHAR2(100) DEFAULT NULL,
  Telefono VARCHAR2(20) DEFAULT NULL,
  Email VARCHAR2(50) DEFAULT NULL
);

-- -----------------------------------------------------
-- Tabla mascota
-- -----------------------------------------------------
CREATE TABLE mascota (
  ID_Mascota NUMBER PRIMARY KEY,
  Nombre VARCHAR2(50) DEFAULT NULL,
  Especie VARCHAR2(50) DEFAULT NULL,
  Raza VARCHAR2(50) DEFAULT NULL,
  Edad NUMBER DEFAULT NULL,
  ID_Cliente NUMBER,
  CONSTRAINT mascota_fk_cliente FOREIGN KEY (ID_Cliente)
    REFERENCES cliente (ID_Cliente)
);

-- -----------------------------------------------------
-- Tabla veterinario
-- -----------------------------------------------------
CREATE TABLE veterinario (
  ID_Veterinario NUMBER PRIMARY KEY,
  Nombre VARCHAR2(50) DEFAULT NULL,
  Apellido VARCHAR2(50) DEFAULT NULL,
  Especialidad VARCHAR2(50) DEFAULT NULL,
  Telefono VARCHAR2(20) DEFAULT NULL,
  Email VARCHAR2(50) DEFAULT NULL
);

-- -----------------------------------------------------
-- Tabla citas
-- -----------------------------------------------------
CREATE TABLE citas (
  ID_Cita NUMBER PRIMARY KEY,
  Fecha DATE DEFAULT NULL,
  Hora DATE DEFAULT NULL, -- Use DATE for both date and time in Oracle
  Motivo VARCHAR2(255) DEFAULT NULL,
  ID_Mascota NUMBER,
  ID_Veterinario NUMBER,
  ID_Administrador NUMBER,
  CONSTRAINT citas_fk_mascota FOREIGN KEY (ID_Mascota)
    REFERENCES mascota (ID_Mascota),
  CONSTRAINT citas_fk_veterinario FOREIGN KEY (ID_Veterinario)
    REFERENCES veterinario (ID_Veterinario),
  CONSTRAINT citas_fk_administrador FOREIGN KEY (ID_Administrador)
    REFERENCES administrador (ID_Administrador)
);

-- -----------------------------------------------------
-- Tabla proveedores
-- -----------------------------------------------------
CREATE TABLE proveedores (
  ID_Proveedor NUMBER PRIMARY KEY,
  Nombre VARCHAR2(100) DEFAULT NULL,
  Descripcion CLOB DEFAULT NULL,
  Telefono VARCHAR2(20) DEFAULT NULL,
  Email VARCHAR2(50) DEFAULT NULL
);

-- -----------------------------------------------------
-- Tabla servicios
-- -----------------------------------------------------
CREATE TABLE servicios (
  ID_Servicio NUMBER PRIMARY KEY,
  Nombre VARCHAR2(100) DEFAULT NULL,
  Descripcion CLOB DEFAULT NULL,
  Precio NUMBER(10,2) DEFAULT NULL,
  ID_Proveedor NUMBER,
  CONSTRAINT servicios_fk_proveedor FOREIGN KEY (ID_Proveedor)
    REFERENCES proveedores (ID_Proveedor)
);

-- -----------------------------------------------------
-- Tabla examenes
-- -----------------------------------------------------
CREATE TABLE examenes (
  ID_Examen NUMBER PRIMARY KEY,
  Descripcion CLOB DEFAULT NULL,
  Duracion NUMBER DEFAULT NULL,
  Precio NUMBER(10,2) DEFAULT NULL,
  ID_Servicio NUMBER,
  CONSTRAINT examenes_fk_servicio FOREIGN KEY (ID_Servicio)
    REFERENCES servicios (ID_Servicio)
);

-- -----------------------------------------------------
-- Tabla medicamentos
-- -----------------------------------------------------
CREATE TABLE medicamentos (
  ID_Medicamento NUMBER PRIMARY KEY,
  Nombre VARCHAR2(100) DEFAULT NULL,
  Descripcion CLOB DEFAULT NULL,
  Stock NUMBER DEFAULT NULL,
  Precio NUMBER(10,2) DEFAULT NULL,
  ID_Proveedor NUMBER,
  CONSTRAINT medicamentos_fk_proveedor FOREIGN KEY (ID_Proveedor)
    REFERENCES proveedores (ID_Proveedor)
);

-- -----------------------------------------------------
-- Tabla facturas
-- -----------------------------------------------------
CREATE TABLE facturas (
  ID_Factura NUMBER PRIMARY KEY,
  Fecha DATE DEFAULT NULL,
  Monto NUMBER(10,2) DEFAULT NULL,
  ID_Cita NUMBER,
  ID_Cliente NUMBER,
  ID_Servicio NUMBER,
  ID_Medicamento NUMBER,
  ID_Administrador NUMBER,
  CONSTRAINT facturas_fk_cita FOREIGN KEY (ID_Cita)
    REFERENCES citas (ID_Cita),
  CONSTRAINT facturas_fk_cliente FOREIGN KEY (ID_Cliente)
    REFERENCES cliente (ID_Cliente),
  CONSTRAINT facturas_fk_servicio FOREIGN KEY (ID_Servicio)
    REFERENCES servicios (ID_Servicio),
  CONSTRAINT facturas_fk_medicamento FOREIGN KEY (ID_Medicamento)
    REFERENCES medicamentos (ID_Medicamento),
  CONSTRAINT facturas_fk_administrador FOREIGN KEY (ID_Administrador)
    REFERENCES administrador (ID_Administrador)
);

-- -----------------------------------------------------
-- Tabla historial_medico
-- -----------------------------------------------------
CREATE TABLE historial_medico (
  ID_Historial NUMBER PRIMARY KEY,
  Descripcion CLOB DEFAULT NULL,
  Fecha DATE DEFAULT NULL,
  ID_Mascota NUMBER,
  ID_Veterinario NUMBER,
  CONSTRAINT historial_medico_fk_mascota FOREIGN KEY (ID_Mascota)
    REFERENCES mascota (ID_Mascota),
  CONSTRAINT historial_medico_fk_veterinario FOREIGN KEY (ID_Veterinario)
    REFERENCES veterinario (ID_Veterinario)
);

-- -----------------------------------------------------
-- Tabla tratamientos
-- -----------------------------------------------------
CREATE TABLE tratamientos (
  ID_Tratamiento NUMBER PRIMARY KEY,
  Descripcion CLOB DEFAULT NULL,
  Medicina VARCHAR2(100) DEFAULT NULL,
  Duracion NUMBER DEFAULT NULL,
  ID_Historial NUMBER,
  ID_Medicamento NUMBER,
  CONSTRAINT tratamientos_fk_historial FOREIGN KEY (ID_Historial)
    REFERENCES historial_medico (ID_Historial),
  CONSTRAINT tratamientos_fk_medicamento FOREIGN KEY (ID_Medicamento)
    REFERENCES medicamentos (ID_Medicamento)
);
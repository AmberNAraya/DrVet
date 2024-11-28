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

--=======================================================Pablo=============================================================

---------------------------------------------Inserciones de veterinarios-------------------------------------------------------
-- Veterinario 1
INSERT INTO veterinario (ID_Veterinario, Nombre, Apellido, Especialidad, Telefono, Email)
VALUES (1, 'Jose', 'Pablo', 'Cirujano', '555-1234', 'Pablo90@veterinaria.com');

-- Veterinario 2
INSERT INTO veterinario (ID_Veterinario, Nombre, Apellido, Especialidad, Telefono, Email)
VALUES (2, 'Sofia', 'Gómez', 'Dermatología', '555-5678', 'sofiaGomez@veterinaria.com');

-- Veterinario 3
INSERT INTO veterinario (ID_Veterinario, Nombre, Apellido, Especialidad, Telefono, Email)
VALUES (3, 'Axel', 'Rodríguez', 'Odontología', '555-9101', 'Axelrodriguez@veterinaria.com');

-- Veterinario 4
INSERT INTO veterinario (ID_Veterinario, Nombre, Apellido, Especialidad, Telefono, Email)
VALUES (4, 'Laura', 'Martínez', 'Medicina General', '555-1122', 'ZZZmartinez@veterinaria.com');




-------------------------------------------Inserciones de clientes, usuarios----------------------------------------------------
/*
INSERT INTO cliente (ID_Cliente, Nombre, Apellido, Direccion, Telefono, Email) 
VALUES (1, 'Leonardo', 'DiCaprio', 'Sunset Boulevard 101', '5551234567', 'LeoDicaprio@email.com');

INSERT INTO cliente (ID_Cliente, Nombre, Apellido, Direccion, Telefono, Email) 
VALUES (2, 'Emma', 'Watson', 'Hollywood Avenue 202', '5552345678', 'watson@email.com');                         Insercion de usuarios opcional

INSERT INTO cliente (ID_Cliente, Nombre, Apellido, Direccion, Telefono, Email) 
VALUES (3, 'Will', 'Smith', 'Broadway Street 303', '5553456789', 'Bad_Boy@email.com');

INSERT INTO cliente (ID_Cliente, Nombre, Apellido, Direccion, Telefono, Email) 
VALUES (4, 'Scarlett', 'Johansson', 'Ocean Drive 404', '5554567890', 'scarlettjohansson@email.com');
*/
----------------------------------------------------- Paquete veterinarios-------------------------------------------------------
-- Paquete veterinarios
CREATE OR REPLACE PACKAGE veterinarios_pkg AS
  PROCEDURE insertar_veterinario(p_id IN NUMBER, p_nombre IN VARCHAR2, p_apellido IN VARCHAR2, p_especialidad IN VARCHAR2, p_telefono IN VARCHAR2, p_email IN VARCHAR2);
  FUNCTION obtener_veterinario(p_id IN NUMBER) RETURN VARCHAR2;
END veterinarios_pkg;
/

-- Cuerpo del paquete veterinarios
CREATE OR REPLACE PACKAGE BODY veterinarios_pkg AS
  PROCEDURE insertar_veterinario(p_id IN NUMBER, p_nombre IN VARCHAR2, p_apellido IN VARCHAR2, p_especialidad IN VARCHAR2, p_telefono IN VARCHAR2, p_email IN VARCHAR2) IS
  BEGIN
    -- Insertar nuevo veterinario
    INSERT INTO veterinario (ID_Veterinario, Nombre, Apellido, Especialidad, Telefono, Email)
    VALUES (p_id, p_nombre, p_apellido, p_especialidad, p_telefono, p_email);
  END insertar_veterinario;

  FUNCTION obtener_veterinario(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(50); -- Variable para almacenar el nombre del veterinario
  BEGIN
  
    --nombre del veterinario por ID
    SELECT Nombre INTO v_nombre FROM veterinario WHERE ID_Veterinario = p_id;
    RETURN v_nombre; -- Retorno del nombre del veterinario
  END obtener_veterinario;

END veterinarios_pkg;
/


---------------------------------------------------------------------- Paquete2 clientes---------------------------------------------------------------------
-- Paquete clientes
CREATE OR REPLACE PACKAGE clientes_pkg AS
  PROCEDURE insertar_cliente(p_id IN NUMBER, p_nombre IN VARCHAR2, p_apellido IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2, p_email IN VARCHAR2);
  FUNCTION obtener_cliente(p_id IN NUMBER) RETURN VARCHAR2;
END clientes_pkg;
/

-- Cuerpo del paquete clientes
CREATE OR REPLACE PACKAGE BODY clientes_pkg AS
  PROCEDURE insertar_cliente(p_id IN NUMBER, p_nombre IN VARCHAR2, p_apellido IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2, p_email IN VARCHAR2) IS
  BEGIN
    -- nuevo cliente en tabla cliente
    INSERT INTO cliente (ID_Cliente, Nombre, Apellido, Direccion, Telefono, Email)
    VALUES (p_id, p_nombre, p_apellido, p_direccion, p_telefono, p_email);
  END insertar_cliente;

  FUNCTION obtener_cliente(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(50); -- Variable almacenar nombre del cliente
  BEGIN
    -- sELECIONAR Nombre del cliente basado SEGUN E ID
    SELECT Nombre INTO v_nombre FROM cliente WHERE ID_Cliente = p_id;
    RETURN v_nombre; -- Retorno del nombre del cliente
  END obtener_cliente;

END clientes_pkg;
/

---------------------------------------------------------------Paquete 10----------------------------------------------------------------------------------------
-- registrar clientes y obtener el nombre por un ID
CREATE OR REPLACE PACKAGE clientes_pkg AS
  PROCEDURE registrar_cliente(p_id IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2);
  FUNCTION obtener_cliente(p_id IN NUMBER) RETURN VARCHAR2;
END clientes_pkg;
/

-- Cuerpo del paquete para registrar y obtener clientes
CREATE OR REPLACE PACKAGE BODY clientes_pkg AS
  -- registrar nuevo cliente en la base de datos
  PROCEDURE registrar_cliente(p_id IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_telefono IN VARCHAR2) IS
  BEGIN
    -- Insertar nuevo cliente en la tabla clientes
    INSERT INTO cliente (ID_Cliente, Nombre, Direccion, Telefono)
    VALUES (p_id, p_nombre, p_direccion, p_telefono);
  END registrar_cliente;

  -- Obtener el nombre de un cliente por su ID
  FUNCTION obtener_cliente(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(50); -- Almacenar el nombre del cliente
  BEGIN
    -- Obtener el nombre del cliente con un ID
    SELECT Nombre INTO v_nombre FROM cliente WHERE ID_Cliente = p_id;
    RETURN v_nombre; -- Devolver el nombre del cliente
  END obtener_cliente;

END CLIENTES_PKG;
/


---------------------------------------------------------------------- Paquete3 mascotas-------------------------------------------------------------------
-- Paquete de Mascotas
CREATE OR REPLACE PACKAGE mascotas_pkg AS
  -- Insertar una nueva mascota
  PROCEDURE insertar_mascota(
    p_id IN NUMBER, 
    p_nombre IN VARCHAR2, 
    p_especie IN VARCHAR2, 
    p_raza IN VARCHAR2, 
    p_edad IN NUMBER, 
    p_id_cliente IN NUMBER
  );
  
  -- Solicitar el nombre de una mascota por un ID
  FUNCTION obtener_mascota(p_id IN NUMBER) RETURN VARCHAR2;
  
END mascotas_pkg;
/


-- Cuerpo del Paquete de Mascotas
CREATE OR REPLACE PACKAGE BODY mascotas_pkg AS
  -- Insertar mascota
  PROCEDURE insertar_mascota(
    p_id IN NUMBER, 
    p_nombre IN VARCHAR2, 
    p_especie IN VARCHAR2, 
    p_raza IN VARCHAR2, 
    p_edad IN NUMBER, 
    p_id_cliente IN NUMBER
  ) IS
  BEGIN
    -- Insertar nueva mascota en la tabla mascota
    INSERT INTO mascota (ID_Mascota, Nombre, Especie, Raza, Edad, ID_Cliente)
    VALUES (p_id, p_nombre, p_especie, p_raza, p_edad, p_id_cliente);
  END insertar_mascota;

  --obtener mascota
  FUNCTION obtener_mascota(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(50);  -- Variable para almacenar el nombre de la mascota
  BEGIN
    -- en base a un ID nos devuelve el nombre de la mascota
    SELECT Nombre INTO v_nombre FROM mascota WHERE ID_Mascota = p_id;
    RETURN v_nombre;  --Muestra el nombre de la mascota
  END obtener_mascota;

END mascotas_pkg;


-------------------------------------------------------------------------Paquete4 facturas---------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE facturas_pkg AS
  -- Procedimiento para generar una factura
  PROCEDURE generar_factura(
    p_id IN NUMBER,          -- ID de la factura
    p_fecha IN DATE,         -- Fecha de la factura
    p_monto IN NUMBER,       -- Monto de la factura
    p_id_cliente IN NUMBER,  -- ID del cliente asociado
    p_id_mascota IN NUMBER   -- ID de la mascota asociada
  );

  -- Función para obtener el monto de una factura por su ID
  FUNCTION obtener_factura(p_id IN NUMBER) RETURN NUMBER;
END facturas_pkg;
/


  CREATE OR REPLACE PACKAGE BODY facturas_pkg AS
  -- Procedimiento para generar una factura
  PROCEDURE generar_factura(
    p_id IN NUMBER,
    p_fecha IN DATE, 
    p_monto IN NUMBER, 
    p_id_cliente IN NUMBER,  
    p_id_mascota IN NUMBER  
  ) IS
  BEGIN
    -- Insertar una nueva factura en tabla facturas
    INSERT INTO facturas (
      ID_Factura, 
      Fecha, 
      Monto, 
      ID_Cliente, 
      ID_Mascota
    )
    VALUES (
      p_id, 
      p_fecha, 
      p_monto, 
      p_id_cliente, 
      p_id_mascota
    );
  END generar_factura;

  -- obtener el monto apartir de un ID
  FUNCTION obtener_factura(p_id IN NUMBER) RETURN NUMBER IS
    v_monto NUMBER;  -- Variable para almacenar el monto de la factura
  BEGIN
    -- Obtener el monto de la factura de la tabla facturas
    SELECT Monto 
    INTO v_monto 
    FROM facturas 
    WHERE ID_Factura = p_id;

    -- Muestra el monto de la factura
    RETURN v_monto;
  END obtener_factura;

END facturas_pkg;
/

-------------------------------------------------------------------- Paquete5 citas---------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE citas_pkg AS
  --crear una cita
  PROCEDURE crear_cita(
    p_id IN NUMBER,  
    p_fecha IN DATE,  
    p_hora IN DATE,  
    p_motivo IN VARCHAR2, 
    p_id_mascota IN NUMBER,
    p_id_veterinario IN NUMBER 
  );

  --Obtener el motivo de una cita por su ID
  FUNCTION obtener_cita(p_id IN NUMBER) RETURN VARCHAR2;
END citas_pkg;
/


CREATE OR REPLACE PACKAGE BODY citas_pkg AS
  --crear una cita
  PROCEDURE crear_cita(
    p_id IN NUMBER,
    p_fecha IN DATE,
    p_hora IN DATE, 
    p_motivo IN VARCHAR2, 
    p_id_mascota IN NUMBER, 
    p_id_veterinario IN NUMBER 
  ) IS
  BEGIN
    -- Insertar una nueva cita en la tabla 'citas'
    INSERT INTO citas (
      ID_Cita, 
      Fecha, 
      Hora, 
      Motivo, 
      ID_Mascota, 
      ID_Veterinario
    )
    VALUES (
      p_id,
      p_fecha, 
      p_hora, 
      p_motivo, 
      p_id_mascota, 
      p_id_veterinario
    );
  END crear_cita;

  --Obtener razon de cita por su ID
  FUNCTION obtener_cita(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_motivo VARCHAR2(255);  -- Variable para almacenar el motivo de la cita
  BEGIN
    --Jala el motivo de la tabla citas
    SELECT Motivo 
    INTO v_motivo 
    FROM citas 
    WHERE ID_Cita = p_id;

    --MUEstra la razon de la cita
    RETURN v_motivo;
  END obtener_cita;

END citas_pkg;
/

----------------------------------------------------------------------- Paquete 6 servicios------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE servicios_pkg AS
  -- Registrar un servicio
  PROCEDURE registrar_servicio(
    p_id IN NUMBER, 
    p_nombre IN VARCHAR2, 
    p_descripcion IN CLOB,
    p_precio IN NUMBER, 
    p_id_proveedor IN NUMBER 
  );

  --obtener el nombre de un servicio por ID
  FUNCTION obtener_servicio(p_id IN NUMBER) RETURN VARCHAR2;
END servicios_pkg;
/



CREATE OR REPLACE PACKAGE BODY servicios_pkg AS             --======================PL/SQL: ORA-00942: la tabla o vista no existe==========================
  -- Registrar un servicio
  PROCEDURE registrar_servicio(
    p_id IN NUMBER, 
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER, 
    p_id_proveedor IN NUMBER  
  ) IS
  BEGIN
    -- Insertar nuevo servicio en la tabla servicios
    INSERT INTO veterinaria_lbd.servicios (
      ID_Servicio, 
      Nombre, 
      Descripcion, 
      Precio, 
      ID_Proveedor
    )
    VALUES (
      p_id, 
      p_nombre, 
      p_descripcion, 
      p_precio, 
      p_id_proveedor
    );
  END registrar_servicio;

  --Obtener nombre de servicio por el ID
  FUNCTION obtener_servicio(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(50);  -- Almacenar el nombre del servicio
  BEGIN
    --consulta el nombre del servicio de la tabla servicios
    SELECT Nombre 
    INTO v_nombre 
    FROM servicios 
    WHERE ID_Servicio = p_id;

    --devolver nombre del servicio
    RETURN v_nombre;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Servicio no encontrado'; --Manejo del procedimiento si no se encuentre el servicio
    WHEN OTHERS THEN
      RETURN 'Error al obtener servicio'; --En caso de error
  END obtener_servicio;

END servicios_pkg;
/


---------------------------------------------------------------- Paquete7 medicamentos detalles ----------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE medicamentos_pkg AS
  -- Registra medicamento
  PROCEDURE registrar_medicamento(
    p_id IN NUMBER, 
    p_nombre IN VARCHAR2, 
    p_descripcion IN CLOB, 
    p_precio IN NUMBER, 
    p_stock IN NUMBER, 
    p_id_proveedor IN NUMBER
  );

  -- Solicitar el nombre de un medicamento por ID
  FUNCTION obtener_medicamento(p_id IN NUMBER) RETURN VARCHAR2;
END medicamentos_pkg;
/



CREATE OR REPLACE PACKAGE BODY medicamentos_pkg AS
  -- Registrar un medicamento
  PROCEDURE registrar_medicamento(
    p_id IN NUMBER, 
    p_nombre IN VARCHAR2, 
    p_descripcion IN CLOB, 
    p_precio IN NUMBER, 
    p_stock IN NUMBER, 
    p_id_proveedor IN NUMBER
  ) IS
  BEGIN
    -- Insertar nuevo medicamento en la tabla medicamentos
    INSERT INTO medicamentos (
      ID_Medicamento, 
      Nombre, 
      Descripcion, 
      Precio, 
      Stock, 
      ID_Proveedor
    )
    VALUES (
      p_id, 
      p_nombre, 
      p_descripcion, 
      p_precio, 
      p_stock, 
      p_id_proveedor
    );
  END registrar_medicamento;

  -- Obtener el nombre de un medicamento por su ID
  FUNCTION obtener_medicamento(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
  BEGIN
    -- Se consulta el nombre del medicamento de la tabla medicamentos
    SELECT Nombre 
    INTO v_nombre 
    FROM medicamentos 
    WHERE ID_Medicamento = p_id;

    -- Devolver el nombre del medicamento
    RETURN v_nombre;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Medicamento no encontrado';  -- Manejo de caso donde no se encuentra el medicamento
    WHEN OTHERS THEN
      RETURN 'Error al obtener medicamento';  -- En caso de otro error
  END obtener_medicamento;

END medicamentos_pkg;
/


---------------------------------------------------------------- Paquete8 gestion de medicamentos vencidos ----------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE medicamentos_pkg AS
  -- Registrar la fecha de vencimiento del medicamento
  PROCEDURE registrar_vencimiento(
    p_id IN NUMBER, 
    p_fecha_vencimiento IN DATE
  );

  -- Comprobar si un medicamento está vencido
  FUNCTION es_vencido(p_id IN NUMBER) RETURN VARCHAR2;

  -- Eliminar medicamentos vencidos
  PROCEDURE eliminar_medicamentos_vencidos;
END medicamentos_pkg;
/

--la columna fecha de vencimiento no existe en la tabla medicamentos agregar aqui
ALTER TABLE medicamentos
ADD Fecha_Vencimiento DATE;



CREATE OR REPLACE PACKAGE BODY medicamentos_pkg AS
  --Registrar fecha vencimiento del medicamento
  PROCEDURE registrar_vencimiento(
    p_id IN NUMBER, 
    p_fecha_vencimiento IN DATE
  ) IS
  BEGIN
    UPDATE medicamentos
    SET Fecha_Vencimiento = p_fecha_vencimiento
    WHERE ID_Medicamento = p_id;
  END registrar_vencimiento;

  -- Comprobar si un medicamento se encuentra  vencido
  FUNCTION es_vencido(p_id IN NUMBER) RETURN VARCHAR2 IS
    v_fecha_vencimiento DATE;
  BEGIN
    --Pedir fecha vencimiento del medicamento
    SELECT Fecha_Vencimiento
    INTO v_fecha_vencimiento
    FROM medicamentos
    WHERE ID_Medicamento = p_id;

    --Comparala fecha de vencimiento con la actual
    IF v_fecha_vencimiento < SYSDATE THEN
      RETURN 'Medicamento vencido';
    ELSE
      RETURN 'Medicamento vigente';
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Medicamento no encontrado';
  END es_vencido;

  --eliminar medicamentos vencidos (es opcional consultar al grupo)
  PROCEDURE eliminar_medicamentos_vencidos IS
  BEGIN
    DELETE FROM medicamentos
    WHERE Fecha_Vencimiento < SYSDATE;
    COMMIT;
  END eliminar_medicamentos_vencidos;

END medicamentos_pkg;
/




-- Paquete de Historiale Medico
-------------------------------------------------------------Paquete9 historial_medico------------------------------------------------
CREATE OR REPLACE PACKAGE historial_medico_pkg AS
  --Crear nuevo historial medico
  PROCEDURE crear_historial(
    p_id IN NUMBER, 
    p_descripcion IN CLOB, 
    p_fecha IN DATE, 
    p_id_mascota IN NUMBER, 
    p_id_veterinario IN NUMBER
  );

  --Obtener el historial mdico por ID
  FUNCTION obtener_historial(p_id IN NUMBER) RETURN CLOB;
END historial_medico_pkg;
/


CREATE OR REPLACE PACKAGE BODY historial_medico_pkg AS
  -- Crear un nuevo historial medico
  PROCEDURE crear_historial(
    p_id IN NUMBER, 
    p_descripcion IN CLOB, 
    p_fecha IN DATE, 
    p_id_mascota IN NUMBER, 
    p_id_veterinario IN NUMBER
  ) IS
  BEGIN
    -- Insertar el hsitorial nuevo a la tabla historial_medico
    INSERT INTO historial_medico (
      ID_Historial, 
      Descripcion, 
      Fecha, 
      ID_Mascota, 
      ID_Veterinario
    )
    VALUES (
      p_id, 
      p_descripcion, 
      p_fecha, 
      p_id_mascota, 
      p_id_veterinario
    );
  END crear_historial;

  --Obtener el historial medico por un ID
  FUNCTION obtener_historial(p_id IN NUMBER) RETURN CLOB IS
    v_descripcion CLOB;
  BEGIN
    -- Consultar la descripción del historial médico de la tabla historial_medico
    SELECT Descripcion 
    INTO v_descripcion 
    FROM historial_medico 
    WHERE ID_Historial = p_id;

    --Muestra datos del historial medico
    RETURN v_descripcion;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Historial médico no encontrado';--si no encuentra el historial
    WHEN OTHERS THEN
      RETURN 'Error al obtener historial médico'; --Si da error
  END obtener_historial;

END historial_medico_pkg;
/


-----------------------------------------------------------------------------------Triggers------------------------------------------------------------------------------------
--agregar esta columna a tabla facturas
ALTER TABLE facturas
ADD (Cantidad NUMBER);

-- Trigger 1 Actualizar el stock de los medicamentos luego de una venta
CREATE OR REPLACE TRIGGER actualizar_stock_medicamento
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
  UPDATE medicamentos
  SET Stock = Stock - :NEW.Cantidad
  WHERE ID_Medicamento = :NEW.ID_Medicamento;
END;



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Trigger 2 verificar si se puede registrar una cita
CREATE OR REPLACE TRIGGER verificar_cita_disponible
BEFORE INSERT ON citas
FOR EACH ROW
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM citas
  WHERE Fecha = :NEW.Fecha AND Hora = :NEW.Hora;
  
  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'La cita ya está ocupada para este horario.');
  END IF;
END;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Trigger 3 Notificar cuando se inserta una nueva cita
CREATE OR REPLACE TRIGGER notificar_nueva_cita
AFTER INSERT ON citas
FOR EACH ROW
BEGIN
  -- Imprimir un mensaje con la nueva cita insertada
  DBMS_OUTPUT.PUT_LINE('Se ha creado una nueva cita para la mascota con ID ' || :NEW.ID_Mascota || 
                       ' a la fecha: ' || TO_CHAR(:NEW.Fecha, 'DD-MM-YYYY') || 
                       ' y hora: ' || TO_CHAR(:NEW.Hora, 'HH24:MI:SS'));
END;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--trigger 4 consulta para ultimo examen registrado
CREATE OR REPLACE TRIGGER mostrar_ultima_insercion_examen
AFTER INSERT ON examenes
FOR EACH ROW
BEGIN
  --mostrar fecha y hora de la insercion del examen
  DBMS_OUTPUT.PUT_LINE('Última inserción de examen realizada en: ' || TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH24:MI:SS'));
END;
/


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- trigger 5 asegura que el telefono solo tenga caracteres numericos
CREATE OR REPLACE TRIGGER validar_telefono_administrador
BEFORE INSERT OR UPDATE ON administrador
FOR EACH ROW
BEGIN
  IF :NEW.Telefono IS NOT NULL AND NOT REGEXP_LIKE(:NEW.Telefono, '^[0-9]+$') THEN
    RAISE_APPLICATION_ERROR(-20005, 'El teléfono solo debe contener números.');
  END IF;
END;
/
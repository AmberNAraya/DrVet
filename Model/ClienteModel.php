<?php
class ClienteModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerClientes() {
        $query = "SELECT id_cliente, nombre, apellido, direccion, telefono, email FROM cliente";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $clientes = [];
        while ($row = oci_fetch_assoc($stid)) {
            $clientes[] = $row;
        }
        oci_free_statement($stid);

        return $clientes;
    }

    public function insertarCliente($data) {
        $query = "BEGIN insertar_cliente(:nombre, :apellido, :direccion, :telefono, :email, :cliente_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':apellido', $data['apellido']);
        oci_bind_by_name($stid, ':direccion', $data['direccion']);
        oci_bind_by_name($stid, ':telefono', $data['telefono']);
        oci_bind_by_name($stid, ':email', $data['email']);

        oci_bind_by_name($stid, ':cliente_id', $cliente_id, 32); 

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el cliente: " . $error['message'];
            return false;
        }

        return $cliente_id;
    }

    public function obtenerClientePorId($id) {
        $query = "SELECT id_cliente, nombre, apellido, direccion, telefono, email 
                  FROM cliente WHERE id_cliente = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarCliente($id, $data) {
        $query = "UPDATE cliente 
                  SET nombre = :nombre, 
                      apellido = :apellido, 
                      direccion = :direccion, 
                      telefono = :telefono, 
                      email = :email 
                  WHERE id_cliente = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':apellido', $data['apellido']);
        oci_bind_by_name($stid, ':direccion', $data['direccion']);
        oci_bind_by_name($stid, ':telefono', $data['telefono']);
        oci_bind_by_name($stid, ':email', $data['email']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarCliente($id) {
        $query = "DELETE FROM cliente WHERE id_cliente = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>

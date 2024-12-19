<?php
class ProveedorModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerProveedores() {
        $query = "SELECT id_proveedor, nombre, descripcion, telefono, email FROM proveedor";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $proveedores = [];
        while ($row = oci_fetch_assoc($stid)) {
            $proveedores[] = $row;
        }
        oci_free_statement($stid);

        return $proveedores;
    }

    public function insertarProveedor($data) {
        $query = "BEGIN insertar_proveedor(:nombre, :descripcion, :telefono, :email, :proveedor_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':telefono', $data['telefono']);
        oci_bind_by_name($stid, ':email', $data['email']);

        oci_bind_by_name($stid, ':proveedor_id', $proveedor_id, 32);

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el proveedor: " . $error['message'];
            return false;
        }

        return $proveedor_id;
    }

    public function obtenerProveedorPorId($id) {
        $query = "SELECT id_proveedor, nombre, descripcion, telefono, email FROM proveedor WHERE id_proveedor = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarProveedor($id, $data) {
        $query = "UPDATE proveedor 
                  SET nombre = :nombre, 
                      descripcion = :descripcion, 
                      telefono = :telefono, 
                      email = :email 
                  WHERE id_proveedor = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':telefono', $data['telefono']);
        oci_bind_by_name($stid, ':email', $data['email']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarProveedor($id) {
        $query = "DELETE FROM proveedor WHERE id_proveedor = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>

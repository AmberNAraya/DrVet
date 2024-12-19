<?php
class InventarioModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerInventarios() {
        $query = "SELECT id_inventario, id_producto, cantidad, fecha_actualizacion FROM inventario";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $inventarios = [];
        while ($row = oci_fetch_assoc($stid)) {
            $inventarios[] = $row;
        }
        oci_free_statement($stid);

        return $inventarios;
    }

    public function insertarInventario($data) {
        $query = "BEGIN insertar_inventario(:id_producto, :cantidad, :inventario_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':id_producto', $data['id_producto']);
        oci_bind_by_name($stid, ':cantidad', $data['cantidad']);

        oci_bind_by_name($stid, ':inventario_id', $inventario_id, 32);

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el inventario: " . $error['message'];
            return false;
        }

        return $inventario_id;
    }

    public function obtenerInventarioPorId($id) {
        $query = "SELECT id_inventario, id_producto, cantidad, fecha_actualizacion FROM inventario WHERE id_inventario = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarInventario($id, $data) {
        $query = "UPDATE inventario 
                  SET id_producto = :id_producto, 
                      cantidad = :cantidad 
                  WHERE id_inventario = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':id_producto', $data['id_producto']);
        oci_bind_by_name($stid, ':cantidad', $data['cantidad']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarInventario($id) {
        $query = "DELETE FROM inventario WHERE id_inventario = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>

<?php
class MedicamentoModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerMedicamentos() {
        $query = "SELECT id_medicamento, nombre, descripcion, precio, stock, fecha_vencimiento, id_proveedor FROM medicamento";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $medicamentos = [];
        while ($row = oci_fetch_assoc($stid)) {
            $medicamentos[] = $row;
        }
        oci_free_statement($stid);

        return $medicamentos;
    }

    public function insertarMedicamento($data) {
        $query = "BEGIN insertar_medicamento(:nombre, :descripcion, :precio, :stock, TO_DATE(:fecha_vencimiento, 'YYYY-MM-DD'), :id_proveedor, :medicamento_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':precio', $data['precio']);
        oci_bind_by_name($stid, ':stock', $data['stock']);
        oci_bind_by_name($stid, ':fecha_vencimiento', $data['fecha_vencimiento']);
        oci_bind_by_name($stid, ':id_proveedor', $data['id_proveedor']);
        oci_bind_by_name($stid, ':medicamento_id', $medicamento_id, 32); 

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el medicamento: " . $error['message'];
            return false;
        }

        return $medicamento_id;
    }

    public function obtenerMedicamentoPorId($id) {
        $query = "SELECT id_medicamento, nombre, descripcion, precio, stock, fecha_vencimiento, id_proveedor FROM medicamento WHERE id_medicamento = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarMedicamento($id, $data) {
        $query = "UPDATE medicamento SET nombre = :nombre, descripcion = :descripcion, precio = :precio, stock = :stock, fecha_vencimiento = TO_DATE(:fecha_vencimiento, 'YYYY-MM-DD'), id_proveedor = :id_proveedor WHERE id_medicamento = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':precio', $data['precio']);
        oci_bind_by_name($stid, ':stock', $data['stock']);
        oci_bind_by_name($stid, ':fecha_vencimiento', $data['fecha_vencimiento']);
        oci_bind_by_name($stid, ':id_proveedor', $data['id_proveedor']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarMedicamento($id) {
        $query = "DELETE FROM medicamento WHERE id_medicamento = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>

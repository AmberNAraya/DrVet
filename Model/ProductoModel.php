<?php
class ProductoModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerProductos() {
        $query = "SELECT id_producto, nombre, descripcion, stock, precio, id_proveedor FROM producto";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $productos = [];
        while ($row = oci_fetch_assoc($stid)) {
            $productos[] = $row;
        }
        oci_free_statement($stid);

        return $productos;
    }

    public function insertarProducto($data) {
        $query = "BEGIN insertar_producto(:nombre, :descripcion, :stock, :precio, :id_proveedor, :producto_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':stock', $data['stock']);
        oci_bind_by_name($stid, ':precio', $data['precio']);
        oci_bind_by_name($stid, ':id_proveedor', $data['id_proveedor']);

        oci_bind_by_name($stid, ':producto_id', $producto_id, 32);

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el producto: " . $error['message'];
            return false;
        }

        return $producto_id;
    }

    public function obtenerProductoPorId($id) {
        $query = "SELECT id_producto, nombre, descripcion, stock, precio, id_proveedor 
                  FROM producto WHERE id_producto = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarProducto($id, $data) {
        $query = "UPDATE producto 
                  SET nombre = :nombre, 
                      descripcion = :descripcion, 
                      stock = :stock, 
                      precio = :precio, 
                      id_proveedor = :id_proveedor 
                  WHERE id_producto = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':stock', $data['stock']);
        oci_bind_by_name($stid, ':precio', $data['precio']);
        oci_bind_by_name($stid, ':id_proveedor', $data['id_proveedor']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarProducto($id) {
        $query = "DELETE FROM producto WHERE id_producto = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>

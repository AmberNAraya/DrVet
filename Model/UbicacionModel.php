<?php
// Model/UbicacionModel.php
include_once '../Database/db.php';  // Asegúrate de incluir la conexión correctamente

class UbicacionModel {

    private $conn;

    public function __construct() {
        global $conn;
        $this->conn = $conn;  // Usa la conexión global
    }

    public function obtenerUbicacion() {
        $query = "SELECT * FROM ubicaciones";  
        $stid = oci_parse($this->conn, $query);  // Prepara la consulta
        oci_execute($stid);  // Ejecuta la consulta

        $resultados = [];
        while ($row = oci_fetch_assoc($stid)) {
            $resultados[] = $row;  // Guarda los resultados
        }

        oci_free_statement($stid);  // Libera los recursos de la consulta
        return $resultados;  // Devuelve los resultados
    }
}
?>

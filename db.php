<?php
// Database connection (db.php)
$user = "Veterinario";
$pass = "admin";
$host = "localhost/xepdb1";
$conn = oci_connect($user, $pass, $host);

if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
} else {
    // Echo for testing, remove in production
    echo "ORACLE DATABASE CONNECTED SUCCESSFULLY!!!<br>";
}
?>

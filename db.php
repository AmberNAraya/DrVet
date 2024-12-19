<?php
$user = "lenguaje";
$pass = "admin";
$host = "localhost/xepdb1";
$conn = oci_connect($user, $pass, $host);
if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
} else {
    echo "";
}
?>
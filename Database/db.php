 <?php

$username = 'Vete';
$password = 'admin';
$dbname = 'DrPet';
$hostname = 'localhost:1521/orcl';

$conn = oci_connect($username, $password, $hostname);

if(!$conn) {
    $e = oci_error();
    echo htmlentities($e['message'], ENT_QUOTES);
    exit;
}

?>
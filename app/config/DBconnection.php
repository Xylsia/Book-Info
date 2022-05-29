<?php
    $host = 'localhost';
    $user = 'root';
    $password = '';
    $database = 'book-info';

    $conn = new mysqli($host, $user, $password, $database);

    if ($conn->connect_error) {
        die("Connection Failed " . $conn->connect_error);
    }
?>
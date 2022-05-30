<?php
    function register() {
        echo "registration!";
    }

    function login() {
        echo "logged in!";
    }

    function logout() {
        echo "logged out!";
    }

    if (isset($_GET['register'])) {
        register();
    }
    else if (isset($_GET['login'])) {
        login();
    }
    else if (isset($_GET['logout'])) {
        logout();
    }
?>
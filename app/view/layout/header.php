<?php require './../config/DBconnection.php' ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="#">
        <link rel="stylesheet" type="text/css" href="./../public/css/style.css">
        <title> Book-Info </title>
    </head>

    <body>
    <div class="wrap">
            <header>
                <div class="head">
                    <div class="title">
                        <h1><a href="./index.php"> Book-Info </a></h1>
                    </div>
                    <div class="nav">
                        <form method="POST" action="./../controller/AuthController.php?logout">
                            <ul>
                                <li><a href="./login.php"> Login </a></li>
                                <li><a href="./register.php"> Register </a></li>
                                <li><a href="./profile.php"> Profile </a></li>
                                <li><button id="logout-btn" type="submit"> Logout </button></li>
                            </ul>
                        </form>    
                    </div>
                </div>
            </header>
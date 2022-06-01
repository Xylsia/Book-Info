<?php
    include '../config/DBconnection.php';

    function register($conn) {

        if (isset($_POST['registerBtn'])) {
    
            $username = $_POST['username'];
            $password = $_POST['password'];
            $email = $_POST['email'];
            $user_type = 1;
    
            if (empty($username) || empty($password) || empty($email)) {
                header("Location: ../view/register.php?error=emptyFields");
                exit;
            }
            else if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
                header("Location: ../view/register.php?error=invalidEmail");
                exit;
            }
            else if (!preg_match("/^[a-zA-Z0-9-_.]{5,18}$/", $username)) {
                header("Location: ../view/register.php?error=invalidUsername");
                exit;
            }
            else if (!preg_match("/^[a-zA-Z0-9-_.]{5,18}$/", $password)) {
                header("Location: ../view/register.php?error=invalidPassword");
                exit;
            }

            else {
                $sql =     "SELECT 
                                users.username,
                                users.email
                            FROM  users
                            WHERE 
                                users.username =? OR users.email =?";
    
                $statement = mysqli_stmt_init($conn);
                if (!mysqli_stmt_prepare($statement, $sql)) {
                    header("Location: ../view/register.php?error=somethingWentWrong");
                    exit;
                }
                else {
                        mysqli_stmt_bind_param($statement, "ss", $username, $email);
                        mysqli_stmt_execute($statement);
                        mysqli_stmt_store_result($statement);
                        $resultCheck = mysqli_stmt_num_rows($statement);
    
                        if ($resultCheck > 0) {
                            header("Location: ../view/register.php?error=userTaken");
                            exit;
                        }
                        else {
                            $sql = "INSERT INTO users 
                                        (username, `password`, email, user_type_id)
                                    VALUES 
                                        (?, ?, ?, ?)";
                            $statement = mysqli_stmt_init($conn);
                            if(!mysqli_stmt_prepare($statement, $sql)){
                                header("Location: ../view/register.php?error=sqlError");
                                exit;
                            }
                            else {
                                mysqli_stmt_bind_param($statement, "sssi", $username, $password, $email, $user_type);
                                mysqli_stmt_execute($statement);
                                header("Location: ../view/index.php?registrationSuccess");
                                exit;
                            }
                        }
                } 
            }
        }
    }


    function login($conn) {

        if (isset($_POST['loginBtn'])) {
    
            $username = $_POST['username'];
            $password = $_POST['password'];
    
            if (empty($username) || empty($password)) {
                header("Location: ../view/login.php?error=empty");
                exit;
            }
            else {
                $sql =     "SELECT *
                            FROM users 
                            WHERE 
                                users.username =?";
                $statement = mysqli_stmt_init($conn); 
                
                if (!mysqli_stmt_prepare($statement, $sql)) {
                    header("Location: ../view/login.php?error=sqlError");
                    exit;
                }
                else {
                    mysqli_stmt_bind_param($statement, "s", $username);
                    mysqli_stmt_execute($statement);
                    $result = mysqli_stmt_get_result($statement);
    
                    if ($row = mysqli_fetch_assoc($result)) {
                        if ($password == $row['password']) {
                            session_start();
                            $_SESSION['username'] = $row['username'];
                            $_SESSION['user_id'] = $row['user_id'];
                            header("Location: ../view/index.php?loginSuccess");
                            exit;
                        }
                        else {
                            header("Location: ../view/login.php?error=wrongPassword");
                            exit;
                        }
                    }
                    else {
                        header("Location: ../view/login.php?error=noUser");
                        exit;
                    }
    
                }
            }
        }
    }


    function logout() {
        session_start();
        session_unset();
        session_destroy();
        header("Location: ../view/index.php?logout");
    }

    if (isset($_GET['register'])) {
        register($conn);
    }
    else if (isset($_GET['login'])) {
        login($conn);
    }
    else if (isset($_GET['logout'])) {
        logout();
    }

?>
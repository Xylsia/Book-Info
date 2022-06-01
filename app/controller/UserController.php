<?php
    include '../config/DBconnection.php';

    function findAllUsers() {
        $query =   "SELECT *
                    FROM users";

        return $query;
    }

    function findUserByUsername($username) {
        $query =   "SELECT *
                    FROM users
                    WHERE
                        users.username = '$username'";

        return $query;
    }

    function findAllUsersByType($type) {
        $sql =     "SELECT
                        users.user_id,
                        users.username,
                        users.email,
                        user_type.type AS user_type
                    FROM user_type
                    INNER JOIN users ON
                        user_type.user_type_id = users.user_type_id
                    WHERE
                        user_type.type = '$type'";

        return $sql;
    }

    function findAllUserTypes() {
        $sql =      "SELECT
                        user_type.type AS user_type
                    FROM
                        user_type";

        return $sql;
    }

    function editUser($conn) {
        session_start();
        $username = $_SESSION['username'];
        $password = $_POST['password'];
        $email = $_POST['email'];

        if (empty($password) || empty($email)) {
            header("Location: ../view/profile.php?error=emptyFields");
            exit;
        }
        else if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
            header("Location: ../view/profile.php?error=invalidEmail");
            exit;
        }
        else if (!preg_match("/^[a-zA-Z0-9-_.]{5,18}$/", $password)) {
            header("Location: ../view/profile.php?error=invalidPassword");
            exit;
        }
        else {
            $sql =     "SELECT 
                            users.email
                        FROM  users
                        WHERE 
                            users.email =?";

            $statement = mysqli_stmt_init($conn);
            if (!mysqli_stmt_prepare($statement, $sql)) {
                header("Location: ../view/profile.php?error=somethingWentWrong");
                exit;
            }
            else {
                    mysqli_stmt_bind_param($statement, "s", $email);
                    mysqli_stmt_execute($statement);
                    mysqli_stmt_store_result($statement);
                    $resultCheck = mysqli_stmt_num_rows($statement);

                    if ($resultCheck > 0) {
                        header("Location: ../view/profile.php?error=emailTaken");
                        exit;
                    }
                    else {
                        $sql = "UPDATE users 
                                SET
                                    users.password =?,
                                    users.email =?
                                WHERE
                                    users.username = '$username'";
                        $statement = mysqli_stmt_init($conn);
                        if(!mysqli_stmt_prepare($statement, $sql)){
                            header("Location: ../view/profile.php?error=sqlError");
                            exit;
                        }
                        else {
                            mysqli_stmt_bind_param($statement, "ss", $password, $email);
                            mysqli_stmt_execute($statement);
                            header("Location: ../view/profile.php?updateSuccess");
                            exit;
                        }
                    }
            } 
        }
    }

    function deleteUser($conn) {
        session_start();
        $username = $_SESSION['username'];

        $sql =     "DELETE users.*
                    FROM users
                    INNER JOIN favorites ON
                    users.user_id = favorites.favorites_id
                    WHERE 
                        users.username = '$username'";

        $conn->query($sql);
        session_unset();
        session_destroy();
        header("Location: ../view/index.php?deletedUser");
        $conn->close();
    }


    if (isset($_GET['editUser'])) {
        editUser($conn);
    }
    else if (isset($_GET['deleteUser'])) {
        deleteUser($conn);
    }

?>
<?php
    include 'layout/header.php';
    include '../controller/UserController.php';
    include '../controller/FavoritesController.php';
    $username = $_SESSION['username'];
    $user_id = $_SESSION['user_id'];
?>

<div class="wrapper-calc">
    <div class="tab">
        <button onclick="openTab('favorites')"> Favorites </button>
        <button onclick="openTab('settings')"> Settings </button>
    </div>

    <?php
        echo "<h1 id=\"profile\">$username's profile page</h1>";
    ?>

    <div id="favorites" class="tab-content wrapper">
        <?php
            $sql = findAllFavoritesByUsername($username);
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo    
                       "<div class=\"card\">
                            <div class=\"card-head\">
                                <h2>" . $row['title'] . "</h2>
                                <hr>
                            </div>
                            <div class=\"card-body\">
                                <div class=\"pic-div\">
                                    <div class=\"picture\">
                                        <img class=\"img\" name='id".$row['book_id']."' src='".$row['url']."'>
                                    </div>
                                    <div class=\"content\">
                                        <p> <b>Released:</b> " . $row['publication_year'] . "</p>
                                        <p> <b>Author:</b> " . $row['author_name'] . " " . $row['author_surname'] ."</p>
                                        <p> <b>ISBN:</b> " . $row['isbn'] . "</p>
                                        <p> <b>Categories:</b> " . $row['category'] . "</p>
                                        <p> <b>Publisher:</b> " . $row['publisher'] . "</p>
                                    </div>
                                </div>
                                <div class=\"details\">
                                    <p>" . $row['content'] . "</p>
                                     <form method=\"POST\" action=\"../controller/FavoritesController.php?removeFavorite\">
                                        <input type=\"hidden\" name=\"book_id\" value='".$row['book_id']."' />
                                        <button id=\"favorites-btn\" type=\"submit\" name=\"removeFavoriteBtn\"> Remove </button>
                                    </form>    
                                </div>
                            </div>
                        </div>";
                }
            }
        ?>
    </div>

    <div id="settings" class="tab-content form-wrap">
        <form class="form" method="POST" action="../controller/UserController.php?editUser" style="margin: 8em 3em 3em 3em !important;">

        <?php
            $sql = findUserByUsername($username);
            $result = $conn->query($sql);
            $row = $result->fetch_array();

            echo    "<label class=\"label\"> Password </label>
                    <input type=\"text\" class=\"input\" name=\"password\" value='".$row['password']."' />
                    <span id=\"password-span\"></span>

                    <label class=\"label\"> Email </label>
                    <input type=\"text\" class=\"input\" name=\"email\" value='".$row['email']."' />
                    <span id=\"email-span\"></span>
                    <button type=\"submit\" class=\"input btn\" name=\"editBtn\"> Change Account Settings </button>";
        ?>
        </form>

        <form method="POST" action="../controller/UserController.php?deleteUser" style="margin: 8em 3em 3em 3em !important;">
            <button type="submit" class="input btn" name="deleteBtn" id="deleteBtn"> Delete Account </button>
        </form>

    </div>
</div>

<?php include 'layout/footer.php'; ?>
<?php 
    include 'layout/header.php';
    include '../controller/BookController.php';
    include '../controller/FavoritesController.php';
?>

    <div class="wrapper wrapper-calc">

        <?php
            $sql = findAllBooks();
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
                                    <p>" . $row['content'] . "</p>";

                                    if (isset($_SESSION['username'])) {
                                     echo " <form method=\"POST\" action=\"../controller/FavoritesController.php?addFavorite\">
                                                <input type=\"hidden\" name=\"book_id\" value='".$row['book_id']."' />
                                                <button id=\"favorites-btn\" type=\"submit\" name=\"addFavoriteBtn\"> Add to Favorites </button>
                                            </form>";
                                    }

                        echo   "</div>
                            </div>
                        </div>";
                }
            } 
            $conn->close();
        ?>
    </div>

<?php include 'layout/footer.php'; ?>    
<?php include 'layout/header.php';
      include '../controller/BookController.php';
      include '../controller/UserController.php';
?>

    <div class="wrapper">

        <?php
            $sql = findAllBooks();
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo    
                       "<div class=\"card\">
                            <div class=\"card-head\">
                                <h2>" . $row['title'] . "</h2>
                            </div>
                            <div class=\"card-body\">
                                <div class=\"pic-div\">
                                    <div class=\"picture\">
                                        <img class=\"img\" name='id".$row['id']."' src='".$row['url']."'>
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
                                    <button id=\"favorites-btn\" name='".$row['id']."'> Add to Favorites </button>
                                </div>
                            </div>
                        </div>";
                }
            } 
            $conn->close();
        ?>
    </div>

<?php include 'layout/footer.php'; ?>    
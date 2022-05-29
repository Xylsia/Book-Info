<?php include 'layout/header.php';
      include '../controller/BookController.php';
?>

    <div class="wrapper">

        <?php
            $sql = "SELECT  
                            books.book_id as id,
                            books.title,
                            books.content, 
                            books.isbn,
                            books.url,
                            books.publication_year, 
                            categories.name AS category,
                            authors.first_name AS author_name,
                            authors.last_name AS author_surname,
                            publishers.name AS publisher
                    FROM books
                    INNER JOIN category_book ON
                    books.book_id = category_book.book_id
                    INNER JOIN categories ON
                    category_book.category_id = categories.category_id
                    INNER JOIN author_book ON
                    books.book_id = author_book.book_id
                    INNER JOIN authors ON
                    author_book.author_id = authors.author_id
                    INNER JOIN publishers ON
                    books.publisher_id = publishers.publisher_id 
                    GROUP BY books.title
                    ORDER BY books.title ASC;";

            $result = $conn->query($sql);
        ?>

        <?php
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
<?php include 'layout/header.php';
      include '../controller/BookController.php';
?>

    <div>
        <h2>Some random content</h2>
        <?php
            GetAllBooks();
            $sql = "SELECT  books.title,
                            books.content, 
                            books.isbn, 
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

        <h2> Results: </h2>
        <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo    
                        "<p> <b>Title:</b> " . $row['title'] . "</p>
                         <p> <b>Content:</b> " . $row['content'] . "</p>
                         <p> <b>ISBN:</b> " . $row['isbn'] . "</p>
                         <p> <b>Year:</b> " . $row['publication_year'] . "</p>
                         <p> <b>Categories:</b> " . $row['category'] . "</p>
                         <p> <b>Author Name:</b> " . $row['author_name'] . "</p>
                         <p> <b>Author Surname:</b> " . $row['author_surname'] . "</p>
                         <p> <b>Publisher:</b> " . $row['publisher'] . "</p>

                        <hr>";
                }
            } 
            $conn->close();
            ?>
    </div>

<?php include 'layout/footer.php'; ?>    
<?php
    include '../config/DBconnection.php';

    function findAllFavoritesByUsername($username) {
        $query =   "SELECT
                        books.book_id AS book_id,
                        books.title,
                        books.content, 
                        books.isbn,
                        books.url,
                        books.publication_year, 
                        categories.name AS category,
                        authors.first_name AS author_name,
                        authors.last_name AS author_surname,
                        publishers.name AS publisher,
                        users.username
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
                    INNER JOIN favorites ON
                        books.book_id = favorites.book_id
                    INNER JOIN users ON
                        favorites.user_id = users.user_id
                    WHERE
                        users.username = '$username'
                    GROUP BY
                        books.title
                    ORDER BY
                        books.title ASC";
                
        return $query;        
    }

    function addBookToFavorites($conn) {
        session_start();
        $user_id = $_SESSION['user_id'];
        $book_id = $_POST['book_id'];

        $sql =     "INSERT INTO favorites
                        (`user_id`, book_id)
                    VALUES
                        ($user_id, $book_id)";
        $conn->query($sql);
        header("Location: ../view/index.php?addedToFavorites");               
    }

    function removeBookFromFavorites($conn) {
        session_start();
        $user_id = $_SESSION['user_id'];
        $book_id = $_POST['book_id'];

        $sql =     "DELETE favorites.*
                    FROM favorites
                    WHERE 
                        favorites.user_id = '$user_id' and favorites.book_id = '$book_id'";
        $conn->query($sql);
        header("Location: ../view/profile.php?removedFromFavorites"); 
    }

    if (isset($_GET['addFavorite'])) {
        addBookToFavorites($conn);
    }
    else if (isset($_GET['removeFavorite'])) {
        removeBookFromFavorites($conn);
    }

?>
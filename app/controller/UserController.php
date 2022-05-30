<?php

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

    function findAllFavoritesByUsername($username) {
        $query =   "SELECT
                        books.book_id AS id,
                        books.title,
                        books.content, 
                        books.isbn,
                        books.url,
                        books.publication_year, 
                        categories.name AS category,
                        authors.first_name AS author_name,
                        authors.last_name AS author_surname,
                        publishers.name AS publisher,
                        users.username,
                        favorites.name
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

?>
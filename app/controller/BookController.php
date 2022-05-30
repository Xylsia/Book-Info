<?php

    function findAllBooks() {
        $query = "SELECT
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

        return $query;        
    }

    function findOneBookById($bookId) {
        $query = "SELECT
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
                WHERE books.book_id = '$bookId'    
                GROUP BY books.title
                ORDER BY books.title ASC;";

        return $query;
    }

    function findAllBooksByCategory($category) {
        $query = "SELECT
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
                WHERE categories.name = '$category'    
                GROUP BY books.title
                ORDER BY books.title ASC;";

        return $query;
    }

    function findAllBooksByAuthor($first_name, $last_name) {
        $query = "SELECT
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
                WHERE authors.first_name = '$first_name' and authors.last_name = '$last_name'
                GROUP BY books.title
                ORDER BY books.title ASC";

        return $query;        
    }

    function findAllBooksByPublisher($publisher) {
        $query = "SELECT
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
                WHERE publishers.name = '$publisher'
                GROUP BY books.title
                ORDER BY books.title ASC";

        return $query;
    }

?>
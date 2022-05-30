<?php

    function findAllAuthors() {
        $sql =     "SELECT
                        authors.first_name AS first_name,
                        authors.last_name AS last_name
                    FROM authors
                    ORDER BY
                        authors.first_name ASC";

        return $sql;
    }

?>
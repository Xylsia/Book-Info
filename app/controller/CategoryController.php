<?php

    function findAllCategories() {
        $sql =     "SELECT
                        categories.name AS category
                    FROM categories
                    ORDER BY
                        categories.name ASC";

        return $sql;
    }

?>
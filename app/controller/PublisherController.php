<?php

    function findAllPublishers(){
        $sql =     "SELECT
                        publishers.name AS publisher
                    FROM publishers
                    ORDER BY
                        publishers.name DESC";

        return $sql;
    }

?>
<?php

/**********************
 * db.php             *
 *                    *
 * Database functions *
 **********************/

// make sure that this file cannot be directly accessed
if (stristr(htmlentities($_SERVER["PHP_SELF"]), "db.php")) {
    header("Location: index.php");
    exit();
}

require_once("config.php");

/**********************
 * DATABASE FUNCTIONS *
 **********************/

function db_connect()
{
	global $_ADMIN;

        mysql_connect($_ADMIN["MYSQL_URL"], $_ADMIN["MYSQL_USER"], $_ADMIN["MYSQL_PASS"]);
        mysql_select_db($_ADMIN["MYSQL_DATABASE"])
                or die("ERROR: Unable to select database " . $_ADMIN["MYSQL_DATABASE"]);
}

function db_query($query)
{
	return mysql_query($query);
}

?>

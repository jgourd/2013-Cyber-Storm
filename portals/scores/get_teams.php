<?php
	require_once "../../config/db.php";

	db_connect();

	$r = db_query("SELECT COUNT(*) AS team_count FROM teams WHERE enabled='Y';");
	echo mysql_result($r, 0, "team_count");
?>

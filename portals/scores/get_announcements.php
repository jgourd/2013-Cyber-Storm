<?php
	require_once "config/db.php";

	db_connect();

	$announcement = "";

	$r = db_query("SELECT message FROM announcements WHERE TIMESTAMPDIFF(SECOND, timestamp, NOW()) < duration ORDER BY timestamp DESC LIMIT 1;");
	if (mysql_numrows($r) > 0)
	{
		$announcement = mysql_result($r, 0, "message");
		echo $announcement;
	}
?>

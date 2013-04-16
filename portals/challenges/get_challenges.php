<?php
	require_once "config/db.php";

	db_connect();

	$challenges = "";

	$r = db_query("SELECT * FROM challenges ORDER BY id;");
	for ($i=0; $i<mysql_numrows($r); $i++)
	{
		if ($i > 0)
		{
			$challenges .= "||";
		}
		$challenges .= mysql_result($r, $i, "id");
		$challenges .= "|-";
		$challenges .= mysql_result($r, $i, "name");
		$challenges .= "|-";
		$challenges .= mysql_result($r, $i, "description");
		$challenges .= "|-";
		$challenges .= mysql_result($r, $i, "points");
		$challenges .= "|-";
		$challenges .= mysql_result($r, $i, "timestamp_start");
		$challenges .= "|-";
		$challenges .= mysql_result($r, $i, "winner_id");
 

	}

	echo $challenges;
?>

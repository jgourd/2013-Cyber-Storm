<?php
	require_once "config/db.php";

	db_connect();

	$nodes = "";

	$r = db_query("SELECT team_id,id FROM nodes WHERE timestamp_down IS NULL ORDER BY team_id,id;");
	for ($i=0; $i<mysql_numrows($r); $i++)
	{
		if ($i > 0)
			$nodes .= "|";
		$nodes .= mysql_result($r, $i, "team_id") . "," . mysql_result($r, $i, "id");
	}

	echo "$nodes";
?>

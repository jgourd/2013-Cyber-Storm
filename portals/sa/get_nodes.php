<?php
	require_once "config/db.php";

	db_connect();

	$nodes = "";

//	$r = db_query("SELECT team_id,id FROM nodes WHERE timestamp_down IS NULL AND team_id IN (SELECT team_id FROM nodes ORDER by team_id LIMIT 10) ORDER BY team_id,id;");
	$r = db_query("(SELECT team_id,id FROM nodes WHERE team_id=1 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 90) UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=2 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 90) UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=3 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 90) UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=4 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 90) UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=5 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 90) UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=6 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 90) UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=7 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT 217);");
	for ($i=0; $i<mysql_numrows($r); $i++)
	{
		if ($i > 0)
			$nodes .= "|";
		$nodes .= mysql_result($r, $i, "team_id") . "," . mysql_result($r, $i, "id");
	}

	echo "$nodes";
?>

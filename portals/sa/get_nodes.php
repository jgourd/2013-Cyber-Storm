<?php
	require_once "config/db.php";

	db_connect();

	$num_rows = 6;
	$num_cols = 15;
//	$max_nodes = 90;
//	$max_nodes_white = 217;
	$nodes = "";

//	$r = db_query("SELECT team_id,id FROM nodes WHERE timestamp_down IS NULL AND team_id IN (SELECT team_id FROM nodes ORDER by team_id LIMIT 10) ORDER BY team_id,id;");
	$r = db_query("(SELECT team_id,id FROM nodes WHERE team_id=1 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . ($num_rows * $num_cols) . ") UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=2 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . ($num_rows * $num_cols) . ") UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=3 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . ($num_rows * $num_cols) . ") UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=4 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . ($num_rows * $num_cols) . ") UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=5 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . ($num_rows * $num_cols) . ") UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=6 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . ($num_rows * $num_cols) . ") UNION ALL (SELECT team_id,id FROM nodes WHERE team_id=7 AND timestamp_down IS NULL ORDER BY team_id,id DESC LIMIT " . (($num_rows + 1) * ($num_cols * 2 + 1)) . ");");
	for ($i=0; $i<mysql_numrows($r); $i++)
	{
		if ($i > 0)
			$nodes .= "|";
		$nodes .= mysql_result($r, $i, "team_id") . "," . mysql_result($r, $i, "id");
	}

	echo "$nodes";
?>

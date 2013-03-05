<?php
	require_once "../../config/db.php";

	db_connect();

	$scores = "";
	$challenges = "";

	$r = db_query("SELECT score,challenges FROM teams;");
	for ($i=0; $i<mysql_numrows($r); $i++)
	{
		if ($i > 0)
		{
			$scores .= ",";
			$challenges .= ",";
		}
		$scores .= mysql_result($r, $i, "score");
		$challenges .= mysql_result($r, $i, "challenges");
	}

	echo $scores . "|" . $challenges;
?>

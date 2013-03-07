<?php
	$MAX_TEAMS = 6;

	require_once "config/db.php";

	db_connect();

	$r = db_query("SELECT COUNT(*) AS team_count FROM teams WHERE enabled='Y';");
	$num_teams = mysql_result($r, 0, "team_count");
?>

<html>
	<head>
		<title>2013 Cyber Storm Scores Portal</title>
		<script type="text/javascript" src="../jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="scores.js"></script>
		<link rel="stylesheet" type="text/css" href="scores.css" />
	</head>

	<body>
<?php
	$num_teams = min($num_teams, $MAX_TEAMS);
	$height = ($num_teams < 4) ? 1 : 2;
	$width = ($height > 1) ? (ceil($num_teams / 2)) : $num_teams;

	for ($h=1; $h<=$height; $h++)
	{
		echo "\t\t<div id=\"scores\"" . ($height == 1 ? " class=\"full\"" : "") . ">\n";

		for ($w=1; $w<=$width; $w++)
		{
			$id = ($h - 1) * $width + $w;
			$r = db_query("SELECT color,challenges,name,score FROM teams WHERE enabled='Y' ORDER BY id LIMIT " . ($id - 1) . ",1");
			$color = mysql_result($r, 0, "color");
			$challenges = mysql_result($r, 0, "challenges");
			$team_name = mysql_result($r, 0, "name");
			$score = mysql_result($r, 0, "score");

			if ($id <= $num_teams)
			{
				echo "\t\t\t<div id=\"team\" class=\"" . strtolower($color) . "\">\n";
				echo "\t\t\t\t<div id=\"challenge\" class=\"challenge$id\">$challenges</div>\n";
				echo "\t\t\t\t<div id=\"name\" class=\"" . strtolower($color) . "\">$team_name</div>\n";
				echo "\t\t\t\t<div id=\"score\" class=\"score$id\">$score</div>\n";
				echo "\t\t\t</div>\n";
			}
		}

		echo "\t\t</div>\n";
	}
?>
	</body>
</html>

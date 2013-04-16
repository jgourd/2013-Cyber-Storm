<?php
	$MAX_TEAMS = 6;

	require_once "config/db.php";

	db_connect();

	$r = db_query("SELECT COUNT(*) AS team_count FROM teams WHERE enabled='Y';");
	$num_teams = mysql_result($r, 0, "team_count");

	$num_rows = 5;
	$num_columns = 5;
?>

<html>
	<head>
		<title>2013 Cyber Storm Challenge Portal</title>
		<script type="text/javascript" src="../jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="../raphael-min.js"></script>
		<script type="text/javascript" src="challenges.js"></script>
		<script type="text/javascript" src="jquery.tipTip.js"></script>
		<script type="text/javascript" src="kinetic.js"></script>
		<link rel="stylesheet" type="text/css" href="challenges.css" />
		<link rel="stylesheet" type="text/css" href="tipTip.css" />
	</head>

	<body >
		<div id="info" ></div>
		<div id="container" >
    
		<script type="text/javascript" src="challengeNodes.js"></script>
		</div>

		<div id="bottom"></div>
	</body>
</html>


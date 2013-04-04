<?php
	$MAX_TEAMS = 6;

	require_once "config/db.php";

	db_connect();

	$r = db_query("SELECT COUNT(*) AS team_count FROM teams WHERE enabled='Y';");
	$num_teams = mysql_result($r, 0, "team_count");
?>

<html>
	<head>
		<title>2013 Cyber Storm Situational Awareness Portal</title>
		<script type="text/javascript" src="../jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="../raphael-min.js"></script>
		<script type="text/javascript" src="sa.js"></script>
		<link rel="stylesheet" type="text/css" href="sa.css" />
	</head>

	<body>
		<div id="viz"></div>
		<div id="info"></div>
		<div id="red"></div>
		<div id="blue"></div>
		<div id="green"></div>
		<div id="yellow"></div>
		<div id="purple"></div>
		<div id="orange"></div>
		<div id="white"></div>
<!--		<div id="logos" class="top-right"><img src="images/logos-top-right.png"/></div>
		<div id="logos" class="bottom-right"><img src="images/logos-bottom-right.png"/></div>
		<div id="logos" class="bottom-left"><img src="images/logos-bottom-left.png"/></div>-->
	</body>
</html>

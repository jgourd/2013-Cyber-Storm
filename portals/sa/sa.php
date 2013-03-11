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
		<div id="sa_row">
			<div id="quadrant">
				<div id="title" class="cs">2013 Cyber Storm</div>
			</div>
			<div id="quadrant">
				<div id="title" class="green">GREEN</div>
				<div class="nodes" id="green"></div>
			</div>
			<div id="quadrant">
				<div id="title" class="yellow">YELLOW</div>
				<div class="nodes" id="yellow"></div>
			</div>
			<div id="quadrant"><br/></div>
		</div>
		<div id="sa_row">
			<div id="quadrant">
				<div id="title" class="blue">BLUE</div>
				<div class="nodes" id="blue"></div>
			</div>
			<div id="quadrant" class="attack top">
				<br/>
			</div>
			<div id="quadrant">
				<div id="title" class="purple">PURPLE</div>
				<div class="nodes" id="purple"></div>
			</div>
		</div>
		<div id="sa_row">
			<div id="quadrant">
				<div id="title" class="red">RED</div>
				<div class="nodes" id="red"></div>
			</div>
			<div id="quadrant" class="attack bottom">
				<br/>
			</div>
			<div id="quadrant">
				<div id="title" class="orange">ORANGE</div>
				<div class="nodes" id="orange"></div>
			</div>
		</div>
		<div id="sa_row">
			<div id="quadrant"><br/></div>
			<div id="quadrant" class="other">
				<div id="other"></div>
				<div id="title" class="other">OTHER</div>
			</div>
			<div id="quadrant"><br/></div>
		</div>
	</body>
</html>

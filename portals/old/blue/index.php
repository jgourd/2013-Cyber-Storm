<html>
	<head>
		<title>BLUE PORTAL</title>
	</head>

	<body>
		<h1><font color="blue">BLUE PORTAL</h1>
<?php
	require_once "../../config/db.php";

	db_connect();

	if ($_POST)
	{
		foreach ($_POST as $k=>$v)
		{
			$type = substr($k, 0, 4);
			$id = substr($k, 4);

			$sql = "UPDATE logins SET ";
			if ($type == "user")
				$sql .= "username='";
			else
				$sql .= "password='";
			$sql .= mysql_real_escape_string($v) . "' WHERE id=$id;";

			db_query($sql);
		}
	}

	$result = db_query("SELECT * FROM `teams` WHERE `description`='BLUE';");
	if (mysql_numrows($result) == 0)
		die("ERROR: Can't fetch team information.");

	$name = mysql_result($result, 0, "name");
	$description = mysql_result($result, 0, "description");
	$subnet = mysql_result($result, 0, "subnet");

	echo "\t\t<h2>$name: $subnet.0.0/16</h2>\n";
	echo "\t\t<a href=\"../key\"><font color=\"gray\">[White SSH key]</font></a><br/>\n";
	echo "\t\t<a href=\"http://" . $_SERVER["SERVER_ADDR"] . ":1337/viz/scores.swf\">Scores</a>\n";
	echo "\t\t<hr/>\n";
	echo "\t\t<form method=\"post\">\n";

	$os = db_query("SELECT id,name,ip FROM os WHERE enabled='Y'");
	if (mysql_numrows($os) == 0)
		die("ERROR: Can't fetch OS types.");

	for ($i=0; $i<mysql_numrows($os); $i++)
	{
		$os_id = mysql_result($os, $i, "id");
		$os_name = mysql_result($os, $i, "name");
		$os_ip = mysql_result($os, $i, "IP");

		echo "\t\t\t<h3>$os_name ($subnet.$os_ip)</h3><p/>\n";

		$service = db_query("SELECT id,name from services WHERE name<>'HTTP' AND enabled='Y'");
		if (mysql_numrows($service) == 0)
			die("ERROR: Can't fetch service types.");

		echo "\t\t\t<table border=0>\n";
		echo "\t\t\t\t<tr><td></td><td><b>USER</b></td><td><b>PASS</b></td></tr>\n";
		for ($j=0; $j<mysql_numrows($service); $j++)
		{
			$s_id = mysql_result($service, $j, "id");
			$s_name = mysql_result($service, $j, "name");

			$scoring = db_query("SELECT DISTINCT id,username,password FROM logins WHERE team_id=(SELECT id FROM teams WHERE description='$description') AND os_id=$os_id AND service_id=$s_id;");
			if (mysql_numrows($scoring) == 0)
				die("ERROR: Can't fetch scoring information.");

			$id = mysql_result($scoring, 0, "id");
			$user = mysql_result($scoring, 0, "username");
			$pass = mysql_result($scoring, 0, "password");
			echo "\t\t\t\t<tr><td>$s_name</td><td><input type=\"text\" size=50 name=\"user$id\" value=\"$user\"/></td><td><input type=\"password\" size=50 name=\"pass$id\" value=\"$pass\"/></td></tr>\n";
		}
		echo "\t\t\t</table>\n";
		echo "\t\t\t<hr/>\n";
	}

	echo "\t\t\t<input type=\"submit\" value=\"SUBMIT\"/>\n";
	echo "\t\t</form>\n";
?>
	</body>
</html>

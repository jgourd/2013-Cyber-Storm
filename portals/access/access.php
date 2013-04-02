<?php

	session_start();

	require_once "config/db.php";
	db_connect();

	$ip = $_SERVER["REMOTE_ADDR"];

	echo <<< END
<html>
	<head>
		<title>2013 Cyber Storm Access Portal</title>
		<link rel="stylesheet" type="text/css" href="access.css" />
	</head>


END;

	$r = db_query("SELECT i.team_id,t.name,t.color FROM ips i,teams t WHERE i.ip='$ip' AND i.team_id = t.id;");
	if ($r && mysql_numrows($r) > 0)
	{
		$team_id = mysql_result($r, 0, "team_id");
		$team = mysql_result($r, 0, "name");
		$color = strtolower(mysql_result($r, 0, "color"));

		echo "\t<body class=\"$color\">\n";
		echo "\t\t<h2 class=\"title\">2013 Cyber Storm Access Portal</h2>\n\n";
		echo "\t\tYour team: $team<p/>\n\n";
	
		if (!isset($_SESSION["team"]))
		{
			login($team_id);
			echo "\t\t</div>\n";
		}
		else
		{
			if ($_POST && $_POST["num"])
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

					echo $sql;
					//db_query($sql);
				}
			}
			else
			{
/*
				$result = db_query("SELECT * FROM `teams` WHERE `description`='RED';");
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
*/
			}
		}
	}

	echo "\t</body>\n</html>\n";

function login($team_id)
{
	global $_ADMIN;

	if ($_POST && $_POST["password"])
	{
		$password = $_POST["password"];
		
		$r = db_query("SELECT id FROM acl WHERE team_id=$team_id AND password=password('$password');");
		if ($r && mysql_numrows($r) > 0)
			$_SESSION["team"] = "SUCCESS";
		header("Location: access.php");
	}
	else
	{
		echo "\t\t<form method=\"post\">\n";
		echo "\t\t\tPassword: <input type=\"password\" name=\"password\" size=\"50\"/>\n";
		echo "\t\t\t<input type=\"submit\" value=\"Login\"/>\n";
		echo "\t\t</form>\n";
	}
}

?>

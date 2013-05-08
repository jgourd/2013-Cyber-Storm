<?php

	session_start();

	require_once "config/db.php";
	db_connect();

	$ip = $_SERVER["REMOTE_ADDR"];

	echo <<< END
<html>
	<head>
		<title>2013 Cyber Storm IP Portal</title>
		<script type="text/javascript" src="../jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="ip.js"></script>
		<link rel="stylesheet" type="text/css" href="ip.css" />
	</head>


END;

	$r = db_query("SELECT i.team_id,t.name,t.color FROM ips i,teams t WHERE i.ip='$ip' AND i.timestamp_down IS NULL AND i.team_id = t.id;");
	if ($r && mysql_numrows($r) > 0)
	{
		$team_id = mysql_result($r, 0, "team_id");
		$team = mysql_result($r, 0, "name");
		$color = strtolower(mysql_result($r, 0, "color"));

		echo "\t<body class=\"$color\">\n";
		echo "\t\t<h2 class=\"title\">2013 Cyber Storm IP Portal</h2>\n\n";
		echo "\t\t<div id=\"info\">\n";
		echo "\t\t\tYour current IP address: $ip<br/>\n";
		echo "\t\t\tYour team: $team<p/>\n\n";

		if (!isset($_SESSION["team"]))
		{
			login($team_id);
			echo "\t\t</div>\n";
		}
		else
		{
			if ($_POST && isset($_POST["ip"]))
			{
				$ip = $_POST["ip"];

				if ($ip == "all")
					$r = db_query("UPDATE ips SET timestamp_down=NOW() WHERE team_id=$team_id AND timestamp_down IS NULL AND ip LIKE '10.%';");
				else
					$r = db_query("UPDATE ips SET timestamp_down=NOW() WHERE team_id=$team_id AND ip='$ip';");
			}
			else if ($_POST && isset($_POST["num"]))
			{
				$num = $_POST["num"];

				for ($i=0; $i<$num; $i++)
				{
					$ip = "10." . getOctet(1, 254) . "." . getOctet(0, 254) . "." . getOctet(1, 254);
					$r = db_query("SELECT ip FROM ips WHERE ip='$ip'");
					while ($r && mysql_numrows($r) > 0)
					{
						$ip = "10." . getOctet(1, 254) . "." . getOctet(0, 254) . "." . getOctet(1, 254);
						$r = db_query("SELECT ip FROM ips WHERE ip='$ip'");
					}
					$r = db_query("INSERT INTO ips VALUES(NULL, '$ip', $team_id, NULL, NULL);");
				}
			}

			$r = db_query("SELECT COUNT(ip) AS num FROM ips WHERE team_id=$team_id AND timestamp_down IS NULL;");
			if ($r && mysql_numrows($r) > 0)
				$num_ips = mysql_result($r, 0, "num");

			echo "\t\t\tYou currently have $num_ips active IP address(es)<br/>assigned to your team<p/>\n";
			echo "\t\t\tHow many more IP addresses do you want?<br/>\n";
//			echo "\t\t\t<form method=\"post\">\n";
			echo "\t\t\t\t<select id=\"num\" name=\"num\">\n";
			for ($i=1; $i<=256; $i++)
				echo "\t\t\t\t\t<option value=\"$i\">$i</option>\n";
			echo "\t\t\t\t</select>\n";
			echo "\t\t\t\t<input type=\"submit\" id=\"generate\" value=\"Generate\"/>\n";
//			echo "\t\t\t</form>\n";
			echo"\t\t</div>\n\n";

			echo "\t\t<div id=\"ips\">\n";
			echo "\t\t\tClick on an IP address to remove it from the list:<p/>\n\n";
			echo "\t\t\t(<span class=\"ip\">delete all</span>)<br/>\n";
			$r = db_query("SELECT ip FROM ips WHERE team_id=$team_id AND timestamp_down IS NULL ORDER BY ip;");
			if ($r && mysql_numrows($r) > 0)
			{
				for ($i=0; $i<mysql_numrows($r); $i++)
				{
					$ip = mysql_result($r, $i, "ip");

					echo "\t\t\t<span class=\"ip\">$ip</span><br/>\n";
				}
			}
			echo "\t\t</div>\n\n";
		}

		echo "\t\t<div id=\"image\" class=\"$color\"></div>\n";
	}

	echo "\t</body>\n";
	echo "</html>\n";

function login($team_id)
{
	global $_ADMIN;

	if ($_POST && $_POST["password"])
	{
		$password = $_POST["password"];
		
		$r = db_query("SELECT id FROM acl WHERE team_id=$team_id AND password=password('$password');");
		if ($r && mysql_numrows($r) > 0)
			$_SESSION["team"] = "SUCCESS";
		header("Location: ip.php");
	}
	else
	{
		echo "\t\t\t<form method=\"post\">\n";
		echo "\t\t\t\tPassword: <input type=\"password\" name=\"password\" size=\"50\"/>\n";
		echo "\t\t\t\t<input type=\"submit\" value=\"Login\"/>\n";
		echo "\t\t\t</form>\n";
	}
}

function getOctet($min, $max)
{
	return rand($min, $max);
}

?>

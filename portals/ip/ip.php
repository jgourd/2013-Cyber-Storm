<?php

	session_start();

	require_once "config/db.php";
	db_connect();

	$ip = $_SERVER["REMOTE_ADDR"];

	echo <<< END
<html>
	<head>
		<title>2013 Cyber Storm IP Portal</title>
		<link rel="stylesheet" type="text/css" href="ip.css" />
	</head>


END;

	$r = db_query("SELECT i.team_id,t.name,t.color FROM ips i,teams t WHERE i.ip='$ip' AND i.team_id = t.id;");
	if ($r && mysql_numrows($r) > 0)
	{
		$team_id = mysql_result($r, 0, "team_id");
		$team = mysql_result($r, 0, "name");
		$color = strtolower(mysql_result($r, 0, "color"));

		echo "\t<body class=\"$color\">\n";
		echo "\t\t<h2 class=\"title\">2013 Cyber Storm IP Portal</h2>\n\n";
		echo "\t\tYour current IP address: $ip<br/>\n";
		echo "\t\tYour team: $team<p/>\n\n";

		if (!isset($_SESSION["team"]))
			login($team_id);
		else
		{
			if ($_POST && $_POST["num"])
			{
				$num = $_POST["num"];

				echo "\t\tGenerating $num IP address(es)...(<a href=\"\">generate more</a>)\n";
				echo "\t\t<div id=\"ips\">\n";

				for ($i=0; $i<$num; $i++)
				{
					$ip = "10." . getOctet(0, 254) . "." . getOctet(0, 254) . "." . getOctet(1, 254);
					$r = db_query("SELECT ip FROM ips WHERE ip='$ip'");
					while ($r && mysql_numrows($r) > 0)
					{
						$ip = "10." . getOctet() . "." . getOctet() . "." . getOctet();
						$r = db_query("SELECT ip FROM ips WHERE ip='$ip'");
					}
					$r = db_query("INSERT INTO ips VALUES(NULL, '$ip', $team_id);");
					if (!$r)
						echo "\t\t\tERROR: Could not generate your IPs\n";
					else
						echo "\t\t\t$ip<br/>\n";
				}

				echo "\t\t</div>\n";
			}
			else
			{
				echo <<< END
			<form method="post">
				How many IP addresses do you want?<br/>
				<select name="num">

END;
				for ($i=1; $i<=256; $i++)
					echo "\t\t\t\t<option value=\"$i\">$i</option>\n";
				echo "\t\t\t</select>\n\t\t\t<input type=\"submit\" value=\"Generate\"/>\n\t\t</form>\n";
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
		header("Location: ip.php");
	}
	else
	{
		echo "\t\t<form method=\"post\">\n";
		echo "\t\t\tPassword: <input type=\"password\" name=\"password\" size=\"50\"/>\n";
		echo "\t\t\t<input type=\"submit\" value=\"Login\"/>\n";
		echo "\t\t</form>\n";
	}
}

function getOctet($min, $max)
{
	return rand($min, $max);
}

?>

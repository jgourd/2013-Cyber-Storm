<?php

	require_once "config/db.php";
	db_connect();

	$ip = $_SERVER["REMOTE_ADDR"];

	echo "<html>\n\t<body style=\"background: black;\">\n";

	$r = db_query("SELECT i.team_id,t.name,t.color FROM ips i,teams t WHERE i.ip='$ip' AND i.team_id = t.id;");
	if ($r && mysql_numrows($r) > 0)
	{
		$team_id = mysql_result($r, 0, "team_id");
		$team = mysql_result($r, 0, "name");
		$color = strtolower(mysql_result($r, 0, "color"));

		echo "\t\t<font style=\"color: $color;\">\n";
		echo "\t\t\t<h2>Your current IP address: $ip</h2>\n";
		echo "\t\t\t<h2>Your team: $team</h2>\n";
		
		if (isset($_POST) && isset($_POST["num"]))
		{
			$num = $_POST["num"];

			echo "\t\t\t<h2>Generating $num IP address(es)...</h2>\n";

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
					echo "\t\t\t<h2>ERROR: Could not generate your IPs</h2>\n";
				else
					echo "\t\t\t$ip<br/>\n";
			}

			echo "\t\t\t<h2><a href=\"\">Generate more</a></h2>\n";
			echo "\t\t</font>\n";
		}
		else
		{
			echo <<< END
			<form method="POST">
				<h2>How many IP addresses do you want?</h2>
				<select name="num">

END;
			for ($i=1; $i<=256; $i++)
				echo "\t\t\t\t<option value=\"$i\">$i</option>\n";
			echo "\t\t\t</select>\n\t\t\t<input type=\"submit\" value=\"Generate\"/>\n\t\t</form>\n";
		}
	}

	echo "\t</body>\n</html>\n";

function getOctet($min, $max)
{
	return rand($min, $max);
}

?>

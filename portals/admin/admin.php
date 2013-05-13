<html>
	<head>
		<title>2013 Cyber Storm Admin Portal</title>
		<link rel="stylesheet" type="text/css" href="admin.css" />
	</head>

	<body>
		<h2 class="title">2013 Cyber Storm Admin</h2>

		<a href="?wish=mac_lookup">MAC address lookup</a><br/>
		<a href="?wish=dump_db">Show DB tables</a><br/>
		<a href="?wish=award_points">Award points</a><br/>
		<a href="?wish=add_challenge">Add a challenge</a><br/>
		<a href="?wish=close_challenge">Close a challenge</a><br/>
		<a href="?wish=add_announcement">Add an announcement</a><br/>
<!--		<a href="?wish=toggle_bb">Toggle black box enabled status</a><br/>-->
		<div id="hr"></div><p/>

<?php
	require_once "config/db.php";

	db_connect();

	if ($_GET && $_GET["wish"])
	{
		switch ($_GET["wish"])
		{
			case "mac_lookup":
				if ($_POST && $_POST["mac"])
				{
					$mac = $_POST["mac"];
					$r = db_query("SELECT t.name FROM teams t, nodes n WHERE n.mac='$mac' AND n.team_id=t.id ORDER by n.timestamp_up DESC");
					if ($r && mysql_numrows($r) > 0)
					{
						$name = mysql_result($r, 0, "t.name");
						echo "$name owns MAC address $mac\n";
					}
					else
						echo "I have no record of MAC address $mac\n";
				}
				else
				{
					echo "\t\tMAC address lookup:<br/>\n";

					echo "\t\t<form method=\"post\">\n";
					echo "\t\t\t<table>\n";
					echo "\t\t\t\t<tr><td>mac: </td><td><input type=\"text\" size=17 name=\"mac\"></td></tr>\n";
					echo "\t\t\t</table>\n";
					echo "\t\t\t<input type=\"submit\" value=\"Lookup MAC\"/>\n";
					echo "\t\t</form>\n";
				}
				break;
			case "dump_db":
				$t = db_query("SHOW TABLES FROM cyberstorm;");
				for ($i=0; $i<mysql_numrows($t); $i++)
				{
					$table = mysql_result($t, $i, "Tables_in_cyberstorm");

					echo "\t\tTable: $table";
					if ($table == "scores")
					{
						echo "<a href=\"?wish=dump_table&table=scores\"> (show)</a><p/>\n\n";
						continue;
					}
					else if ($table == "attacks")
					{
						echo "<a href=\"?wish=dump_table&table=attacks\"> (show)</a><p/>\n\n";
						continue;
					}
					else if ($table == "ips")
					{
						echo "<a href=\"?wish=dump_table&table=ips\"> (show)</a><p/>\n\n";
						continue;
					}
					else if ($table == "log")
					{
						echo "<a href=\"?wish=dump_table&table=log\"> (show)</a><p/>\n\n";
						continue;
					}
					else if ($table == "nodes")
					{
						echo "<a href=\"?wish=dump_table&table=nodes\"> (show)</a><p/>\n\n";
						continue;
					}
					else if ($table == "announcements")
					{
						echo "<a href=\"?wish=dump_table&table=announcements\"> (show)</a><p/>\n\n";
						continue;
					}

					echo "\n";

					echo "\t\t<table border=1>\n";

					$c = db_query("SHOW COLUMNS FROM $table");
					echo "\t\t\t<tr>";
					for ($j=0; $j<mysql_numrows($c); $j++)
						echo "<td>" . mysql_result($c, $j, "field") . "</td>";
					echo "</tr>\n";

					$rows = db_query("SELECT * FROM $table");
					for ($j=0; $j<mysql_numrows($rows); $j++)
					{
						echo "\t\t\t<tr>";
						$row = mysql_fetch_row($rows);
						for ($k=0; $k<count($row); $k++)
							echo "<td>$row[$k]</td>";
						echo "</tr>\n";
					}
					echo "\t\t</table><p/>\n\n";
				}
				break;
			case "award_points":
				if ($_POST && ($_POST["team_id"] && $_POST["points"] && $_POST["message"]))
				{
					$team_id = $_POST["team_id"];
					$points = $_POST["points"];
					$message = str_replace("'", "''", $_POST["message"]);
					$r = db_query("SELECT name,color,score FROM teams WHERE id=$team_id");
					$c = mysql_result($r, 0, "score");
					$c = $c + $points;
					$team_name = mysql_result($r, 0, "name");
					$team_color = mysql_result($r, 0, "color");
					$r = db_query("UPDATE teams set score=$c WHERE id=$team_id");
					$r2 = db_query("INSERT INTO log VALUES (NULL,'$points points awarded to $team_name($team_color): $message', NULL)");
					$r3 = db_query("INSERT INTO announcements VALUES (NULL, '$team_name gets $points points...$message', NULL, 30)");
					if ($r && $r2 && $r3)
						echo "\t\tPoints awarded successfully.<p/>\n";
					else
						echo "\t\tERROR awarding points.<p/>\n";
				}
				else
				{
					echo "\t\tAward points:<br/>\n";

					echo "\t\t<form method=\"post\">\n";
					echo "\t\t\t<table>\n";
					echo "\t\t\t\t<tr><td>team:</td>";
					echo "<td><select name=\"team_id\">";
					$t = db_query("SELECT id,name,color FROM teams WHERE enabled='Y'");
					for ($j=0; $j<mysql_numrows($t); $j++)
					{
						$id = mysql_result($t, $j, "id");
						echo "<option value=\"$id\">" . mysql_result($t, $j, "name") . " (" . mysql_result($t, $j, "color") . ")</option>";
					}
					echo "</select></td></tr>\n";
					echo "\t\t\t\t<tr><td>Points: </td><td><input type=\"text\" size=50 name=\"points\"></td></tr>\n";
					echo "\t\t\t\t<tr><td>Message: </td><td><input type=\"text\" size=50 name=\"message\"></td></tr>\n";
					echo "\t\t\t</table>\n";
					echo "\t\t\t<input type=\"submit\" value=\"Award Points\"/>\n";
					echo "\t\t</form>\n";
				}
				break;
			case "dump_table":
				if ($_GET && $_GET["table"])
				{
					$table = $_GET["table"];
					echo "\t\tTable: $table\n";
					echo "\t\t<table border=1>\n";

					$c = db_query("SHOW COLUMNS FROM $table");
					echo "\t\t\t<tr>";
					for ($j=0; $j<mysql_numrows($c); $j++)
						echo "<td>" . mysql_result($c, $j, "field") . "</td>";
					echo "</tr>\n";

					$rows = db_query("SELECT * FROM $table");
					for ($j=0; $j<mysql_numrows($rows); $j++)
					{
						echo "\t\t\t<tr>";
						$row = mysql_fetch_row($rows);
						for ($k=0; $k<count($row); $k++)
							echo "<td>$row[$k]</td>";
						echo "</tr>\n";
					}
					echo "\t\t</table>\n";
				}
				break;
			case "add_challenge":
				if ($_POST && ($_POST["name"] && $_POST["description"] && $_POST["points"]))
				{
					$name = str_replace("'", "''", $_POST["name"]);
					$points = $_POST["points"];
					$description = str_replace("'", "''", $_POST["description"]);
					$r = db_query("INSERT INTO challenges VALUES (NULL, '$name', '$description', $points, NULL, NULL)");
					$r2 = db_query("INSERT INTO log VALUES (NULL,'$points point challenge added: $name', NULL)");
					$r3 = db_query("INSERT INTO announcements VALUES (NULL, 'New challenge ($name) for $points points: $description', NULL, 30)");
					if ($r && $r2 && $r3)
						echo "\t\tChallenge added successfully.<p/>\n";
					else
						echo "\t\tERROR adding challenge.<p/>\n";
				}
				else
				{
					echo "\t\tAdd a challenge:<br/>\n";

					echo "\t\t<form method=\"post\">\n";
					echo "\t\t\t<table>\n";
					$c = db_query("SHOW COLUMNS FROM challenges");
					for ($i=0; $i<mysql_numrows($c); $i++)
					{
						$field = mysql_result($c, $i, "field");
						if ($field == "id" || $field == "timestamp_start" || $field == "winner_id")
							continue;
						echo "\t\t\t\t<tr><td>$field: </td><td><input type=\"text\" size=100 name=\"$field\"/></td></tr>\n";
					}
					echo "\t\t\t</table>\n";
					echo "\t\t\t<input type=\"submit\" value=\"Add challenge\"/>\n";
					echo "\t\t</form>\n";
				}

				break;
			case "close_challenge":
				if ($_POST)
				{
					foreach ($_POST as $k=>$v)
					{
						$id=-1;
						if ($v == "on")
							$id = substr($k, 5);

						if ($id != -1)
						{
							$winner_id = $_POST["winner$id"];
							$r = db_query("SELECT name FROM teams WHERE id=$winner_id");
							$team_name = mysql_result($r, 0, "name");
							$r = db_query("SELECT name FROM challenges WHERE id=$id");
							$challenge_name = mysql_result($r, 0, "name");
							$r = db_query("UPDATE challenges SET winner_id=$winner_id WHERE id=$id");
							$r2 = db_query("SELECT challenges FROM teams WHERE id=$winner_id");
							$c = mysql_result($r2, 0, "challenges");
							$c = $c + 1;
							$r2 = db_query("UPDATE teams SET challenges=$c WHERE id=$winner_id");
							$r3 = db_query("SELECT score FROM teams WHERE id=$winner_id");
							$c = mysql_result($r3, 0, "score");
							$r3 = db_query("SELECT points FROM challenges WHERE id=$id");
							$c = $c + mysql_result($r3, 0, "points");
							$r3 = db_query("UPDATE teams set score=$c WHERE id=$winner_id");
							$r4 = db_query("INSERT INTO log VALUES (NULL,'Challenge ended: " . str_replace("'", "''", $challenge_name) . " (winner: $team_name)',NULL)");
							$r5 = db_query("INSERT INTO announcements VALUES (NULL, '$team_name wins challenge: " . str_replace("'", "''", $challenge_name) . "!', NULL, 30)");
							if ($r && $r2 && $r3 && $r4 && $r5)
								echo "\t\tChallenge closed successfully.<p/>\n";
							else
								echo "\t\tERROR closing challenge.<p/>\n";
						}
					}
				}
				else
				{
					echo "\t\tClose a challenge:<p/>\n";

					echo "\t\t<form method=\"post\">\n";
					echo "\t\t\t<table border=1>\n";
					$c = db_query("SHOW COLUMNS FROM challenges");
					echo "\t\t\t\t<tr>";
					for ($i=0; $i<mysql_numrows($c); $i++)
					{
						$field = mysql_result($c, $i, "field");
						if ($field == "winner_id")
							continue;
						echo "<td>$field</td>";
					}
					echo "<td>close</td><td>winner</td></tr>\n";
					$rows = db_query("SELECT id,name,description,points,timestamp_start FROM challenges WHERE winner_id IS NULL");
					for ($i=0; $i<mysql_numrows($rows); $i++)
					{
						echo "\t\t\t\t<tr>";
						$row = mysql_fetch_row($rows);
						for ($j=0; $j<count($row); $j++)
							echo "<td>$row[$j]</td>";
						$id = mysql_result($rows, $i, "id");
						echo "<td><input type=\"checkbox\" name=\"close$id\"/></td>";
						echo "<td><select name=\"winner$id\">";
						$t = db_query("SELECT id,name,color FROM teams WHERE enabled='Y'");
						for ($j=0; $j<mysql_numrows($t); $j++)
						{
							$id = mysql_result($t, $j, "id");
							echo "<option value=\"$id\">" . mysql_result($t, $j, "name") . " (" . mysql_result($t, $j, "color") . ")</option>";
						}
						echo "</select>";
						echo "</tr>\n";
					}
					echo "\t\t\t</table>\n";
					echo "\t\t\t<input type=\"submit\" value=\"Close challenge\"/>\n";
					echo "\t\t</form>\n";
				}
				break;
			case "add_announcement":
				if ($_POST && ($_POST["message"] && $_POST["duration"]))
				{
					$message = str_replace("'", "''", $_POST["message"]);
					$duration = $_POST["duration"];
					$r = db_query("INSERT INTO announcements VALUES (NULL, '$message', NULL, $duration)");
					if ($r)
						echo "\t\tAnnouncement added successfully.<p/>\n";
					else
						echo "\t\tERROR adding announcement.<p/>\n";
				}

				else
				{
					echo "\t\tAdd an announcement:<p/>\n";

					echo "\t\t<form method=\"post\">\n";
					echo "\t\t\t<table>\n";
					$c = db_query("SHOW COLUMNS FROM announcements");
					for ($i=0; $i<mysql_numrows($c); $i++)
					{
						$field = mysql_result($c, $i, "field");
						if ($field == "id" || $field == "timestamp")
							continue;
						echo "\t\t\t\t<tr><td>$field: </td><td><input type=\"text\" size=50 name=\"$field\"/></td></tr>\n";
					}
					echo "\t\t\t</table>\n";
					echo "\t\t\t<input type=\"submit\" value=\"Announce\"/>\n";
					echo "\t\t</form>\n";
				}
				break;
			case "toggle_bb":
				$r = db_query("SELECT enabled FROM vms WHERE name='Black Box'");
				$enabled = mysql_result($r, 0, "enabled");
				$r = db_query("UPDATE vms SET enabled='" . ($enabled == 'N' ? "Y" : "N") . "' WHERE name='Black Box'");
				echo "Black box now " . ($enabled == 'N' ? "enabled" : "disabled") . ".<p/>\n";
				break;
		}
	}
?>
	</body>
</html>

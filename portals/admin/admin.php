<html>
	<head>
		<title>2013 Cyber Storm Admin Portal</title>
		<link rel="stylesheet" type="text/css" href="admin.css" />
	</head>

	<body>
		<h2>2013 Cyber Storm Admin</h2>

		Your wish is my command:<br/>
		<a href="?wish=dump_db">Show DB tables</a><br/>
		<a href="?wish=add_challenge">Add a challenge</a><br/>
		<a href="?wish=close_challenge">Close a challenge</a><br/>
		<a href="?wish=add_announcement">Add an announcement</a><br/>
<!--		<a href="?wish=toggle_bb">Toggle black box enabled status</a><br/>-->
		<hr/>

<?php
	require_once "config/db.php";

	db_connect();

	if (isset($_GET) && isset($_GET["wish"]))
	{
		switch ($_GET["wish"])
		{
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
			case "dump_table":
				if (isset($_GET) && (isset($_GET["table"])))
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
				if (isset($_POST) && (isset($_POST["name"]) && isset($_POST["description"]) && isset($_POST["points"])))
				{
					if ($_POST["name"] == "" || $_POST["description"] == "" || $_POST["points"] == "")
						echo "Incomplete challenge<p/>\n";
					else
					{
						$r = db_query("INSERT INTO challenges VALUES (NULL, '" . $_POST["name"] . "', '" . $_POST["description"] . "', " . $_POST["points"] . ", NULL, NULL)");
						if ($r)
							echo "\t\tChallenge added successfully.<p/>\n";
						else
							echo "\t\tERROR adding challenge.<p/>\n";
					}
				}
				else
				{
					echo "\t\tAdd a challenge:<br/>\n";

					echo "\t\t<form method=\"POST\">\n";
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
				if (isset($_POST))
				{
					foreach ($_POST as $k=>$v)
					{
						$id=-1;
						if ($v == "on")
							$id = substr($k, 5);

						if ($id != -1)
						{
							$winner_id = $_POST["winner$id"];
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
							if ($r && $r2 && $r3)
								echo "\t\tChallenge closed successfully.<p/>\n";
							else
								echo "\t\tERROR closing challenge.<p/>\n";
						}
					}
				}

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
				break;
			case "add_announcement":
				if (isset($_POST) && (isset($_POST["message"]) && isset($_POST["duration"])))
				{
					if ($_POST["message"] == "" || $_POST["duration"] == "")
						echo "Incomplete announcement.<p/>\n";
					else
					{
						$r = db_query("INSERT INTO announcements VALUES (NULL, '" . $_POST["message"] . "', NULL, " . $_POST["duration"] . ")");
						if ($r)
							echo "\t\tAnnouncement added successfully.<p/>\n";
						else
							echo "\t\tERROR adding announcement.<p/>\n";
					}
				}

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

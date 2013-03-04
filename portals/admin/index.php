<html>
	<head>
		<title>2013 Cyber Storm ADMIN</title>
	</head>

	<body>
		<h1>2013 Cyber Storm Admin</h1>

		Your wish is my command:<br/>
		<a href="?wish=dump_db">Show DB tables</a><br/>
		<a href="?wish=add_challenge">Add a challenge</a><br/>
		<a href="?wish=close_challenge">Close a challenge</a><br/>
		<a href="?wish=add_announcement">Add an announcement</a><br/>
		<a href="?wish=toggle_bb">Toggle black box enabled status</a><br/>
		<hr/>

<?php
	require_once "../../config/db.php";

	db_connect();

	if (isset($_GET) && isset($_GET["wish"]))
	{
		switch ($_GET["wish"])
		{
			case "dump_db":
				echo "DB tables:<p/>\n";

				$t = db_query("SHOW TABLES FROM cyberstorm;");
				for ($i=0; $i<mysql_numrows($t); $i++)
				{
					$table = mysql_result($t, $i, "Tables_in_cyberstorm");

					echo "<h3> Table: $table";
					if ($table == "scores")
					{
						echo "<a href=\"?wish=dump_scores\"> (show)</a>";
						continue;
					}
					else if ($table == "attacks")
					{
						echo "<a href=\"?wish=dump_attacks\"> (show)</a>";
						continue;
					}
					echo "</h3>\n";

					echo "<table border=1>\n";

					$c = db_query("SHOW COLUMNS FROM $table");
					echo "<tr>";
					for ($j=0; $j<mysql_numrows($c); $j++)
						echo "<td><b>" . mysql_result($c, $j, "field") . "</b></td>";
					echo "</tr>\n";

					$rows = db_query("SELECT * FROM $table");
					for ($j=0; $j<mysql_numrows($rows); $j++)
					{
						echo "<tr>";
						$row = mysql_fetch_row($rows);
						for ($k=0; $k<count($row); $k++)
							echo "<td>$row[$k]</td>";
						echo "</tr>\n";
					}
					echo "</table>\n";
				}
				break;
			case "dump_scores":
				$table = "scores";
				echo "<h3> Table: $table</h3>\n";
				echo "<table border=1>\n";

				$c = db_query("SHOW COLUMNS FROM $table");
				echo "<tr>";
				for ($j=0; $j<mysql_numrows($c); $j++)
					echo "<td><b>" . mysql_result($c, $j, "field") . "</b></td>";
				echo "</tr>\n";

				$rows = db_query("SELECT * FROM $table");
				for ($j=0; $j<mysql_numrows($rows); $j++)
				{
					echo "<tr>";
					$row = mysql_fetch_row($rows);
					for ($k=0; $k<count($row); $k++)
						echo "<td>$row[$k]</td>";
					echo "</tr>\n";
				}
				echo "</table>\n";
				break;
			case "dump_attacks":
				$table = "attacks";
				echo "<h3> Table: $table</h3>\n";
				echo "<table border=1>\n";

				$c = db_query("SHOW COLUMNS FROM $table");
				echo "<tr>";
				for ($j=0; $j<mysql_numrows($c); $j++)
					echo "<td><b>" . mysql_result($c, $j, "field") . "</b></td>";
				echo "</tr>\n";

				$rows = db_query("SELECT * FROM $table");
				for ($j=0; $j<mysql_numrows($rows); $j++)
				{
					echo "<tr>";
					$row = mysql_fetch_row($rows);
					for ($k=0; $k<count($row); $k++)
						echo "<td>$row[$k]</td>";
					echo "</tr>\n";
				}
				echo "</table>\n";
				break;
			case "add_challenge":
				if (isset($_POST))
				{
					if ($_POST["name"] == "" || $_POST["description"] == "" || $_POST["points"] == "")
						echo "Incomplete challenge<p/>\n";
					else
					{
						$r = db_query("INSERT INTO challenges VALUES (NULL, '" . $_POST["name"] . "', '" . $_POST["description"] . "', " . $_POST["points"] . ", NULL, '')");
						if ($r)
							echo "Challenge added successfully.<p/>\n";
						else
							echo "ERROR adding challenge.<p/>\n";
					}
				}

				echo "Add a challenge:<p/>\n";

				echo "<form method=\"post\">\n";
				echo "<table>\n";
				$c = db_query("SHOW COLUMNS FROM challenges");
				for ($i=0; $i<mysql_numrows($c); $i++)
				{
					$field = mysql_result($c, $i, "field");
					if ($field == "id" || $field == "timestamp_start" || $field == "winner_id")
						continue;
					echo "<tr><td>$field: </td><td><input type=\"text\" size=100 name=\"$field\"/></td></tr>\n";
				}
				echo "</table>\n";
				echo "<input type=\"submit\" value=\"Add challenge\"/>\n";
				echo "</form>\n";

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
								echo "Challenge closed successfully.<p/>\n";
							else
								echo "ERROR closing challenge.<p/>\n";
						}
					}
				}

				echo "Close a challenge:<p/>\n";

				echo "<form method=\"post\">\n";
				echo "<table border=1>\n";
				$c = db_query("SHOW COLUMNS FROM challenges");
				echo "<tr>";
				for ($i=0; $i<mysql_numrows($c); $i++)
				{
					$field = mysql_result($c, $i, "field");
					if ($field == "winner_id")
						continue;
					echo "<td><b>$field</b></td>";
				}
				echo "<td><b>close</b></td><td><b>winner</b></td></tr>\n";
				$rows = db_query("SELECT id,name,description,points,timestamp_start FROM challenges WHERE winner_id=0");
				for ($i=0; $i<mysql_numrows($rows); $i++)
				{
					echo "<tr>";
					$row = mysql_fetch_row($rows);
					for ($j=0; $j<count($row); $j++)
						echo "<td>$row[$j]</td>";
					$id = mysql_result($rows, $i, "id");
					echo "<td><input type=\"checkbox\" name=\"close$id\"/></td>";
					echo "<td><select name=\"winner$id\">";
					$t = db_query("SELECT id,name,description FROM teams WHERE enabled='Y'");
					for ($j=0; $j<mysql_numrows($t); $j++)
					{
						$id = mysql_result($t, $j, "id");
						echo "<option value=\"$id\">" . mysql_result($t, $j, "name") . " (" . mysql_result($t, $j, "description") . ")</option>";
					}
					echo "</select>";
					echo "</tr>\n";
				}
				echo "</table>\n";
				echo "<input type=\"submit\" value=\"Close challenge\"/>\n";
				echo "</form>\n";
				break;
			case "add_announcement":
				if (isset($_POST))
				{
					if ($_POST["message"] == "" || $_POST["duration"] == "")
						echo "Incomplete announcement.<p/>\n";
					else
					{
						$r = db_query("INSERT INTO announcements VALUES (NULL, '" . $_POST["message"] . "', NULL, " . $_POST["duration"] . ")");
						if ($r)
							echo "Announcement added successfully.<p/>\n";
						else
							echo "ERROR adding announcement.<p/>\n";
					}
				}

				echo "Add an announcement:<p/>\n";

				echo "<form method=\"post\">\n";
				echo "<table>\n";
				$c = db_query("SHOW COLUMNS FROM announcements");
				for ($i=0; $i<mysql_numrows($c); $i++)
				{
					$field = mysql_result($c, $i, "field");
					if ($field == "id" || $field == "timestamp")
						continue;
					echo "<tr><td>$field: </td><td><input type=\"text\" size=50 name=\"$field\"/></td></tr>\n";
				}
				echo "</table>\n";
				echo "<input type=\"submit\" value=\"Announce\"/>\n";
				echo "</form>\n";
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

var NUM_TEAMS;
var UPDATE_INTERVAL = 5000;
var DIGIT_INTERVAL = 10;
var SCORE_INCREMENT = 10;

jQuery(document).ready(function()
{
	$.ajax(
	{
		url: "get_teams.php",
		type: "POST",
		success: function(data)
		{
			NUM_TEAMS = data;
		}
	});

	refresh = function()
	{
		$.ajax(
		{
			url: "get_scores.php",
			type: "POST",
			success: function(data)
			{
				var scores = data.split("|")[0].split(",");
				var challenges = data.split("|")[1].split(",");

				for (var i=0; i<NUM_TEAMS; i++)
				{
					var score_id = ".score" + (i + 1);
					var challenge_id = ".challenge" + (i + 1);
					var cur_score = parseInt($(score_id).text());
					var new_score = scores[i];
					var increment = SCORE_INCREMENT;

					$(challenge_id).text(challenges[i]);
					if (new_score != cur_score)
					{
						if (new_score < cur_score)
							increment *= -1;

						setTimeout(updateScore, DIGIT_INTERVAL, $(score_id), cur_score, new_score, increment);
					}
				}
			}
		});
	};

	setInterval(function()
	{
		refresh();
	}, UPDATE_INTERVAL);
});

function updateScore(team, score, target_score, increment)
{
	$(team).text(score);

	if (score != target_score)
	{
		if ((increment > 0 && (target_score - score < increment)) || (increment < 0 && (target_score - score > increment)))
			score = target_score;
		else
			score += increment;

		setTimeout(updateScore, DIGIT_INTERVAL, $(team), score, target_score, increment);
	}
}

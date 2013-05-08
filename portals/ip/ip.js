jQuery(document).ready(function()
{
	$("#generate").click(function()
	{
		$(this).attr("disabled", "disabled");
		num = $(num).find(":selected").text();

		$.ajax(
		{
			url: "",
			type: "POST",
			data: { num: num },
			success: function(result)
			{
				location = location.href;
			}
		});
	});

	$(".ip").click(function()
	{
		ip = $(this).text();

		if ($(this).text() == "delete all")
			ip = "all";

		$.ajax(
		{
			url: "",
			type: "POST",
			data: { ip: ip },
			success: function(result)
			{
				location = location.href;
			}
		});
	});
});

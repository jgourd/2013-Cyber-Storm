jQuery(document).ready(function()
{
	$("#generate").click(function()
	{
		$(this).attr("disabled", "disabled");
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

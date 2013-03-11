var NUM_NODES = 90;
var RADIUS = 10;
var QUADRANT_WIDTH = 15;
var QUADRANT_HEIGHT = 6;
var MAX_NODES = QUADRANT_WIDTH * QUADRANT_HEIGHT;
var RED = "0-#a90329:30-#1f0001:100";
var BLUE = "0-#0455e0:30-#020087:100";
var GREEN = "0-#04e526:30-#00290c:100";
var YELLOW = "0-#f2f200:30-#292b00:100";
var PURPLE = "0-#ca00d1:30-#260029:100";
var ORANGE = "0-#ef6700:30-#3b0700:100";
var OTHER = "0-#acacac:30-#292929:100";
var COLORS = [ RED, BLUE, GREEN, YELLOW, PURPLE, ORANGE, OTHER ];
var TEAMS = [ "RED", "BLUE", "GREEN", "YELLOW", "PURPLE", "ORANGE", "OTHER" ];

function Node(x, y, r, color)
{
	this.origin_x = x;
	this.origin_y = y;
	this.cur_x = x;
	this.cur_y = y;
	this.r = r;
	this.color = color;
}

Raphael.el.setColor = function(c)
{
	this.attr({fill: c, stroke: "#494949"});
};

jQuery(document).ready(function()
{
	var quadrants = [];

	for (var i=0; i<TEAMS.length; i++)
	{
		quadrants.push(new Raphael(TEAMS[i].toLowerCase()));
		showNodes(quadrants[i], i);
	}
});

function showNodes(canvas, team_id)
{
	var nodes = [];
	var R_nodes = canvas.set();
	var row = 0;
	var col = 0;
	var max_nodes = (team_id < TEAMS.length - 1 ? MAX_NODES : MAX_NODES * 2);
	var width = (team_id < TEAMS.length - 1 ? QUADRANT_WIDTH : QUADRANT_WIDTH * 2 + 1);
	var num_nodes = Math.floor(Math.random() * max_nodes + 1);

	for (var i=0; i<num_nodes; i++)
	{
		var node = new Node((col+1)*30, (row+1)*30, RADIUS, COLORS[team_id]);
		var R_node = canvas.circle(node.cur_x, node.cur_y, node.r);
	
		R_node.setColor(node.color);

		nodes.push(node);
		R_nodes.push(R_node);

		col++;
		if (col == width)
		{
			col = 0;
			row++;
		}
	}
}

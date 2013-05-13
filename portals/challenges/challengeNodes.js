var num_columns=5;


var team_1_symbol = new Image();
var team_2_symbol = new Image();
var team_3_symbol = new Image();
var team_4_symbol = new Image();
var team_5_symbol = new Image();
var team_6_symbol = new Image(); 
team_1_symbol.src = 'images/team_1.png';
team_2_symbol.src = 'images/team_2.png';
team_3_symbol.src = 'images/team_3.png';
team_4_symbol.src = 'images/team_4.png';
team_5_symbol.src = 'images/team_5.png';
team_6_symbol.src = 'images/team_6.png';

var nameList = new Array();
var descList = new Array();
var pointsList = new Array();
var winnerList = new Array();
function writeMessage(messageLayer, message) {
	var context = messageLayer.getContext();
	messageLayer.clear();
	context.font = '20pt Calibri';
	context.fillStyle = 'white';
	context.fillText("Challenge : "+nameList[message.targetNode.id], 10, 25);
	context.font = '10pt Calibri';
	context.fillStyle = 'white';
	context.fillText("Contract : "+descList[message.targetNode.id], 10, 55);
	context.font = '18pt Calibri';
	context.fillStyle = 'white';
	context.fillText("Points awarded : "+pointsList[message.targetNode.id], 10, 85);
	if(winnerList[message.targetNode.id]!="")
	{
		context.font = '18pt Calibri';
		context.fillStyle = 'white';
		context.fillText("Winner : "+winnerList[message.targetNode.id], 10, 115);
	}
}

var stage = new Kinetic.Stage({
	container: 'container',
	width: 1024,
	height: 1000
});
var shapesLayer = new Kinetic.Layer();
var messageLayer = new Kinetic.Layer();
var messageLayer2 = new Kinetic.Layer();
var layer = new Kinetic.Layer();

var imageObj = new Image();
imageObj.onload = function() {
	pullChallenges();

};


function pullChallenges(){
new_nodes = [];

// fetch the nodes from the DB
$.ajax(
{
	url: "get_challenges.php",
	type: "POST",
	success: function(data)
	{

		if (data == "")
			return;

		var fetched_nodes = data.split("||");

		// grab team nodes
		for (var j=0; j<fetched_nodes.length; j++)
		{
			var c_id = fetched_nodes[j].split("|-")[0];
			var c_name = fetched_nodes[j].split("|-")[1];
			var c_desc = fetched_nodes[j].split("|-")[2];
			var c_points = fetched_nodes[j].split("|-")[3];
			var c_timeStart = fetched_nodes[j].split("|-")[4];
			var c_winner = fetched_nodes[j].split("|-")[5];
			var c_winnerName = fetched_nodes[j].split("|-")[6];

			var node_x = 40+((j%num_columns)*120);
			var node_y = 150+(Math.floor(j/num_columns)*140);
			var challengeNode = new Kinetic.Image({
				x: node_x,
				y: node_y,
				image: imageObj,
				width: 100,
				height: 100,
				stroke: 'white',
				strokeWidth:3,
				strokeEnabled: true
			});
			//var desc = new String(c_name + " <\\r>: " +c_desc + " FOR "+c_points + " points. Winner = " + c_winner);
			var name = new String(c_name);
			var desc = new String(c_desc);
			var points = new String(c_points);
			var winnerName = new String(c_winnerName);

			var displayName = new String(name);
			var maxCharLength = 10;
			if(displayName.length>maxCharLength)
				displayName=displayName.substr(0,maxCharLength);
			var simpleLabel = new Kinetic.Label({
				x: node_x+5,
				y: node_y-30,
				width: 40,
				opacity: 0.75,
				text: {
				  text: displayName,
				  fontFamily: 'Calibri',
				  fontSize: 18,
				  padding: 5,
				  fill: 'white',
				  align: 'center'
				},
				rect: {
				  fill: 'black',
				}
			});

			nameList[j]=name;
			descList[j]=desc;
			pointsList[j]=points;
			winnerList[j]=winnerName;
			challengeNode.id=j;
//passes a mouse event. we use target node to detect which description to display
			challengeNode.on('mousemove', function(j) { 
				writeMessage(messageLayer, j);
			});
			layer.add(challengeNode);
			layer.add(simpleLabel);
			checkWinners(c_winner,j, node_x, node_y);
	
		}
		stage.add(layer);
	}
});	

	stage.add(layer);
}

function checkWinners(c_winner,j, node_x, node_y)
{
	if(c_winner!="")
	{
		var winnerImage;
		var winnerColor;
		switch(c_winner)
		{
			case "1":
				winnerImage=team_1_symbol;
				winnerColor="red";
				break;
			case "2":
				winnerImage=team_2_symbol;
				winnerColor="blue";
				break;
			case "3":
				winnerImage=team_3_symbol;
				winnerColor="green";
				break;
			case "4":
				winnerImage=team_4_symbol;
				winnerColor="yellow";
				break;
			case "5":
				winnerImage=team_5_symbol;
				winnerColor="purple";
				break;
			case "6":
				winnerImage=team_6_symbol;
				winnerColor="orange";
				break;
			default:
				winnerImage=team_1_symbol;
				winnerColor="red";
				break;
		}
		var challengeNodeOverlay = new Kinetic.Image({
			x: node_x+20,
			y: node_y+20,
			image: winnerImage,
			width: 60,
			height: 60,
			stroke: winnerColor,
			strokeWidth:1,
			strokeEnabled: true,
          fillRadialGradientStartPoint: 0,
          fillRadialGradientStartRadius: 0,
          fillRadialGradientEndPoint: 0,
          fillRadialGradientEndRadius: 55,
          fillRadialGradientColorStops: [0, 'black', 0.5, winnerColor, 1, 'white'],
		});
		layer.add(challengeNodeOverlay);
	}
}

imageObj.src = './1.jpg';


      stage.add(messageLayer);

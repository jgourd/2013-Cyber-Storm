

var descList = new Array();
      function writeMessage(messageLayer, message) {
        var context = messageLayer.getContext();
        messageLayer.clear();
        context.font = '18pt Calibri';
        context.fillStyle = 'white';
        context.fillText(descList[message.targetNode.id], 10, 25);
      }
      var stage = new Kinetic.Stage({
        container: 'container',
        width: 1024,
        height: 200
      });
	var shapesLayer = new Kinetic.Layer();
	var messageLayer = new Kinetic.Layer();
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

			var y = 30;
			var yoda = new Kinetic.Image({
				x: 40+(j*120),
				y: stage.getHeight() / 2 - 59,
				image: imageObj,
				width: 100,
				height: 100,
				stroke: 'white',
				strokeWidth:3,
				strokeEnabled: true
			});
			var desc = new String(c_name + " : " +c_desc + " FOR "+c_points + " points. Winner = " + c_winner);
			descList[j]=desc;
			yoda.id=j;
			yoda.on('mousemove', function(j) { //passes a mouse event. we use target node to detect which description to display
				writeMessage(messageLayer, j);
			});
			layer.add(yoda);
		}
		stage.add(layer);
	}
});	

	stage.add(layer);
}


imageObj.src = 'http://i.imgur.com/QoEEqjh.png';




      stage.add(messageLayer);

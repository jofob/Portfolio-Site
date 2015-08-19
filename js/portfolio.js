document.body.onload = setup;

/* -GLOBAL VARIABLES- */
var header;
var pieces;

function setup(){
	header = document.getElementById("frontHead");
	buildPage();
	window.addEventListener('scroll', function(event){
			var distanceY = window.pageYOffset || document.documentElement.scrollTop;
			if (distanceY >= 100) {
				shrinkHeader();		
			}else if (header.classList.contains("small")){
				reset();
			}
		});
}

function shrinkHeader(){
	header.classList.add("small");
}

function reset(){
	header.classList.remove("small");
}

function buildPage(){
	pieces = document.getElementById("pieces")
	var idx = 0;
	while (idx < portPieces.length){
		var currPiece = portPieces[idx];
		var div = document.createElement('div');
		pieces.appendChild(div);
		div.ID = "p"+ toString(idx);
		div.className= "portPiece";
		div.innerHTML = currPiece.desc;
		idx++; 
	}
}
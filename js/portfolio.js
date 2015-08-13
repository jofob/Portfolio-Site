window.onload = setup;

/* -GLOBAL VARIABLES- */
var header;

function setup(){
	header = document.getElementById("frontHead");
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
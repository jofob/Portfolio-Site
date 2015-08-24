document.body.onload = setup;

/* -GLOBAL VARIABLES- */
var header;
var pieces;
var overlay;
var logo;
var nav;
var tag;
var wasBig = true;

$(function() {
		  $('a[href*=#]:not([href=#])').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			  var target = $(this.hash);
			  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			  if (target.length) {
				$('html,body').animate({
				  scrollTop: target.offset().top
				}, 750, 'easeOutExpo');
				return false;
			  }
			}
		  });
		});


		
		
function setup(){
	header = document.getElementById("frontHead");
	logo = document.getElementById("logo");
	nav = document.getElementById("nav");
	tag = document.getElementById("tag");
	overlay = document.getElementById("overlay");
	overlay.onclick = hideOverlay;
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

function hideOverlay(){
	overlay.style.visibility = "hidden";
}

function revealOverlay(evt){
	var target = evt.target;
	overlay.style.visibility = "visible";
}

function shrinkHeader(){
	header.classList.add("small");
	logo.classList.add("smallLogo");
	tag.classList.add("clear");
	if (wasBig){
		nav.classList.add("clear");
		wasBig = false;
	}
	setTimeout(function(){ 
		nav.className = "navSmall"}, 400);	
	}

function reset(){
	header.classList.remove("small");
	logo.classList.remove("smallLogo");
	nav.style.opacity="0";
	wasBig=true;
	setTimeout(function(){ 
		nav.className = "";
		nav.style.opacity="1";
		tag.classList.remove("clear");}, 600);	
	}
	


function buildPage(){
	pieces = document.getElementById("portfolio")
	var idx = 0;
	while (idx < portPieces.length){
		var currPiece = portPieces[idx];
		var div = document.createElement('div');
		pieces.appendChild(div);
		var imgDiv = document.createElement('div');
		div.appendChild(imgDiv);
		div.className = "portPiece";
		imgDiv.className = "portImg";
		imgDiv.style.background = "url("+ currPiece.thumb + ")";
		var title = document.createElement("h2");
		var titleText = document.createTextNode(currPiece.title);
		title.appendChild(titleText);
		div.appendChild(title);
		var desc = document.createElement('p');
		var descText = document.createTextNode(currPiece.desc);
		desc.appendChild(descText);
		div.appendChild(desc);
		div.onclick = revealOverlay;
		idx++; 
	}
}

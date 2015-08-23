//--------JULIA'S AMAZING FISHING GAME -------------------//

//--setting up images--//
PImage wave1;
PImage wave2;
PImage wave3;
PImage boat;
PImage hook;
PImage fish;
PImage fishGhost;
wave3 = loadImage("img/wave3.png");
wave2 = loadImage("img/wave2.png");
wave1 = loadImage("img/wave1.png");
boat = loadImage("img/boatFlip.png");
hook = loadImage("img/hook.png");
fish = loadImage("img/fishFlip.png");
fishGhost = loadImage("img/fishGhost.png");
/* @pjs preload = "img/boat.png", "img/boatFlip.png","img/fishFlip.png","img/fish.png", "img/deadFish.png" */


//--setting general global variables--//
int lineOffset = 200;
int lineHeight = 0;
int lineX;
int lineY;
boolean lineDown = false;
int fishMouthOffset = 0;


//--setting parameters for moving objects --//
int[] w1coos = new int[2];
w1coos[0] = "-50";
w1coos[1] = "375";
boolean w1Right = false;
boolean w1Up = false;


int[] w2coos = new int[2];
w2coos[0] = "-33";
w2coos[1] = "300";
boolean w2Right = false;
boolean w2Up = false;

int[] w3coos = new int[2];
w3coos[0] = "-15";
w3coos[1] = "260";
boolean w3Right = false;
boolean w3Up = false;

int[] bcoos = new int[2];
bcoos[0] = "200";
bcoos[1] = "200";
boolean bRight = true;
boolean bUp = false;
	

int[] fishCoos = new int[2];
fishCoos[0] = "200";
fishCoos[1] = "500";
boolean fishAlive = true;
boolean fishNotCaught = true;
boolean fRight = true;
boolean fUp = false;


//-------------FUNCTIONS---------------//
 
void setup() {
	size(600,600);
	frameRate (25);
}

void drawBackground (){
	background(208,226,225);
}



void moveWave1(){
//---- moving horizontally-----//
	if ( w1Right ){
		w1coos[0]--;
		if ( w1coos[0] == -50 ){
			w1Right = false;
		}
	} else { 
		w1coos[0]++;
		if ( w1coos[0] == 0 ){
			w1Right = true;
		}
	}
	
//---- moving vertically-----//
	if ( w1Up ){
		w1coos[1]++;
		if ( w1coos[1] == 375 ){
			w1Up = false;
		}
	} else { 
		w1coos[1]--;
		if ( w1coos[1] == 360 ){
			w1Up = true;
		}
	}	
}

void moveWave2(){
//---- moving horizontally-----//
	if ( w2Right ){
		w2coos[0]--;
		if ( w2coos[0] == -33 ){
			w2Right = false;
		}
	} else { 
		w2coos[0]++;
		if ( w2coos[0] == 0 ){
			w2Right = true;
		}
	}
	
//---- moving vertically-----//
	if ( w2Up ){
		w2coos[1]++;
		if ( w2coos[1] == 300 ){
			w2Up = false;
		}
	} else { 
		w2coos[1]--;
		if ( w2coos[1] == 287 ){
			w2Up = true;
		}
	}	
}

void moveWave3(){
//---- moving horizontally-----//
	if ( w3Right ){
		w3coos[0]--;
		if ( w3coos[0] == -35 ){
			w3Right = false;
		}
	} else { 
		w3coos[0]++;
		if ( w3coos[0] == 0 ){
			w3Right = true;
		}
	}
	
//---- moving vertically-----//
	if ( w3Up ){
		w3coos[1]++;
		if ( w3coos[1] == 260 ){
			w3Up = false;
		}
	} else { 
		w3coos[1]--;
		if ( w3coos[1] == 240 ){
			w3Up = true;
		}
	}	
}

void moveBoat(){
//---- moving horizontally-----//
	if ( bRight ){
		bcoos[0]--;
		if ( bcoos[0] == 0 ){
			bRight = false;
			boat = loadImage("img/boat.png")
			lineOffset = 0; 
		}
	} else { 
		bcoos[0]++;
		if ( bcoos[0] == 400 ){
			bRight = true;
			boat = loadImage("img/boatFlip.png");
			lineOffset = 200;
		}
	}
	
//---- moving vertically-----//
	if ( bUp ){
		bcoos[1]++;
		if ( bcoos[1] == 225 ){
			bUp = false;
		}
	} else { 
		bcoos[1]--;
		if ( bcoos[1] == 199 ){
			bUp = true;
		}
	}	
}
	
void makeWaves(){
//--handles calling the moveWave and Boat functions--//
//--once new positions have been calculated, draws images--//
	moveWave1();	
	moveWave2();
	moveWave3();
	moveBoat();
	image(wave3, w3coos[0], w3coos[1]);
	image(wave2, w2coos[0], w2coos[1]);
	image(boat, bcoos[0] , bcoos[1]);
	image(wave1, w1coos[0], w1coos[1]);
		
}

void drawLine(){
//--draws the line rectangle and hook --//
	noStroke();
	fill(255,243,228);
	lineX = (bcoos[0]+ lineOffset);
	lineY = (bcoos[1]) + 157;
	rect( lineX , lineY, 2, lineHeight);
	image(hook, (lineX - 9), (lineY + lineHeight));
}

void moveLine(){
//--changes the size of the line rectangle depending on if it is being lowered or not--//
	if ( lineDown && lineHeight < 180){
		lineHeight = lineHeight + 3;
	} else if (lineDown && lineHeight >= 180){
		lindDown = !lineDown;
	}else if (lineHeight != 0){
		lineHeight = lineHeight - 3;
	}
}

void drawFish(){
//---determines how to draw the fish, swimming fish, reeled fish, or fishGhost---//

	if (fishAlive && fishNotCaught){
		moveFish();
		image(fish, fishCoos[0], fishCoos[1]);
	} else if (fishAlive) { 
		reelFish();
	} else {
		image(fishGhost, 215, 40);
	}
}

boolean randomFishMove(){
//---this function provides a true boolean randomly (about once every 30 times)---//
//---this is used for making the fish randomly change direction---//

	boolean[] fishMind = new boolean[30];
	fishMind[0] = false;
	fishMind[1] = false;
	fishMind[2] = false;
	fishMind[3] = false;
	fishMind[4] = false;
	fishMind[5] = false;
	fishMind[6] = false;
	fishMind[7] = false;
	fishMind[8] = false;
	fishMind[9] = false;
	fishMind[10] = false;
	fishMind[11] = false;
	fishMind[12] = false;
	fishMind[13] = false;
	fishMind[14] = false;
	fishMind[15] = false;
	fishMind[16] = false;
	fishMind[17] = false;
	fishMind[18] = true;
	fishMind[19] = false;
	fishMind[20] = false;
	fishMind[21] = false;
	fishMind[22] = false;
	fishMind[23] = false;
	fishMind[24] = false;
	fishMind[25] = false;
	fishMind[26] = false;
	fishMind[27] = false;
	fishMind[28] = false;
	fishMind[29] = false;
	
	int idx = int(random(0,29));
	return fishMind[idx];
}


void moveFish(){
	//--does the fish change its mind?--//
	//--gets random boolean to see if fish changes directions--//
	
	boolean changeMind = randomFishMove();
	if (changeMind){
		if (fRight == true){
			fRight = !fRight;
			fish = loadImage("img/fish.png");
			fishMouthOffset = 71;
		} else {
			fRight = !fRight;
			fish = loadImage("img/fishFlip.png");
			fishMouthOffset = 0;
		}
	}
	
	changeMind = randomFishMove();
	if (changeMind){
		fUp = !fUp;
	}
//---- moving horizontally-----//
	if ( fRight ){
		fishCoos[0] = fishCoos[0] - 2;
		if ( fishCoos[0] <= 0 ){
			fRight = false;
			fish = loadImage("img/fish.png");
			fishMouthOffset = 71;
		}
	} else { 
		fishCoos[0] = fishCoos[0] + 2;
		if ( fishCoos[0] >= 525 ){
			fRight = true;
			fish = loadImage("img/fishFlip.png");
			fishMouthOffset= 0;
		}
	}
//---- moving vertically-----//
	if ( fUp ){
		fishCoos[1] = fishCoos[1] + 2;
		if ( fishCoos[1] >= 550 ){
			fUp = false;
		}
	} else { 
		fishCoos[1] = fishCoos[1] -2;
		if ( fishCoos[1] <= 450 ){
			fUp = true;
		}
	}
}

void checkCatch(){
//-- checks the position of the hook against the position of the fish's mouth--//
	int hookX = (lineX);
	int hookY = (lineY + 27 + lineHeight);
	int fishMouthX = fishCoos[0] + fishMouthOffset;
	int fishMouthY = ( fishCoos[1] + 17 );
	
	if ( hookX < fishMouthX + 10  && hookX > fishMouthX - 10 ) {
		if (hookY < fishMouthY + 10  && hookY > fishMouthY - 10  ){
			fish = loadImage("img/deadFish.png");
			fishNotCaught = false ;
		}	
	}
}


void reelFish(){
//--if the fish has been caught, the fish's position is determined by hook position--//
//--once fish reaches th
	fishCoos[0] = lineX - 15;
	fishCoos[1] = (lineY + 27 + lineHeight);
	image(fish, fishCoos[0], fishCoos[1]) ;
	if (lineHeight === 0){
		fishAlive = false;
	}

}

void mousePressed(){
	
	//--clicking on the boat, raises or lowers the line--//
	if ( bcoos[0] < mouseX && (bcoos[0]+200) > mouseX  && bcoos[1] < mouseY && (bcoos[1] + 200) > mouseY) {
		lineDown = !lineDown;
		
	//--clicking on the fish ghost when the fish is caught, reanimates the fish --//
	} else if ( 215 < mouseX && mouseX < 365 && 40 < mouseY && mouseY < 128 && !fishAlive){
		fishAlive = true;
		fishNotCaught = true;
		fishCoos[0] = 200;
		fishCoos[1] = 500;
		fUp = false;
		fRight = true;
		fish = loadImage("img/fishFlip.png");
	}
}
	
void draw(){
	drawBackground();
	makeWaves();
	drawFish();
	moveLine();
	drawLine();
	checkCatch();
}

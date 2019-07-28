ArrayList<Bird> birds=new ArrayList<Bird>();
ArrayList<Bird> removed=new ArrayList<Bird>();
int species=1;
Stick s;
PImage bg;
int speed=5;
int startingy=300;
ArrayList<Stick> sticks=new ArrayList<Stick>();
int spos=400,spacing=400;
int genCount=0;
void setup(){
	frameRate(60);
	bg=loadImage("bg2.png");
	background(bg);
	size(600, 600);
	nextGen();
	//stick (x,40==>560,50==>100)
	for(int i=0;i<8;i++){
		s=new Stick(spos,400,100);
		int m=(int)random(40,500),n=(int)random(min(abs(m-80),abs(m-400)),max(abs(m-80),abs(m-400)));
		sticks.add(new Stick(spos,m,150));
		spos+=spacing;
	}
}
void draw(){
	background(bg);
	show();
	update();
}
void keyPressed(){
	for(int i=0;i<birds.size();i++)
		birds.get(i).flap();
}
void show(){
	showBirds();
	showSticks();
}
void update(){
	updateBirds();
	updateSticks();
}
//birds
void showBirds(){
	for(int i=0;i<birds.size();i++)
		birds.get(i).show();
}
void updateBirds(){
	for(int i=0;i<birds.size();i++){
		birds.get(i).update();
	}
}
//sticks
void showSticks(){
	for(int i=0;i<sticks.size();i++){
		sticks.get(i).show();
	}
}
void updateSticks(){
	for(int i=0;i<sticks.size();i++){
		sticks.get(i).update(speed);
		for(int j=0;j<birds.size();j++)
			sticks.get(i).colide(birds.get(j));
	}
	if(sticks.get(0).x+sticks.get(0).w<0){
		s=sticks.remove(0);
		s.x=sticks.get(sticks.size()-1).x+spacing;
		int m=(int)random(40,500);
		sticks.add(new Stick(s.x,m,150));
		for(int j=0;j<birds.size();j++)
			birds.get(j).score++;
	}
}
//generationss
void nextGen(){
	birds=new ArrayList<Bird>();
	for(int i=0;i<species;i++){
		birds.add(new Bird(50,startingy));//startingy+=5;
	}
}

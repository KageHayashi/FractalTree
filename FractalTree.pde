private double fractionLength = .89; 
private int smallestBranch = 5; 
private double branchAngle = PI/8;  

public void setup() {   
	size(1080,720);    
	noLoop(); 
} 
public void draw() {   
	background(0);   
	stroke(0,255,0);   
	//line(width/2,height/2,width/2,380);   
	drawBranches(width/2,height/2,100,3*Math.PI/2);
} 

public void drawBranches(int x,int y, double branchLength, double angle) {   
  double angle1, angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength/1.1, angle1);
    drawBranches(endX2, endY2, branchLength/1.1, angle2);
  }
} 

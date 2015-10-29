public class Radar {
  
  public void drawRadar(int distance, float pxDistance, int degree) {
    radar.drawCanvas(); 
    radar.drawLine(degree);
    radar.drawObject(distance, pxDistance, degree);
    radar.drawText(distance, degree);
  }
  
  private void drawCanvas() {
    pushMatrix();
    
    translate(400,400); // line's center of rotation
    noFill();
    strokeWeight(1);
    stroke(98,245,31);
    
    // draws the arc lines
    arc(0,0,700,700,PI,TWO_PI);
    arc(0,0,600,600,PI,TWO_PI);
    arc(0,0,500,500,PI,TWO_PI);
    arc(0,0,400,400,PI,TWO_PI);
    arc(0,0,300,300,PI,TWO_PI);
    arc(0,0,200,200,PI,TWO_PI);
    arc(0,0,100,100,PI,TWO_PI);
    
    // draws the degree lines
    line(-400,0,400,0);
    line(0,0,-400*cos(radians(30)),-400*sin(radians(30)));
    line(0,0,-400*cos(radians(60)),-400*sin(radians(60)));
    line(0,0,-400*cos(radians(90)),-400*sin(radians(90)));
    line(0,0,-400*cos(radians(120)),-400*sin(radians(120)));
    line(0,0,-400*cos(radians(150)),-400*sin(radians(150)));
    line(-400*cos(radians(30)),0,400,0);
    
    popMatrix();
  }
  
  private void drawLine(int degree) {
    pushMatrix();
    
    translate(400,400); // line's center of rotation
    strokeWeight(9);
    // Green
    stroke(30,250,60);
    
    // draws the line according to the degree
    line(0,0,950*cos(radians(degree)),-950*sin(radians(degree)));
    
    popMatrix();
  }

  private void drawObject(int distance, float pxDistance, int degree) {
    pushMatrix();
    
    translate(400,400); // line's center of rotation
    strokeWeight(9);
    // Red
    stroke(255,10,10);
    
    // draws the object according to the degree and the distance
    if (distance < 70) line(pxDistance*cos(radians(degree)),-pxDistance*sin(radians(degree)),950*cos(radians(degree)),-950*sin(radians(degree)));
    
    popMatrix();
  }
  
  private void drawText(int distance, int degree) {
    pushMatrix();

    fill(0,0,0);
    noStroke();
    rect(0, 720, width, 576);
    
    fill(98,245,31);
    textSize(15);
    text("10",440,420);
    text("20",495,420);
    text("30",545,420);
    text("40",595,420);
    text("50",645,420);
    text("60",695,420);
    text("70",745,420);
    
    textSize(20);
    String label;
    if(distance > 70) label = "Out of Range";
    else label = "In Range";
    text("Object: " + label, 50, 450);
    text("Degree: " + degree +" °", 450, 450);
    text("Distance: ", 600, 450);
    if(distance < 70) text("        " + distance +" cm", 650, 450);
    textSize(15);
    text("Acoustic Radar", 50, 480);
    
    textSize(15);
    fill(98,245,60);
    translate(961+960*cos(radians(30)),982-960*sin(radians(30)));
    rotate(-radians(-60));
    text("30°",0,0);
    resetMatrix();
    translate(954+960*cos(radians(60)),984-960*sin(radians(60)));
    rotate(-radians(-30));
    text("60°",0,0);
    resetMatrix();
    translate(400+400*cos(radians(90)),500-400*sin(radians(90)));
    rotate(radians(0));
    text("90°",0,0);
    resetMatrix();
    translate(935+960*cos(radians(120)),1003-960*sin(radians(120)));
    rotate(radians(-30));
    text("120°",0,0);
    resetMatrix();
    translate(940+960*cos(radians(150)),1018-960*sin(radians(150)));
    rotate(radians(-60));
    text("150°",0,0);
    
    popMatrix(); 
  }
  
}
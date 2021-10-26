void Game(){
  background(black);
 
  stroke(brown);
  strokeWeight(4);
  line(0,0,width, height);
  line(width,0,0,height);
  rectMode(CENTER);
  noStroke();
  fill(brown);
  rect(width/2, height/2, width-100, height-100);
  
   for (int i=0; i<object.size(); i++) {
    GameObject GB = object.get(i);
    GB.show();
    GB.act();
  }
}

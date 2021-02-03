int fullLength = 0;
int maxLength = 1400;
int cChange = 255;
boolean complete = false;

public void setup()
{
  background(10);
  size(700, 700);
  smooth();
  frameRate(60);
  colorMode(HSB);
  x = 350;
  y = 350;
}
public void draw()
{
  cChange++;
  if (cChange > 255) {
    cChange = 0;
  }

  if (!complete) { //CREATE TUNNEL
    fill(color(cChange, 255, 255));
    stroke(0);
    sierpinski(0, 700, fullLength); 
    fullLength+=2;
    if (fullLength > 1400) {
      complete = true;
    }
  } else { //CLEAR TUNNEL
    fill(10);
    stroke(10);
    sierpinski(0, 700, fullLength); 
    fullLength-=4;
    if (fullLength < 0) {
      background(10);
      complete = false;
    }
  }
}
public void sierpinski(float x, float y, int len) 
{
  if (len <= 20) {
    triangle(x, y, x+len/2, y-len, x+len, y);
  } else {
    sierpinski(x, y, len/2); 
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y-len/2, len/2);
  }
}

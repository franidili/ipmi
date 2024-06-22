//TP2
//COMISION 2
//FRANCISCO IDILI,119056/0


float ancho, alto; 
int cant = 12;
int medio;
boolean negro;
PImage ilusion;
color color1,color2;
color bg;

void setup() {
  size(800, 400);
   alto = height/cant;
  medio = 245;
color1 = 0;
color2 = 255;
ilusion = loadImage("ilusion.png");

}

void draw() {
  background(255);
  image(ilusion, 0, 0);
  pushMatrix();
   fill(interactive(0, 255));
  translate(400,0);
    negro = true;

  for (int i=0; i<width; i+=ancho) { 
    for (int j=0; j<height; j+= alto) {
    ajustarAncho(i, j);

      if (negro) {
        fill(interactive(0, 255));
      } else {
        fill(color1);
      }
      rect(i, j, ancho, alto);
      negro = !negro;
    }

  }
  popMatrix();
}

void mousePressed() {
  color tempColor;
  tempColor = color1;
  color1 = color2 ;
  color2 = tempColor;
}

void keyPressed() {
  if ( key ==  'r' ){
   resetearVariables() ;
  }
}
  
void resetearVariables(){
 bg = color( 0 );
 color1=0;
  color2=255;
}



color interactive(float min, float max) {
colorMode(HSB);
float hue = map(mouseX, min, max, 0, 40);
return color( hue, 130, 200 );
}

void ajustarAncho(float i, float j) {
  float distan = dist(i, j, medio, j);
  ancho = map(distan, medio, 0, alto, 2);
}

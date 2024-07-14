//Francisco Idilli
//tp2 (recuperatorio)
//Comision Matias

PImage imagen1;
PImage imagen2;
PImage imagen3;

PFont tipografia;
PFont tipografia2;

int contador;

String titulo;
String texto;
String introduccion;
String pantalla2;

float posX = -100; 
float velocidad = 1;
float opacidad = 0;
float posY2 = 500;


int botonX = 270;
int botonY = 420;
int botonAncho = 100;
int botonAlto = 40;

void setup() {
  size(640, 480);
  
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  
  tipografia = loadFont("tipografia.vlw");
  tipografia2 = loadFont("tipografia2.vlw");
  
  contador = 0;
  titulo = "POOL";
  texto = "El pool es un juego de brillar, se juega en una mesa\ncon seis agujeros, se usan 15 bolas numeradas y una bola blanca";
  introduccion = "Se utiliza un palo llamado taco con el que le tienes\nque pegar a la bola blanca y empujar las demás bolas";
  pantalla2 = "para ganar deberas embocar primero todas \n las bolas lisa o rayadas depende q te toque,y luego embocar la negra";

  noStroke();
  background(255); 
}

void draw() {
  contador++;
  
  if (contador <= 400) {
    image(imagen1, 0, 0, width, height);
    fill(220, 76, 29, opacidad);
    textFont(tipografia);
    textSize(80);
    textAlign(CENTER);
    text(titulo, width/2, 100);
    
    fill(0);
    textAlign(LEFT);
    textSize(20);
    text(texto, 50, 300);
    
    opacidad += 1;
    posX = -500;
  } else if (contador > 400 && contador <= 1000) {
    image(imagen2, 0, 0, width, height);
    textFont(tipografia2);
    textSize(20);
    text(introduccion, posX, 200, 640, 500);
    
    
    if (posX <= 90) {
      posX += 3;
    }
  } else if (contador > 1000) {
    image(imagen3, 0, 0, width, height);
    fill(255);
    textSize(15);
    text(pantalla2, 250, posY2 );
    posY2--;
    

    fill(0, 102, 153);
    rect(botonX, botonY, botonAncho, botonAlto, 7);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Reiniciar", botonX + botonAncho / 2, botonY + botonAlto / 2);
  }
}

void mousePressed() {
  if (contador > 1000 && mouseX >= botonX && mouseX <= botonX + botonAncho && mouseY >= botonY && mouseY <= botonY + botonAlto) {
    contador = 0;
    opacidad = 0;
    posX = -100;
    posY2 = 500;
  }
}

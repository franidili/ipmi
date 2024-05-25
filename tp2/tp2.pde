//TP2
//COMISION 2
//FRANCISCO IDILI,119056/0




PImage img1, img2, img3;
String[] textos1 = {
  "El pool es un juego \n de brillar,  se juega en una mesa \n con seis agujeros,se usan 15 bolas numeradas y una bola blanca",
  
};
String[] textos2 = {
  "Se utiliza un palo llamado taco  con el que le tenes \n que pegar a la bola blanca y emujar las demas bolas  ",
  
};
String[] textos3 = {
  "para ganar deberas embocar primero todas \n las bolas lisa o rayadas depende q te toque,y luego embocar la negra",
  
};

int slideIndex = 0;
int yPos1 = 600, yPos3 = 600;
int xPos2 = 640; 
boolean textReachedEnd = false;
boolean showButton = false;

void setup() {
  size(640, 480);
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
}

void draw() {
  background(255);
  if (slideIndex == 0) {
    drawSlide1();
  } else if (slideIndex == 1) {
    drawSlide2();
  } else if (slideIndex == 2) {
    drawSlide3();
  }
  if (textReachedEnd) {
    if (slideIndex == 2) {
      showButton = true;
      drawButton();
    } else {
      slideIndex = (slideIndex + 1) % 3;
      resetPositions();
      textReachedEnd = false;
    }
  }
}

void drawSlide1() {
  image(img1, 0, 0, width, height);
  fill(0);
  textSize(38);
  text("POOL O BOLA 8", 50, 30);
  textSize(18);
  for (int i = 0; i < textos1.length; i++) {
    text(textos1[i], 50, yPos1 + i * 100);
  }
  if (yPos1 > 150) {
    yPos1 -= 2;
  } else {
    textReachedEnd = true;
  }
}

void drawSlide2() {
  image(img2, 0, 0, width, height);
  fill(255);
  textSize(30);
  text("TACO", 50, 30);
  textSize(18);
  for (int i = 0; i < textos2.length; i++) {
    text(textos2[i], xPos2, 150 + i * 100);
  }
  if (xPos2 > 5) {
    xPos2 -= 2;
  } else {
    textReachedEnd = true;
  }
}

void drawSlide3() {
  image(img3, 0, 0, width, height);
  fill(0);
  textSize(24);
  text("PARA GANAR", 50, 30);
  textSize(18);
  for (int i = 0; i < textos3.length; i++) {
    text(textos3[i], 50, yPos3 + i * 100);
  }
  if (yPos3 > 150) {
    yPos3 -= 2;
  } else {
    textReachedEnd = true;
  }
}

void drawButton() {
  fill(200);
  rect(270, 420, 100, 40);
  fill(0);
  textSize(20);
  text("Reiniciar", 290, 450);
}

void mousePressed() {
  if (showButton && mouseX >= 270 && mouseX <= 370 && mouseY >= 420 && mouseY <= 460) {
    resetPositions();
    slideIndex = 0;
    textReachedEnd = false;
    showButton = false;
  }
}

void resetPositions() {
  yPos1 = 600;
  xPos2 = 640;
  yPos3 = 600;
}

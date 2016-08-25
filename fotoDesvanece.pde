// importar libreria para usar camara
import processing.video.*;

// declaracion de variables
boolean tomaFoto;
int lapso, crono;
Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();  

  background(255);
  lapso = 700; // cada tantos milisegundos toma foto
  crono = 0;
}

void draw() {
  // va borrando las imagenes
  fill(255,2);
  rect(0,0,width,height);
  
  // y pone una nueva
  fill(255);
  if (video.available() && tomaFoto) {
    video.read();
    tint(255,80);
    image(video, 0,0);
    tomaFoto = false;
  }
  
  // reinicia el cronometro
  if (millis() - crono > lapso){
    tomaFoto = true;
    crono = millis();
  }
}  
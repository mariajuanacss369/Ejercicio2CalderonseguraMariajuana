int tileSize = 200; // Tamaño de cuadrados 
int cols, rows;
color[] warmColors = {#D942B3, #FF8944, #DF415E}; // Colores de cuadrados

void setup() {
  size(600, 600);
  cols = width / tileSize;
  rows = height / tileSize;
  noLoop(); 
}

void draw() {
  background(#C83737);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * tileSize;
      float y = j * tileSize;
      drawCubeTile(x, y, tileSize, i, j);
    }
  }
}

void drawCubeTile(float x, float y, float size, int col, int row) {
  float halfSize = size / 2;
  float quarterSize = size / 4;

  // Colores basados en la posición para crear consistencia
  color colorTop = warmColors[(col + row) % warmColors.length];
  color colorLeft = warmColors[(col + row + 1) % warmColors.length];
  color colorRight = warmColors[(col + row + 2) % warmColors.length];

  noStroke();

  // Dibujar el rombo superior
  fill(colorTop);
  beginShape();
  vertex(x + halfSize, y);
  vertex(x + size, y + quarterSize);
  vertex(x + halfSize, y + halfSize);
  vertex(x, y + quarterSize);
  endShape(CLOSE);

  // Dibujar el rombo izquierdo
  fill(colorLeft);
  beginShape();
  vertex(x, y + quarterSize);
  vertex(x + halfSize, y + halfSize);
  vertex(x + halfSize, y + size);
  vertex(x, y + 3 * quarterSize);
  endShape(CLOSE);

  // Dibujar el rombo derecho
  fill(colorRight);
  beginShape();
  vertex(x + halfSize, y + halfSize);
  vertex(x + size, y + quarterSize);
  vertex(x + size, y + 3 * quarterSize);
  vertex(x + halfSize, y + size);
  endShape(CLOSE);
}

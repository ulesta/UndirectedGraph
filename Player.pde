class Player {
  
  // Fields
  float x, y;
  float distX, distY;
  float endX, endY;
  int r;
  float angle;
  float speed;
  int scalar;
  // Percentage
  float pct;
  float step;
  
  // Constructor
  Player() {
    r = 15;
    angle = 0;
    speed = 0.05;
    scalar = 28;
    pct = 0.0;
    step = 0.01;
  }
  
  void orbit(Node n) {
    noStroke();
    fill(0);
    x = n.x + sin(angle) * scalar;
    y = n.y + cos(angle) * scalar;
    ellipse(x, y, r, r);
    angle = angle + speed;
  }
  
  // Travel method calculates the distance between current node and the clicked node
  void travel(Node n1, Node n2) {
    distX = n2.x - n1.x;
    distY = n2.y - n1.y;
    pct += step;
    if (pct < 1.0) {
      x = n1.x + (pct * distX);
      y = n1.y + (pct * distY);
    }
  }
}


class Node {

  // Fields
  int x, y; 
  int xInit, yInit;
  int r;
  float scaleOffset;
  ArrayList rels;
  boolean active;

  // Constructor
  Node(int xTemp, int yTemp, int rTemp) {
    this.x = xTemp;
    this.y = yTemp;
    this.xInit = this.x;
    this.yInit = this.y;
    this.r = rTemp;
    this.scaleOffset = random(750);
    this.rels = new ArrayList();
    this.active = false;
  }

  // Draw method
  void draw() {
    float m = millis() + scaleOffset;
    
    /*int dx = (int)(this.xInit+(((sin(m/1000)*200))/2));
    int dy = (int)(this.yInit+(((sin(m/1000)*200))/2));
    
    setX(dx);
    setY(dy);*/
   
    // draw node
    if (active) {
      fill(0,255,0);
    } else {
      fill(255);
    }
    //ellipse(x, y, r*(((sin(m/500)*0.5)+1.5)/2), r*(((sin(m/500)*0.5)+1.5)/2));
    ellipse(x, y, r, r);
    
     // draw lines between relationships
    for (int i = 0; i < rels.size(); i++) {
      stroke(255);
      Node temp = (Node)(rels.get(i));
      line(x, y, temp.getX(), temp.getY());
    }
  }

  // -------  GETTERS
  public int getX() {
    return this.x;
  }

  public int getY() {
    return this.y;
  }
  // get radius, if needed
  public int getR() {
    return this.r;
  }

  // -------  SETTERS

  // Method to set node relationships
  public void setRels(Node[] nodes) {
    for (int i = 0; i < nodes.length; i++) {
      rels.add(nodes[i]);
    }
  }

  public void setX(int x) {
    this.x = x;
  }

  public void setY(int y) {
    this.y = y;
  }
  // get radius, if needed
  public void setR(int r) {
    this.r = r;
  }
  
  public void activate() {
    this.active = true; 
  }
  
  public void deactivate() {
    this.active = false; 
  }
}


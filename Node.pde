class Node {

  // Fields
  int x, y; 
  int xInit, yInit;
  int r;
  float scaleOffset;
  ArrayList rels;
  boolean active;
  boolean current;
  String name;

  // Constructor
  public Node(int xTemp, int yTemp, int rTemp, String name) {
    this.name = name;
    this.x = xTemp;
    this.y = yTemp;
    this.xInit = this.x;
    this.yInit = this.y;
    this.r = rTemp;
    this.scaleOffset = random(750);
    this.rels = new ArrayList();
    this.active = false;
    this.current = false;
  }

  // Draw method -- takes care of drawing the nodes
  void draw() {
    float m = millis() + scaleOffset;
    int dx = (int)(this.xInit+(((sin(m/2000)*200))/2));
    int dy = (int)(this.yInit+(((sin(m/2000)*200))/2));
    //setX(dx);
    //setY(dy);

    // draw node
    if (current) {
      stroke(0, 223, 179);
      strokeWeight(8);
      fill(0);
     /*for(int i = 0; i < rels.size(); i++) {
        Node temp = (Node)(rels.get(i));
        temp.activate();  
      }*/
    } else if (active) {
      noStroke();
      fill(0, 223, 179);
    } else {
      strokeWeight(1);
      fill(255);
      stroke(88,88,88);
    }
//    ellipse(x, y, r*(((sin(m/500)*0.5)+1.5)/2), r*(((sin(m/500)*0.5)+1.5)/2));
    ellipse(x, y, r, r);
    fill(0);
    text(this.name, x-7, y+3);
  }
  
  // drawRelations method -- takes care of drawing relationships
  void drawRelations() {
    for (int i = 0; i < rels.size(); i++) {
      stroke(88,88,88);
      strokeWeight(1);
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
  
  public boolean isCurrent() {
     return this.current; 
  }
  
  public boolean isActive() {
     return this.active; 
  }
  
  public ArrayList getRels() {
    return this.rels; 
  }
  
  public String toString() {
     String a = "Node: " + this.name + " { ";
     for (int i = 0; i < this.rels.size(); i++ ) {
        Node temp = (Node)(this.rels.get(i));
        a += temp.name + " ";
     } 
     a += "}";
     return a;
  }
  
  public String getName() {
    return this.name;
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
  
  public void setCurrent(boolean b) {
     this.current = b; 
  }
  
  public void addRel(Node n) {
     this.rels.add(n); 
  }
}


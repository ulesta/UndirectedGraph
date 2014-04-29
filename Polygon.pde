class Polygon {
  Node[] nodes;
  boolean isVisible;
  // Constructor
  public Polygon(Node[] nodes) {
    this.nodes = nodes;
  }
  
  public void draw() {
    if (isVisible) {
     fill(102);
     beginShape();
     for(int i = 0; i < nodes.length; i++ ){
         vertex(nodes[i].getX(),nodes[i].getY());
     }
     endShape();
    }
  }
  
  // GETTERS
  
  public Node[] getNodes() {
     return this.nodes; 
  }
  
  // SETTERS
  
  public void setVisible(boolean b) {
     this.isVisible = b;
  }
 
}

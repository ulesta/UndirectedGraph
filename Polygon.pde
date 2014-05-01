class Polygon {
  Node[] nodes;
<<<<<<< HEAD
  boolean isVisible;
  PImage srcImg, finalImg;
  PGraphics mask;
  int midX;
  int midY;

  // Constructor
  // Why is this public while the node constructor isn't?
  // [justin]: you are absolutely correct! Good call on code conventions! ;)
  public Polygon(Node[] nodes, PImage srcImg) {
    this.nodes = nodes;
    this.srcImg = srcImg;
    calcPolygonMid();
    println("Mid point of polygon: " + this.midX + ", " + this.midY);
    createMask();
=======
  PImage image;
  boolean isVisible;
  PGraphics msk;
  
  // Constructor
  // Why is this public while the node constructor isn't?
  public Polygon(Node[] nodes, PImage imageTemp) {
    this.nodes = nodes;
    this.image = imageTemp;
    msk();
    image.blend(msk,0,0,image.width,image.height,0,0,image.width,image.height,ADD);
>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
  }


  public void draw() {
    if (isVisible) {
<<<<<<< HEAD
      image(finalImg, 0, 0);
    }
=======
//     fill(102);
     image(image,0,0);
//     beginShape();
//     for(int i = 0; i < nodes.length; i++ ){
       // this draws the masked image but not at where I want them to be
//         image(image,nodes[i].getX(),nodes[i].getY());
//     }
//     endShape();
    }
    // this image is placed at 0,0, and can only be masked once
   
>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
  }

  public void calcPolygonMid() {
    // Sort algo to calculate midpoint of polgyon
    int lbX = nodes[0].getX();
    int lbY = nodes[0].getY();
    for (int i = 1; i < nodes.length; i++) {
      lbX = ( nodes[i].getX() < lbX ) ? nodes[i].getX() : lbX;
      lbY = ( nodes[i].getY() < lbY ) ? nodes[i].getY() : lbY;
    }
    int ubX = nodes[0].getX();
    int ubY = nodes[0].getY();
    for (int i = 1; i < nodes.length; i++) {
      ubX = ( nodes[i].getX() > ubX ) ? nodes[i].getX() : ubX;
      ubY = ( nodes[i].getY() > ubY ) ? nodes[i].getY() : ubY;
    }
    this.midX = (ubX + lbX)/2;
    this.midY = (ubY + lbY)/2;
  }

  public void createMask() {
    /* found a good forum post for turning images into shapes:
     http://forum.processing.org/one/topic/image-into-shapes.html */
    mask = createGraphics(width, height, P2D);
    mask.beginDraw();
    mask.background(0);
    mask.noStroke();
    mask.fill(255);
    mask.smooth();
    mask.beginShape();
    for (int i = 0; i < nodes.length; i++ ) {
      mask.vertex(this.nodes[i].getX(), this.nodes[i].getY());
    }
    mask.endShape();
    mask.endDraw();

    // make an empty white img which matches the dimensions of sketch
    finalImg = createImage(width, height, RGB);
    finalImg.loadPixels();
    for (int i = 0; i < finalImg.pixels.length; i++) {
      finalImg.pixels[i] = color(255, 255, 255);
    }
    finalImg.updatePixels();
    // copy our src img onto the new img we just created
    finalImg.copy(srcImg, 0, 0, srcImg.width, srcImg.height, midX - srcImg.width/2, midY - srcImg.height/2, srcImg.width, srcImg.height);

    // finally, apply the mask we created -- magic!
    finalImg.mask(mask.get());
  }

  // GETTERS

  public Node[] getNodes() {
    return this.nodes;
  }
<<<<<<< HEAD

  int getWidth() {
    return srcImg.width;
  }

=======
  
>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
  // SETTERS

  public void setVisible(boolean b) {
    this.isVisible = b;
  }
}


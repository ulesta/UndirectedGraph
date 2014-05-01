/**
 * UndirectedGraph
 * 
 * An undirected graph consists of nodes with an arbitrary number
 * of undirected relationships with other nodes.
 */

ArrayList nodes;
Node n1, n2, n3, n4, n5, n6, n7;

// relationships;
Node current;

Polygon[] polygons;

ArrayList path;

int currentScreen;
Player player;

<<<<<<< HEAD
// images
PImage imgForP1;

void setup() {
  size(1980, 1080, P2D);
=======
PImage mom, imgStart, duongFamily;

void setup() {
  size(1980, 1080);
>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
  background(255);
  // Instantiate our objects
  path = new ArrayList();
  nodes = new ArrayList();

  n1 = new Node(400, 200, 40, "n1");
  n2 = new Node(600, 300, 40, "n2");
  n3 = new Node(300, 400, 40, "n3");
<<<<<<< HEAD
  n4 = new Node(500, 600, 40, "n4");
  n5 = new Node(200, 600, 40, "n5");
  n6 = new Node(200, 250, 40, "n6");
  n7 = new Node(800, 400, 40, "n7");
  n8 = new Node(700, 500, 40, "n8");
  n9 = new Node(900, 500, 40, "n9");
  n10 = new Node(800, 600, 40, "n10");

  Polygon p1 = new Polygon(new Node[]{n1, n2, n3}, loadImage("dad0001.png"));
  Polygon p2 = new Polygon(new Node[]{n3, n5, n4, n2},  loadImage("1.jpg"));
  Polygon p3 = new Polygon(new Node[]{n6, n1, n3},  loadImage("2.jpg"));
  Polygon p4 = new Polygon(new Node[]{n8, n7, n9, n10},  loadImage("3.jpg"));
  
  
  polygons = new Polygon[]{p1, p2, p3, p4};
  
=======
  n4 = new Node((int)random(width), (int)random(height), 40, "n4");
  n5 = new Node((int)random(width), (int)random(height), 40, "n5");
  n6 = new Node((int)random(width), (int)random(height), 40, "n6");
  n7 = new Node((int)random(width), (int)random(height), 40, "n7");


  imgStart = loadImage("1975.png");
  duongFamily = loadImage("duong_family.png");
  mom = loadImage("mom.png");

  Polygon p1 = new Polygon(new Node[]{n1, n2, n3}, duongFamily);
  Polygon p2 = new Polygon(new Node[]{n4, n5, n6, n7}, mom); 

  polygons = new Polygon[] {p1, p2};

>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
  player = new Player();

  //println("Polygons length: " + polygons.length);

  // find relationships using polygon
  findRelsFromPoly();

  /*Node[] n1rels = {};
   Node[] n2rels = {n1};
   Node[] n3rels = {n2, n1};
   Node[] n4rels = {n2};
   Node[] n5rels = {n3, n4};
   
   n1.setRels(n1rels);
   n2.setRels(n2rels);
   n3.setRels(n3rels);
   n4.setRels(n4rels);
   n5.setRels(n5rels);*/

  // add forced relationship
  n3.addRel(n4);



  // init values for current node
  n1.setCurrent(true);
  current = n1;
  path.add(n1);

  // Populate our nodes set
  nodes.add(n1);
  nodes.add(n2);
  nodes.add(n3);
  nodes.add(n4);
  nodes.add(n5);
  nodes.add(n6);
  nodes.add(n7);

  // debug: println("N1 relationship size: " + n1.getRels().size());
  findAllRelationships();
  // debug: println("N1 relationship size: " + n1.getRels().size());
  // debug: println("n1 rels: " + n1.toString() );
}

void draw() {
  background(255);
  smooth();
  ArrayList currentRels = current.getRels();
  // activates current's related nodes
  for (int i = 0; i < currentRels.size(); i++) {
    Node relNode = (Node)(currentRels.get(i));
    relNode.activate();
  }
  // draw polygons
<<<<<<< HEAD
  
  for (int i = polygons.length - 1; i >= 0; i--) {
    polygons[i].draw(); 
=======
  for (Polygon p : polygons) {
s
>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
  }
  
  // draw relation lines
  for (int i = 0; i < nodes.size(); i++ ) {
    Node temp = (Node)(nodes.get(i));
    temp.drawRelations();
  } 
  // draw nodes
  for (int i = 0; i < nodes.size(); i++ ) {
    Node temp = (Node)(nodes.get(i));
    temp.draw();
  }
  player.orbit(current);

  // Cycle through different levels

  switch(currentScreen) {
  case 0: 
    level1(); 
    break;
  case 1: 
    level2(); 
    break;
  case 2: 
    level3(); 
    break;
  default: 
    background(0); 
    break;
  }

<<<<<<< HEAD
  if (allNodesVisited()) {
    currentScreen ++;
  }
  //println("all visited? " + allNodesVisited() + currentScreen );
=======
  //  if (allNodesVisited()) {
  //    currentScreen ++;
  //  }

  println("all visited? " + allNodesVisited() + currentScreen );
>>>>>>> 64ca565e80b25210777a1b8d6bedf3a7636be627
}

void mouseReleased() {
  int mX = mouseX;
  int mY = mouseY;
  for (int i=0; i < nodes.size(); i++) {
    Node temp = (Node)(nodes.get(i)); 
    int r = temp.getR();
    int lowerBoundX = temp.getX() - (r/2);
    int upperBoundX = temp.getX() + (r/2);
    int lowerBoundY = temp.getY() - (r/2);
    int upperBoundY = temp.getY() + (r/2);

    if (mX > lowerBoundX &&
      mX < upperBoundX &&
      mY > lowerBoundY &&
      mY < upperBoundY &&
      temp.isActive()) {
      //println("touched!");
      // find the current node and switch current to the one touched
      for (int j=0; j < nodes.size(); j++) {
        Node temp2 = (Node)(nodes.get(j)); 
        if (temp2.isCurrent()) {

          // Switch current
          temp.setCurrent(true);
          deactivateAll();
          // deactivate all nodes so that draw() method can reactivate only related nodes
          temp2.setCurrent(false);
          current = temp;
          // add new current to path if haven't yet visited
          if (!path.contains(temp)) {
            path.add(temp);
          }

          // Check each Polygon if its nodes have been visited in our path
          // if so, set them to be visible
          for (Polygon p : polygons) {
            Node[] polyNodes = p.getNodes();
            boolean isVisible = true;
            for (int v = 0; v < polyNodes.length; v++) {
              if (!path.contains(polyNodes[v])) {
                isVisible = false;
                break;
              }
              println("path contains: " + polyNodes[v].getName() + "?" + " " + isVisible);
            }
            p.setVisible(isVisible);
          }
          break;
        }
      }
    }
  }
}

void deactivateAll() {
  for (int i = 0; i < nodes.size(); i++ ) {
    Node temp = (Node)(nodes.get(i));
    temp.deactivate();
  }
}

/* in most cases, our nodes are connected on a one-way edge, this methods finds all one-way edges and makes them undirected.
 i.e. a -> b, this method will make it such that a <-> b */
void findAllRelationships() {
  for (int i = 0; i < nodes.size(); i++) {
    Node target = (Node)(nodes.get(i));
    println("target node: " + target.getName());
    for (int j = 0; j < nodes.size(); j++) {
      if (j == i) {
        // do nothing
      } 
      else {
        Node candidate = (Node)(nodes.get(j));
        ArrayList candidateRels = candidate.getRels();
        println("Node " + candidate.getName() + " is in relationship with {" );
        for (int k=0; k < candidateRels.size(); k++) {

          Node relNode = (Node)(candidateRels.get(k));
          println(relNode.getName());
          if (relNode.getName().equals(target.getName()) && !target.getRels().contains(candidate)) {
            target.addRel(candidate);
          }
        }
      }
    }
  }
}

public void getRelName(Node n) {
  for (int i = 0; i < n.getRels().size(); i++) {
    Node temp = (Node) (n.getRels().get(i));
    System.out.println("Rel with: " + temp.getName());
  }
}

/* this method finds all closed relationships of a given polygon
 it connects n to n-1 and the nth elem to the 0th elem of a polygon */
public void findRelsFromPoly() {
  for (Polygon p: polygons) {
    Node[] polyNodes = p.getNodes();
    for (int i = 1; i < polyNodes.length; i++) {
      polyNodes[i].addRel(polyNodes[i - 1]); 
      // add the very first node to the relationship of the last node
      if ( i == polyNodes.length - 1 ) {
        polyNodes[i].addRel(polyNodes[0]);
      }
    }
  }
}

public boolean allNodesVisited() {
  boolean allVisited = true;
  for (int i = 0; i < nodes.size(); i++ ) {
    Node temp = (Node) (nodes.get(i));
    if (!path.contains(temp)) {
      allVisited = false;
      break;
    }
  }
  return allVisited;
}

void level1() {
  //    ellipse(100,100,100,100);
}

void level2() {
  ellipse(100, 100, 100, 100);
  background(255);
}

void level3() {
  background(255);
  ellipse(100, 100, 100, 100);
}    


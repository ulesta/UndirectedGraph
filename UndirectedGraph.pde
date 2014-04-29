/**
 * UndirectedGraph
 * 
 * An undirected graph consists of nodes with an arbitrary number
 * of undirected relationships with other nodes.
 */
static int MAX_RELS = 2;
ArrayList nodes;
Node n1, n2, n3, n4, n5;
// relationships;
Node current;

Polygon p1, p2;
Polygon[] polygons;

ArrayList path;

void setup() {
  size(800, 800);
  background(0);

  path = new ArrayList();

  nodes = new ArrayList();

  n1 = new Node(400, 200, 100, "n1");
  n2 = new Node(600, 300, 100, "n2");
  n3 = new Node(300, 400, 100, "n3");
  n4 = new Node(500, 600, 100, "n4");
  n5 = new Node(200, 600, 100, "n5");

  Node[] p1NodeArr = {n1, n2, n3};
  p1 = new Polygon(p1NodeArr);
  
  Node[] p2NodeArr = {n3, n5, n4, n2};
  p2 = new Polygon(p2NodeArr);
  
  polygons = new Polygon[]{p1,p2};
  println("Polygons length: " + polygons.length);

  Node[] n1rels = {};
  Node[] n2rels = {n1};
  Node[] n3rels = {n2, n1};
  Node[] n4rels = {n2};
  Node[] n5rels = {n3, n4};

  n1.setRels(n1rels);
  n2.setRels(n2rels);
  n3.setRels(n3rels);
  n4.setRels(n4rels);
  n5.setRels(n5rels);

  // init values for current node
  n1.setCurrent(true);
  current = n1;
  path.add(n1);

  // Populat nodes
  nodes.add(n1);
  nodes.add(n2);
  nodes.add(n3);
  nodes.add(n4);
  nodes.add(n5);

  println("N1 relationship size: " + n1.getRels().size());

  findAllRelationships();

  println("N1 relationship size: " + n1.getRels().size());
  println("n1 rels: " + n1.toString() );
}

void draw() {
  background(0);
  ArrayList currentRels = current.getRels();
  // activates current's related nodes
  for (int i = 0; i < currentRels.size(); i++) {
    Node relNode = (Node)(currentRels.get(i));
    relNode.activate();
  }
  // draw polygons
  for (Polygon p : polygons) {
     p.draw(); 
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

  /*print("Path: ");
  for (int i = 0; i < path.size(); i++ ) {
    Node temp = (Node)(path.get(i));
    print(temp.getName() + " ");
  }
  print("\n");*/
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
                if (!path.contains(polyNodes[v])){
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


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
 

void setup() {
  size(800, 800);
  background(0);
  
  nodes = new ArrayList();
  
  n1 = new Node(400,200,100);
  n2 = new Node(600,300,100);
  n3 = new Node(300,400,100);
  n4 = new Node(500,600,100);
  n5 = new Node(200,600,100);
  
  Node[] n1rels = {n2, n3};
  Node[] n2rels = {n1, n3};
  Node[] n3rels = {n2, n1, n4};
  Node[] n4rels = {n2, n3};
  Node[] n5rels = {n5, n3};
  
  n1.setRels(n1rels);
  n2.setRels(n2rels);
  n3.setRels(n3rels);
  n4.setRels(n4rels);
  n5.setRels(n5rels);
  
  
  n1.setCurrent(true);
  
  nodes.add(n1);
  nodes.add(n2);
  nodes.add(n3);
  nodes.add(n4);
  nodes.add(n5);
}

void draw() {
  background(0);
  n1.draw();
  n2.draw();
  n3.draw();
  n4.draw();
  n5.draw();
}

void mouseReleased() {
    int mX = mouseX;
    int mY = mouseY;
    for(int i=0; i < nodes.size(); i++) {
       Node temp = (Node)(nodes.get(i)); 
       int r = temp.getR();
       int lowerBoundX = temp.getX() - (r/2);
       int upperBoundX = temp.getX() + (r/2);
       int lowerBoundY = temp.getY() - (r/2);
       int upperBoundY = temp.getY() + (r/2);
       println("Node" + i + "\tlBx" + lowerBoundX + "\tuBx" + upperBoundX + "\tlBy" + lowerBoundY
       + "\tuBy" + upperBoundY);
       if (mX > lowerBoundX &&
           mX < upperBoundX &&
           mY > lowerBoundY &&
           mY < upperBoundY &&
           temp.isActive()) {
           println("touched!");
           // find the current node and switch current to the one touched
           for(int j=0; j < nodes.size(); j++) {
             Node temp2 = (Node)(nodes.get(j)); 
             if (temp2.isCurrent()) {
                temp.setCurrent(true);
                deactivateAll();
                temp2.setCurrent(false);
                
                break; 
             }
           }
       }
       println("Mouse x: " + mouseX + "\tMouse y: " + mouseY);
    }
    
    println("size of nodes: " + nodes.size());
}

void deactivateAll() {
   for (int i = 0; i < nodes.size(); i++ ) {
     Node temp = (Node)(nodes.get(i));
     temp.deactivate();
   } 
}


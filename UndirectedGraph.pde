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

void setup() {
  size(800, 800);
  background(0);
  
  nodes = new ArrayList();
  
  n1 = new Node(400,200,100, "n1");
  n2 = new Node(600,300,100, "n2");
  n3 = new Node(300,400,100, "n3");
  n4 = new Node(500,600,100, "n4");
  n5 = new Node(200,600,100, "n5");
  
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
  
  n1.setCurrent(true);
  current = n1;
  
  nodes.add(n1);
  nodes.add(n2);
  
  println("picked node: " + ((Node)(nodes.get(0))).getName());
   println("picked node: " + ((Node)(nodes.get(1))).getName());
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
//     println("CurrentRels: " + currentRels.size());
  for (int i = 0; i < currentRels.size(); i++) {
     Node relNode = (Node)(currentRels.get(i));
     relNode.activate();
     relNode.draw();
  }
  for (int i = 0; i < nodes.size(); i++ ) {
     Node temp = (Node)(nodes.get(i));
     temp.drawRelations();
   } 
  for (int i = 0; i < nodes.size(); i++ ) {
     Node temp = (Node)(nodes.get(i));
     temp.draw();
   }
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
       /*println("Node" + i + "\tlBx" + lowerBoundX + "\tuBx" + upperBoundX + "\tlBy" + lowerBoundY
       + "\tuBy" + upperBoundY);*/
       if (mX > lowerBoundX &&
           mX < upperBoundX &&
           mY > lowerBoundY &&
           mY < upperBoundY &&
           temp.isActive()) {
           //println("touched!");
           // find the current node and switch current to the one touched
           for(int j=0; j < nodes.size(); j++) {
             Node temp2 = (Node)(nodes.get(j)); 
             if (temp2.isCurrent()) {
               
               // [Needs work]
                temp.setCurrent(true);
                deactivateAll();
                temp2.setCurrent(false);
                current = temp;
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
         } else {
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
    for(int i = 0; i < n.getRels().size(); i++) {
       Node temp = (Node) (n.getRels().get(i));
       System.out.println("Rel with: " + temp.getName()); 
    }
}


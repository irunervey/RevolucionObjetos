ArrayList<int[]> puntos;
Polygon figura;
boolean mostrandoFigura;

void setup(){
  size(700,700,P3D);
  puntos=new ArrayList<int[]>();
  figura=new Polygon(puntos);
  mostrandoFigura=false;
}

void draw(){
  background(0);
  pintarEje();
  pintarFigura();
}
void pintarFigura(){
  if(puntos.size()<3 && puntos.size()>0){
    stroke(150);
    strokeWeight(5);
    if(puntos.size()==1){
      ellipse(puntos.get(0)[0],puntos.get(0)[1],5,5);
    }else{
      line(puntos.get(0)[0],puntos.get(0)[1],puntos.get(1)[0],puntos.get(1)[1]);
    }
    
  }else{
    figura.display();
  }
}
void pintarEje(){
  stroke(210,0,0);
  strokeWeight(2);
  line(width/2,0,width/2,height);
  
}

void mousePressed(){
  if(mouseButton==LEFT && mouseX>width/2 && mostrandoFigura==false){
    anadirPunto();
  } else if(mouseButton==LEFT && mostrandoFigura==true){
    figura.mover(mouseX,mouseY);
  }
  if(mouseButton==RIGHT){
    crearFigura();
  }
}

void crearFigura(){
  figura.figura3D();
  mostrandoFigura=true;
}
void anadirPunto(){
  puntos.add(new int[]{mouseX,mouseY,0});
  figura=new Polygon(puntos);
}
void keyPressed(){
  if(key== ' '){
     puntos=new ArrayList<int[]>();
     figura=new Polygon(puntos);
     mostrandoFigura=true;
  }
}

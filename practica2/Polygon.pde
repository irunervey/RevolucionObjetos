import java.util.ListIterator;
class Polygon{  
  PShape figura;
  ArrayList<int []> puntos;
  Polygon(ArrayList<int []> dots){
    puntos=dots;
    figura=createShape();
    figura.beginShape();
    figura.fill(0);
    figura.stroke(150);
    figura.strokeWeight(5);
    for(int[] punto: puntos){
      figura.vertex(punto[0],punto[1],punto[2]);
    }
    figura.endShape();
  }
  
  void display(){
  shape(figura); 
  }
  void mover(int x,int y){
    figura.translate(x,y);
  }
  void figura3D(){
    for(int i =0; i<puntos.size();i++){
       puntos.get(i)[0]=puntos.get(i)[0]- width/2;
    }
    figura=createShape();
    figura.beginShape(QUAD_STRIP);
    //figura.noFill();
    ArrayList<int []> puntosRotados=new ArrayList<int []>();
    for (float angulo=0;angulo<TWO_PI;angulo+=TWO_PI/20){
      puntosRotados=rotar(angulo);
      imprimirPuntos(puntosRotados);
      puntos=puntosRotados;
    }
    figura.endShape();
    figura.translate(width/3,height/3,0);
  }
  
   ArrayList<int []> rotar(float angulo){
   ArrayList<int []> puntosRotado=new ArrayList<int []>();
    for(int[] punto: puntos){
      int x=(int)((punto[0])*cos(angulo)-punto[2]*sin(angulo));
      int y=punto[1];
      int z=(int)((punto[0])*sin(angulo)+punto[2]*cos(angulo));
      puntosRotado.add(new int[]{x,y,z});
    }
    return puntosRotado;
  }


  void imprimirPuntos(ArrayList<int[]> rotados){
    for(int i =0;i<rotados.size();i++){
       figura.vertex(puntos.get(i)[0],puntos.get(i)[1],puntos.get(i)[2]);
       figura.vertex(rotados.get(i)[0],rotados.get(i)[1],rotados.get(i)[2]);
    }
    
  }
}

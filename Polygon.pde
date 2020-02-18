import java.util.ListIterator;
class Polygon{  
  PShape figura;
  int[] center={width/2,height/2,0};
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
  
  void figura3D(){
    int angulo=0;
    figura=createShape();
    figura.beginShape();
    figura.noFill();
    ArrayList<int []> puntosRotados=new ArrayList<int []>();
    for (angulo,angulo<360,anuglo+=30){
      puntosRotados=puntosRotados(angulo);
      imprimirPuntos(puntosRotados);
      puntos=puntosRotados;
    }
    figura.endShape();
  }
  
   ArrayList<int []> puntosRotados(int angulo){
   ArrayList<int []> puntosRotado=new ArrayList<int []>();
    int[] anterior={-99,-99,-99};
    double r = Math.toRadians(angulo);
    for(int[] punto: puntos){
      int x=(int)((punto[0])*Math.cos(r)-punto[2]*Math.sin(r));
      int y=punto[1];
      int z=(int)((punto[0])*Math.sin(r)+punto[2]*Math.cos(r));
      puntosRotado.add(new int[]{x,y,z});
    }
    return puntosRotado;
  }


  void imprimirPuntos(ArrayList<int[]> rotados){
    ListIterator<int[]> punto= rotados.listIterator();
    if(punto.hasNext()){
      int[] actual=punto.next();
      figura.vertex(actual[0],actual[1],actual[2]);
    }
    while(punto.hasNext()){
      int[] anterior =puntos.get(0);
      figura.vertex(anterior[0],anterior[1],anterior[2]);
      int[] actual=punto.next();
      figura.vertex(actual[0],actual[1],actual[2]);
    }
  }
}

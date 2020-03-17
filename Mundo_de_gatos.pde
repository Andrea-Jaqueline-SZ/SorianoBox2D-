//ERRORES: GATITOS ROMPEN LA BARRERA. BARRERA NO AFECTA A ATRACCION. NO ESTA LIMKTADO EL PARAMETRO DE LA ATRACCION. GATO NO SE PUEDE MOVER.

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

PImage Gato;
PImage fondo;

piso pisos;
pantalla pantallas;
Attractor a;
gatitos[] gatitoss = new gatitos[25];

void setup()
{
  size(1500,900);
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-90);
  
  Gato = loadImage("Gato.png");
  fondo = loadImage("fondo.jpg");
  a = new Attractor (50, 50, 50, 50);
  pisos =new piso (750, 600, width,0.1 ,0);
  pantallas = new pantalla();
   for (int i = 0; i < gatitoss.length; i++) 
   {
    gatitoss[i] = new gatitos (random(4,4),random(width),random(height));
   }
  pisos.display();
  a.mover();
}


void draw()
{
 background(255); 
 
  box2d.step();
  for (int i = 0; i < gatitoss.length; i++) 
  {
    Vec2 force = a.attract(gatitoss[i]);
    gatitoss[i].applyForce(force);
    gatitoss[i].display();
  }
  a.display();
  pantallas.display();
  
  
}

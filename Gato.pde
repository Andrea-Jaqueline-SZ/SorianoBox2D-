class Attractor 
{

  float x;
  float y;
  float dx;
  float dy;
  float w;
  float h;
  float a;
  Body b;

 Attractor (  float x_, float y_,float w_, float h_) 
 {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    dx = x;
    dy = y;

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.angle = a;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    b.createFixture(sd,1);
  }


Vec2 attract(gatitos m) 
  {
    float G = 100; 
    Vec2 pos = b.getWorldCenter();    
    Vec2 moverPos = m.body.getWorldCenter();
    Vec2 force = pos.sub(moverPos);
    float distance = force.length();
    distance = constrain(distance,5,25);
    force.normalize();
    float strength = (G * 1 * m.body.m_mass) / (distance * distance); 
    force.mulLocal(strength);       
    return force;
  }
  
  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    imageMode(CENTER);
    image(Gato, 0,0, 205, 205);
    popMatrix();
  }
  
  void mover()
  {
    if (keyPressed)
     {
       switch (key)
        {
          case 'd':
          dx++;
          break;
      
          case 'a':
          dx-=1;
           break;
           
          case 'D':
          dx++;
          break;
      
          case 'A':
          dx-=1;
           break;
        }
     }
  }
  
  void saltar()
  {
    switch (key)
    {
      case 's':
      
      break;
    }
  }
      
}

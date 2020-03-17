class puente
{
  float totalLength;  
  int numPoints;   
  ArrayList<Particle> particles;

  puente(float l, int n) 
  {
    totalLength = l;
    numPoints = n;
    particles = new ArrayList();
    float len = totalLength / numPoints;
    
    for(int i=0; i < numPoints+1; i++) 
    {
      Particle p = null;
      if (i == 0 || i == numPoints) p = new Particle(i*len,height/2,4,true);
      else p = new Particle(i*len,height/2,4,false);
      particles.add(p);
      
      if (i > 0) 
      {
         DistanceJointDef djd = new DistanceJointDef();
         Particle previous = particles.get(i-1);
         djd.bodyA = previous.body;
         djd.bodyB = p.body;
         djd.length = box2d.scalarPixelsToWorld(len); 
         djd.frequencyHz = 0;
         djd.dampingRatio = 0;
         DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() 
  {
    for (Particle p: particles) 
    {
      p.display();
    }
  }
}


class Particle 
{
  Body body;
  float r;
  color col;

  Particle(float x, float y, float r_, boolean fixed) 
  {
    r = r_;
    BodyDef bd = new BodyDef();
    if (fixed) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    body.createFixture(fd);
    col = color(139, 69, 19);
  }
  
  void killBody() 
  {
    box2d.destroyBody(body);
  }
  
  boolean done() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2) {
      killBody();
      return true;
  }
    return false;
  }

  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(col);
    stroke(200, 69, 25);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }
}

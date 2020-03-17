class gatitos
{

  Body body;
  float r;

  gatitos(float r_, float x, float y) 
  {
    r = r_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

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

    body.setLinearVelocity(new Vec2(random(-5,5),random(-5,-5)));
    body.setAngularVelocity(random(-1,1));
  }


  void applyForce(Vec2 v) 
  {
    body.applyForce(v, body.getWorldCenter());
  }


  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    imageMode(CENTER);
    image(Gato, 0,0, 80, 80);
    popMatrix();
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
  
}

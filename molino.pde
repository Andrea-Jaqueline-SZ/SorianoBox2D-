class molino
{


  RevoluteJoint joint;
  Box box1;
  Box box2;

  molino(float x, float y) 
  {
    box1 = new Box(x, y-20, 120, 10, false); 
    box2 = new Box(x, y, 10, 40, true); 
    RevoluteJointDef rjd = new RevoluteJointDef();
    Vec2 offset = box2d.vectorPixelsToWorld(new Vec2(0, 60));
    rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());
    rjd.motorSpeed = PI/2;       
    rjd.maxMotorTorque = 5000.0; 
    rjd.enableMotor = true;    
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }

  void toggleMotor() 
  {
    joint.enableMotor(!joint.isMotorEnabled());
  }
  boolean motorOn() 
  {
    return joint.isMotorEnabled();
  }

  void display() 
  {
    box2.display();
    box1.display();
    Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter());
    fill(255, 0, 0);
    stroke(0);
    ellipse(anchor.x, anchor.y, 4, 4);
  }
}


class Box 
{
  Body body;
  float w;
  float h;

  Box(float x, float y, float w_, float h_, boolean lock) 
  {
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    if (lock) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    body.setAngularVelocity(random(-5,5));
  }

  void killBody() 
  {
    box2d.destroyBody(body);
  }

  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
  }
}

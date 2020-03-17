class pantalla
{
  int p;
  
  pantalla()
{

}
  
  void inicio()
  {
    imageMode(CORNER);
    image(fondo,0, 0, width, height);
    if(keyPressed)
    {
      p=1;
    }
  }
  
  void molino()
  {
    if(keyPressed)
    {
      p=2;
    }
  }
  
  void puente()
  {
   if(keyPressed)
    {
      p=3;
    }
  }
  
  void lluvia()
  {
    if(keyPressed)
    {
      p=4;
    }
  }
  
  void finale()
  {
    if(keyPressed)
    {
      p=0;
    }
  }
  
  void display()
  {
    switch(p)
    {
      case 0:
      inicio();
      break;
      
      case 1:
      molino();
      break;
      
      case 2:
      puente();
      break;
      
      case 3:
      lluvia();
      break;
      
      case 4:
      finale();
      break;
    }
  }
}

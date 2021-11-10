class FlashBut
{
  float x;
  float y;
  float size;
  //boolean themeDark; //TODO maybe add dark theme later?
  PImage noFlash;
  PImage noFlashOver;
  PImage flash;
  PImage flashOver;
  
  FlashBut(float X, float Y, float Size)
  {
    x = X;
    y = Y;
    size = Size;
    noFlash = loadImage(UIRes +"NoFlash1.png");
    noFlashOver = loadImage(UIRes +"NoFlash2.png");
    flash = loadImage(UIRes +"Flash1.png");
    flashOver = loadImage(UIRes +"Flash2.png");
  }
  
  void drawButton() 
  { 
    if(flashing)
    {
      if (over()) //Not needed for Android but needed for web
      { 
        image(noFlashOver,x,y,size,size);
      }
      else
      {
        image(noFlash,x,y,size,size);
      }
    }
    else
    {
      if (over()) //Not needed for Android but needed for web
      { 
        image(flashOver,x,y,size,size);
      }
      else
      {
        image(flash,x,y,size,size);
      }
    }
  }
  
  boolean over()
  {
    return (dist(mouseX, mouseY, x, y) < size);
  }
  
  void checkButton() 
  {
    if(over()) 
    { 
      if(flashing)
      {
        image(noFlashOver,x,y,size,size);
      }
      else
      {
        image(flashOver,x,y,size,size);
      }
      flashing = !flashing;
    }
  }
}

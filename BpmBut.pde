class BpmBut
{
  float x;
  float y;
  float size;
  boolean over = false;
  //boolean themeDark; //TODO maybe add dark theme later?
  PImage but;
  PImage butOver;
  
  int value;
  
 BpmBut(float X, float Y, float Size, int Value)
  {
    x = X;
    y = Y;
    size = Size;
    value = Value;
    if(value > 0)
    {
      but = loadImage(UIRes +"Faster1.png");
      butOver = loadImage(UIRes +"Faster2.png");
    }
    else
    {
      but = loadImage(UIRes +"Slower1.png");
      butOver = loadImage(UIRes +"Slower2.png");
    }

  }
  
  void drawButton() 
  { 
      if (over()) //Not needed for Android but needed for web
      { 
        image(butOver,x,y,size,size);
      }
      else
      {
        image(but,x,y,size,size);
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
      image(butOver,x,y,size,size);
      if(bpm + value > minBpm && bpm + value < maxBpm)
      {
        bpm += value;
        resetTime();
      }
    }
  }
}

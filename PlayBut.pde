class PlayBut
{
  float x;
  float y;
  float size;
  //boolean themeDark; //TODO maybe add dark theme later?
  PImage play;
  PImage playOver;
  PImage pause;
  PImage pauseOver;
  
 PlayBut(float X, float Y, float Size)
  {
    x = X;
    y = Y;
    size = Size;
    play = loadImage(UIRes +"Play1.png");
    playOver = loadImage(UIRes +"Play2.png");
    pause = loadImage(UIRes +"Pause1.png");
    pauseOver = loadImage(UIRes +"Pause2.png");
  }
  
  void drawButton() 
  { 
    if(paused)
    {
      if (over()) //Not needed for Android but needed for web
      { 
        image(playOver,x,y,size,size);
      }
      else
      {
        image(play,x,y,size,size);
      }
    }
    else
    {
      if (over()) //Not needed for Android but needed for web
      { 
        image(pauseOver,x,y,size,size);
      }
      else
      {
        image(pause,x,y,size,size);
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
      if(paused)
      {
        image(playOver,x,y,size,size);
      }
      else
      {
        image(pauseOver,x,y,size,size);
      }
      paused = !paused;
    }
  }
}

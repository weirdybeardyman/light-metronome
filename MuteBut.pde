class MuteBut
{
  float x;
  float y;
  float size;
  //boolean themeDark; //TODO maybe add dark theme later?
  PImage mute;
  PImage muteOver;
  PImage sound;
  PImage soundOver;
  
  MuteBut(float X, float Y, float Size)
  {
    x = X;
    y = Y;
    size = Size;
    mute = loadImage(UIRes +"Mute1.png");
    muteOver = loadImage(UIRes +"Mute2.png");
    sound = loadImage(UIRes +"Sound1.png");
    soundOver = loadImage(UIRes +"Sound2.png");
  }
  
  void drawButton() 
  { 
    if(!muted)
    {
      if (over()) //Not needed for Android but needed for web
      { 
        image(muteOver,x,y,size,size);
      }
      else
      {
        image(mute,x,y,size,size);
      }
    }
    else
    {
      if (over()) //Not needed for Android but needed for web
      { 
        image(soundOver,x,y,size,size);
      }
      else
      {
        image(sound,x,y,size,size);
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
        image(muteOver,x,y,size,size);
      }
      else
      {
        image(soundOver,x,y,size,size);
      }
      muted = !muted;
    }
  }
}

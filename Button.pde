class Button
{
  float x;
  float y;
  int size;
  //boolean themeDark; //TODO maybe add dark theme later?
  
 Button(int X, int Y, int Size)
  {
    x = X;
    y = Y;
    size = Size;
  }
  
  void drawButton() 
  { 
    if (over()) //Not needed for Android but needed for web
    { 
      fill(100);
      circle(x,y,size);
    }
    else
    {
      fill(0);
      circle(x,y,size);
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
      fill(255);
      circle(x,y,size);
      //Function goes here
    } 
  }
}

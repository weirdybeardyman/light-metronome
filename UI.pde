class UI
{
  float [] xGrid = new float [4];
  float [] yGrid = new float [3];  
  
  float buttonSize;
  
  //Buttons
  PlayBut play;
  BpmBut [] bpmButs = new BpmBut [4];
  MuteBut mute;
  FlashBut flash;
  BeatsBut [] beatsButs = new BeatsBut [2];
  
  UI()
  {
    
    for(int i = 0; i < yGrid.length; i++)
    {
      xGrid[i] = ((width/2)/4)*(i+1);
      yGrid[i] = (height/4)*(i+1);
    }
    //x pos for metronome ect
    xGrid[3] = width-(width/4);
    
    buttonSize = (res)/25;
    
    //Instanciate Buttons
    play = new PlayBut(xGrid[1], yGrid[0], buttonSize*1.5);
    bpmButs[0] = new BpmBut(xGrid[0]-buttonSize/1.5, yGrid[1], buttonSize/1.5, -1);
    bpmButs[1] = new BpmBut(xGrid[2]+buttonSize/1.5, yGrid[1], buttonSize/1.5, 1);
    bpmButs[2] = new BpmBut(xGrid[0]+buttonSize/4, yGrid[1], buttonSize/1.25, -5);
    bpmButs[3] = new BpmBut(xGrid[2]-buttonSize/4, yGrid[1], buttonSize/1.25, 5);
    mute = new MuteBut(xGrid[0], yGrid[2], buttonSize);
    flash = new FlashBut(xGrid[1], yGrid[2], buttonSize);
    beatsButs[0] = new BeatsBut(xGrid[2], yGrid[2]-buttonSize/1.5, buttonSize/1.5, 1);
    beatsButs[1] = new BeatsBut(xGrid[2], yGrid[2]+buttonSize/1.5, buttonSize/1.5, -1);
  }
  
  void drawUI()
  {
    play.drawButton();
    drawText();
    for(int i = 0; i < bpmButs.length; i++)
    {
      bpmButs[i].drawButton();
    }
    mute.drawButton();
    flash.drawButton();
    beatsButs[0].drawButton();
    beatsButs[1].drawButton();
  }
  
  void drawText()
  {
    fill(0);                    
    textSize((res)/50);
    float tempoY = yGrid[1];
    if(!flashing)
    {
      tempoY = yGrid[2];
    }
    text(tempoName, ui.xGrid[3], tempoY);
    text(bpm + " BPM", xGrid[1],yGrid[1]-textOffset);
    text(beatsPerBar, xGrid[2], yGrid[2]-textOffset);
  }
  
  void checkUI()
  {
    play.checkButton();
    for(int i = 0; i < bpmButs.length; i++)
    {
      bpmButs[i].checkButton();
    }
    mute.checkButton();
    flash.checkButton();
    beatsButs[0].checkButton();
    beatsButs[1].checkButton();
  }

}

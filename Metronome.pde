import processing.sound.*;

int bpm = 60;
int minBpm = 32;
int maxBpm = 201;
int beatsPerBar = 4;
int maxBeatsPerBar = 13;
float MetDuration;
float TickPos;
float step;
float timeOffset;
boolean paused = true;
boolean muted;
boolean flashing = true;
int counter = 1;
float timeDelta;
float beatLen;
float flashTime = 500;
String tempoName;
float res;
float textOffset;
int UIRes;

SoundFile Tick;
SoundFile Tock;

UI ui;

void setup()
{
  //size(1200,700);
  fullScreen();
  //orientation(LANDSCAPE); //ANDROID
  frameRate(60);
  background(250);
  strokeWeight(3);
  imageMode(CENTER);
  textAlign(CENTER,CENTER);
  res = width+height;
  UIRes = 128;
  if(res < 2000)
  {
    UIRes = 64;
  }
  MetDuration = 6000 / bpm;
  beatLen = 60000 / bpm;
  setTempoName();
  textOffset = (res)/250;
  Tick = new SoundFile(this, "Tick1.wav");
  Tock = new SoundFile(this, "Tock.wav");
  
  ui = new UI();
}

void draw()
{
  background(250);
  TimeKeeper();
  metronome();
  ui.drawUI();
}

void mousePressed()
{
  ui.checkUI();
}

void metronome()
  {
    TickPos = sin((step * PI) / beatLen);//sin(step/(MetDuration*PI)) * MetAmp);  Why was this so close?
    drawMetronome(TickPos);  
    //Flash
    if(flashing)
    {
      drawFlash((counter-1) % beatsPerBar == 0, ((counter-1) % beatsPerBar) +1);
    }
    //Tick
    if(step / counter >= beatLen)
    {
      if(counter % beatsPerBar == 0 && !muted)
      {
        Tick.play();
      }
      else if(!muted)
      {
        Tock.play();
      }
      counter++;
    }
  }
 
  
  void TimeKeeper()
{
    //Timekeeping 
    if(!paused)
    {
      step = millis() - timeOffset; 
    }
    else
    {
      timeOffset = millis() - step;
    }
}

void drawMetronome(float x) //Make Metronome Obj then these calculations wouldn't need to be done each tick
  {
    //draw static bits
    noFill();
    float sw = 3;
    float h = (res)/10;
    float w = (res)/13;
    float xPos = ui.xGrid[3]; 
    float yPos = ui.yGrid[0];
    float weightSize = (res)/100;
    float amp = (res) / 30;
    if(!flashing)
    {
      yPos = (height / 2) - (h / 4);
      h *= 2;
      w *= 2;
      weightSize *= 2;
      amp *= 2;
      sw = 6;
    }
    strokeWeight(sw);
    x *= amp; // Times the x pos by the amplitude of the swing
    triangle(xPos,yPos-(h/2),xPos-(w/2),yPos+(h/2),xPos+(w/2),yPos+(h/2)); //TODO Streamline :)
    line(xPos-(w/3)-sw,yPos+(h/5),xPos+(w/3)+sw,yPos+(h/5)); //unintentionally realised the width is 1/4 in centre, wonder why
    //draw line of ticker
    x += xPos;
    float maxY = yPos-(h/2);
    float y = maxY + (abs(xPos-x)*(PI/14)); //TODO maybe tweak to look more realistic
    line(xPos,yPos+(h/5),x,y);
    float weightPos = 1-(float(bpm)/220);
    circle(lerp(xPos,x,weightPos),lerp(yPos+(h/5),y,weightPos),weightSize); //instead of % it should scale more at lower and less at higher bpm, change to more accurate shape using tangents 
  }
  
  void drawFlash(boolean tick, int beat)
  {
    float xPos = ui.xGrid[3];
    float yPos = ui.yGrid[2];
    float size = (res)/15;
    textSize((res)/30);
    
    if(tick)
    {
      fill(0);
      circle(xPos, yPos, size);
      fill(255);
      text(beat, xPos, yPos- textOffset/*(res)/200*/); 
    }
    else
    {
      fill(255);
      circle(xPos, yPos, size);
      fill(0);
      text(beat, xPos, yPos- textOffset/*(res)/200*/); 
    }
  }
  
  void resetTime()
  {
      //TODO Put step back to 0 even if paused
      if(!paused)
      {
        timeOffset = millis();
      }
      else
      {
        step = 0;
      }
      beatLen = 60000 / bpm;
      MetDuration = 6000 / bpm; 
      counter = 1;
      setTempoName();
  }
  
  void setTempoName()
  {
    if(bpm > 25 && bpm < 45) //Simplify, not sure why I am writing each of these out each time when there is an array of them
    {
      tempoName = "Grave";
    }
    else if (bpm < 60)
    {
      tempoName = "Largo";
    }
    else if (bpm < 76)
    {
      tempoName = "Adagio";
    }
    else if(bpm < 108)
    {
      tempoName = "Andante";
    }
    else if(bpm < 120)
    {
      tempoName = "Moderato";
    }
    else if(bpm < 156)
    {
      tempoName = "Allegro";
    }
    else if(bpm < 176)
    {
      tempoName = "Vivace";
    }
    else if(bpm <= 200)
    {
      tempoName = "Presto";
    }
  }

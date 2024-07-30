int score = 0;
public class Timer{
  
  int time, seconds, minutes, framerate, textSize;

  
  public Timer(){
    time = 0;
    seconds = 0;
    minutes = 0;
    framerate = (int)frameRate;
    textSize = 20;

  }
  
    String realTime = String.format("%d:%02d", minutes, seconds);;
  
  void update(){
    time ++;
   
    if(time % framerate == 0)
    seconds ++;
 
    if(seconds == 60){
      seconds = 0;
      minutes ++;
    }
    if (minutes == 2){
      pausa = true;
    }
   
    realTime = String.format("%d:%02d", minutes, seconds);
   
    }
 
 
  int lastNewItemSecond = -1; 
  void show(){      
    if (tempo.seconds % 1 == 0 && tempo.seconds != lastNewItemSecond) {
      newItem();
      lastNewItemSecond = tempo.seconds;
    }
        
    //Código para o tempo atual não se sobrepor ao anterior ao ser atualizado
    fill(255, 150);
    noStroke();
    float sc = textSize * 8, ti = textSize * 9;
    rect(width - sc, 0, sc, textSize+5, 10);
    rect(0, 0, ti, textSize+5, 10);
    
    fill(0);
    textSize(textSize);
    text("Score: " + score, width - sc , textSize);
    
    fill(0);
    textSize(textSize);
    text("Timer: " + realTime, 3, textSize);
  }
 
  void timer(){
   this.update();
   this.show();
  }
}

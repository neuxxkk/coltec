import java.util.Stack;

int count=0; //conta ciclo para primeira inicialização
int range = 0; //quantos discos torre possui
int atualizaStatus=0; //selecionou origem ou destino, ou iniciou jogo
float estacaW, estacaH; //Width e Height das torres

int[] swap = new int[2]; //armazena torre origem [0] --> torre destino [1]

Stack<Disco>[] discos = new Stack[3]; //array de estacas com discos dentro
Stack<Float> estacaX = new Stack<>(); //armazena X das torres

void setup(){
  size(600, 600);
  for (int i = 0; i < 3; i++) { //inicializa Stack de Disco()
    discos[i] = new Stack<>();
  }
}

void draw(){
  background(220);
  estacaW=width/(width*0.05);
  estacaH=height*0.8;
  
  for (int i=0; i<3; i++){ //para cada estaca
    count++;
    
    //desenha estacas
    estacaX.push(((width*0.225)*(i+1))+estacaW*i); //salva X posisition of each one 
    fill(190);
    rect(estacaX.get(i), height, estacaW, - (estacaH)); //Draw it
    
    //Quantos discos tem na estaca = range
    if (discos[i].empty()==false){range=discos[i].size();}else if(count==1){range=5;}else{range=0;}
    
    for (int j=0; j<range; j++){ //faça range discos
    
    //somente primeit
    if (atualizaStatus==0 && count == 1){
      //gera aleatorio tamanho dos discos
      float s = random(((((width*0.225)*0.4)*2)+estacaW)/2, (((width*0.225)*0.4)*2)+estacaW);
      discos[swap[1]].push(new Disco(j, s, swap[1]));
    }
      
      if (discos[i].empty()==false){
          discos[i].get(j).drawDisco(); //desenha discos
      }
    }
  }
}

void mouseClicked(){

  for (int i=0; i<3; i++){
    if ((mouseX>=estacaX.get(i) && mouseX <=estacaX.get(i)+estacaW) && (mouseY>=(height-estacaH))){
       if (atualizaStatus==1){
         atualizaStatus = 0;
         swap[1] = i;
         
         if (discos[swap[1]].empty() == false && discos[swap[0]].empty()==false){
           if (discos[swap[0]].peek().size <= discos[swap[1]].peek().size){ //Se ultimo elemento da pilha origem for menor que ultimo da pilha destino
             discos[swap[1]].push(new Disco(discos[swap[1]].size(), discos[swap[0]].peek().size, swap[1])); //adiciona no destino
             discos[swap[0]].pop();//remove da pilha origem
           }
         }else if(discos[swap[0]].empty()==false){
               discos[swap[1]].push(new Disco(0, discos[swap[0]].peek().size, swap[1]));//adiciona no destino
               discos[swap[0]].pop();  //remove da pilha origem
         }
         }else{
            atualizaStatus = 1;
            swap[0] = i;
         }
      }
    }
  }

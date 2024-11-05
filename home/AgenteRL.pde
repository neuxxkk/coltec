class AgenteRL {
  HashMap<String, Float> tabelaQ;
  float taxaAprendizagem;
  float fatorDesconto;
  float taxaExploracaoInicial;
  float taxaExploracaoMinima;
  float decaimentoExploracao;
  int episodios;
  
  AgenteRL(float taxaAprendizagem, float fatorDesconto, float taxaExploracaoInicial, float taxaExploracaoMinima, float decaimentoExploracao) {
    tabelaQ = new HashMap<String, Float>();
    this.taxaAprendizagem = taxaAprendizagem;
    this.fatorDesconto = fatorDesconto;
    this.taxaExploracaoInicial = taxaExploracaoInicial;
    this.taxaExploracaoMinima = taxaExploracaoMinima;
    this.decaimentoExploracao = decaimentoExploracao;
    this.episodios = 0;
  }
  
  float obterValorQ(String estado, int acao) {
    String chave = estado + "," + acao;
    if (!tabelaQ.containsKey(chave)) tabelaQ.put(chave, 0.0);
    return tabelaQ.get(chave);
  }
  
  void atualizarValorQ(String estado, int acao, float recompensa, String proximoEstado) {
    float qAtual = obterValorQ(estado, acao);
    float maxProximoQ = max(obterValorQ(proximoEstado, 0), obterValorQ(proximoEstado, 1));
    float novoQ = qAtual + taxaAprendizagem * (recompensa + fatorDesconto * maxProximoQ - qAtual);
    tabelaQ.put(estado + "," + acao, novoQ);
    incrementarEpisodios();
  }
  
  int escolherAcao(String estado) {
    float taxaExploracao = max(taxaExploracaoMinima, taxaExploracaoInicial * exp(-decaimentoExploracao * episodios));
    //println(obterValorQ(estado, 0) + "|" + obterValorQ(estado, 1));
    if (random(1) < taxaExploracao) return round(random(0,2));
    else{
      if (obterValorQ(estado, 0) >= obterValorQ(estado, 1))
        return (obterValorQ(estado, 0) >= obterValorQ(estado, 2)) ? 0 : 2;
      else 
        return (obterValorQ(estado, 1) >= obterValorQ(estado, 2)) ? 1 : 2;
    }
  }
  
  void incrementarEpisodios() {
    episodios = (episodios + 1) % 100000;
    
  }
}

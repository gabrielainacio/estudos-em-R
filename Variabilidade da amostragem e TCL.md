# Amostragem com Reposição e Teorema do Limite Central

Ao retirar amostras com reposição, as médias amostrais podem variar em magnitude.

Assim, se tivermos 5 amostras (de mesmo tamanho), cada amostra possui sua própria média, chamada média amostral.

Ao repetir o processo de amostragem várias vezes, obtemos uma distribuição de probabilidade ou de frequência das médias amostrais.

## Parâmetros da Distribuição Amostral:

- A média da distribuição amostral das médias (μx̅) é a verdadeira média da população (μ).
- O desvio-padrão (erro padrão) é σ/√n, onde σ é o desvio padrão populacional e n é o tamanho da amostra.

### Erro Padrão (desvio padrão das médias):

- É o desvio padrão da amostra de erro padrão.
- O erro padrão diminui à medida que o tamanho da amostra aumenta.
- Relaciona-se diretamente com a distribuição das médias das amostras.

## Teorema do Limite Central (TCL):

### Definição do TCL

Seja uma população estatística com média μ e desvio padrão σ. A distribuição das médias amostrais desta população tenderá a apresentar uma distribuição normal de probabilidades com média μ e desvio padrão σ/√(n) à medida que o tamanho amostral n aumenta, ainda que a distribuição das observações originais não possua uma distribuição normal.

- Importante para dados que não seguem uma distribuição normal.
- Mesmo dados não normais podem ter uma distribuição normal quando observamos médias de amostras.
- Esta distribuição normal oculta é revelada pela coleta de amostras de múltiplas observações e pelo cálculo da média para cada amostra.
- À medida que o número de observações em cada amostra aumenta, a distribuição das médias torna-se mais semelhante à normal.
- A existência desta distribuição normal oculta é conhecida como o Teorema do Limite Central.

### Condições para Aplicação do TCL:

1. **Independência:** Observações das amostras devem ser independentes.
2. **Tamanho/Distorção da Amostra:**
   - Se a distribuição populacional for normal, a distribuição amostral será quase normal.
   - Se a distribuição populacional não for normal, maior amostra é necessária para aplicar o TCL.
   - Se n ≥ 30 (geralmente), a distribuição amostral das médias será aproximadamente normal.

## Importância do TCL:

- Permite inferências sobre os parâmetros da população mesmo quando os dados não são normalmente distribuídos.
- Ferramentas como intervalos de confiança e testes de hipóteses assumem normalidade dos dados; o TCL permite sua aplicação mesmo em populações com distribuição desconhecida ou não normal.

## Conclusão:

O TCL é crucial para aplicação de métodos estatísticos em inferências populacionais, proporcionando confiança nas análises mesmo quando a distribuição dos dados não é conhecida.

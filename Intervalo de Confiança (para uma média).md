# Intervalo de Confiança (IC)

O Intervalo de Confiança (IC) é uma estimativa que fornece uma faixa plausível de valores para um parâmetro populacional, como a média ou desvio padrão. Proporciona uma medida de quão precisamente estimamos o parâmetro, com base em dados de amostra. Calculado para um determinado nível de confiança, indicando a probabilidade de que o intervalo contenha o verdadeiro valor do parâmetro. Obtida a partir de uma estimativa pontual (média da amostra) e uma margem de erro associada a essa estimativa. O IC é expresso como uma faixa de valores dentro da qual acredita-se que o parâmetro populacional reside.

## Fórmula do IC:

O IC é calculado pela fórmula:

\[ \bar{x} \pm z_{\alpha/2} \times \frac{\sigma}{\sqrt{n}} \]

Onde \(\bar{x}\) é a média da amostra, \(\sigma\) é o desvio padrão populacional, \(n\) é o tamanho da amostra e \(z_{\alpha/2}\) é o valor crítico Z associado ao nível de confiança \(1-\alpha\).

## Cálculo do Valor Crítico Z em R:

O valor crítico Z é calculado usando a função `qnorm()` em R. Para um nível de confiança de 95%, o valor de \(z_{\alpha/2}\) é obtido com:

```R
qnorm(0.025)

# Teste de Hipóteses (para uma média)

O teste de hipótese consiste em calcular a probabilidade de que a minha amostra tenha vindo da população estabelecida na hipótese nula. Se a probabilidade da minha amostra participar da hipótese nula for alta, não há motivo para rejeitá-la.

![image](https://github.com/gabrielainacio/estudos-em-R/assets/157652526/cf84ca7f-eb87-40c0-92bd-fa85d83f8304)

## Hipótese Nula (H0) e Hipótese Alternativa (Ha)

- **Hipótese Nula (H0):** Afirmação inicial que geralmente assume a igualdade do parâmetro de interesse a um valor específico.
- **Hipótese Alternativa (Ha):** Proposição oposta à hipótese nula; pode ser afirmativa de que o parâmetro é menor, maior ou diferente do valor nulo.

  - Se for diferente, é um teste bilateral: H0: µ=µ1 e Ha: µ≠µ1
  - Se estiver em um intervalo, é um teste unilateral: H0: µ=µ1 e Ha: µ>µ1
    - A incerteza está em um único lado da curva

## p-value

- **p-value:** Probabilidade de observar um resultado dado que a hipótese nula é verdadeira.
  - Se p-value < nível de significância (alfa), normalmente 0,05, rejeitamos a hipótese nula.

## Como fazer teste de hipótese para uma única média

1. **Definir as hipóteses**
2. **Calcular a estimativa pontual**
   - Se o parâmetro for uma média populacional, a estimativa pontual será uma média amostral.
3. **Verificar as condições (método que se baseia no TCL)**
   - Independência
   - Tamanho ou inclinação da amostra (maior ou igual a 30 com distribuição não muito distorcida)
4. **Desenhar a distribuição da amostragem, sombrear o valor de p e calcular a estatística do teste**
   - A estatística do teste é o z-score, calculado como nossa estimativa pontual menos o valor nulo, dividido pelo erro padrão: z=(x̄-μ)/SE, onde SE=s/√n
5. **Tomar decisão**

## Método do valor crítico (teste bilateral)

- Valor crítico (z-crítico) é o limite além do qual rejeitamos a hipótese nula.
- Se a estatística do teste (z-calculado) ultrapassar o valor crítico, rejeitamos H0.

## Método do Valor Crítico - Teste Unilateral

1. **Estabelecer as hipóteses**
   - Hipótese Nula (H0): µ = µ1
   - Hipótese Alternativa (Ha): µ > µ1 (teste unilateral à direita) ou µ < µ1 (teste unilateral à esquerda).
2. **Determinar o Nível de Significância (α)**
   - Normalmente, α = 0,05.
3. **Encontrar o Valor Crítico (z-crítico)**
   - Utilizar a tabela Z ou uma calculadora estatística.
4. **Calcular o Valor de z (z-calculado)**
   - Utilizar a fórmula z = (x̄ - µ) / (σ/√n).
5. **Tomada de Decisão**
   - Rejeitar H0 se z-calculado > z-crítico (teste unilateral à direita) ou z-calculado < z-crítico (teste unilateral à esquerda).

## Método do valor de p (teste bilateral)

- Calcula a probabilidade e compara com o nível de significância (0,05).
- Calcula o valor de z e observa na tabela qual é a área da distribuição normal padronizada acima ou abaixo do módulo do resultado de z obtido.

### Exemplo em R (para teste unilateral)
```R
X <- c(65, 73, 56, 71, 69, 69, 68, 59, 73, 68, 69, 64, 67, 64, 66)
Xm <- mean(X)
pnorm(q = Xm, mean = 65, sd = 9/sqrt(15), lower.tail = FALSE) * 2
````

## Método do Valor de p - Teste Unilateral

1. **Estabelecer as hipóteses**
   - Hipótese Nula (H0): µ = µ1
   - Hipótese Alternativa (Ha): µ > µ1 (teste unilateral à direita) ou µ < µ1 (teste unilateral à esquerda).
2. **Determinar o Nível de Significância (α)**
   - Normalmente, α = 0,05.
3. **Calcular o Valor de z (z-calculado)**
   - Utilizar a fórmula z = (x̄ - µ) / (σ/√n).
4. **Encontrar o Valor de p**
   - Utilizar a distribuição normal padronizada para encontrar a área correspondente ao z-calculado.
   - Para teste unilateral à direita, a área estará acima do z-calculado.
   - Para teste unilateral à esquerda, a área estará abaixo do z-calculado.
5. **Comparação com o Nível de Significância**
   - Rejeitar H0 se o valor de p < α.

### Exemplo em R

```R
# Dados de exemplo
X <- c(65, 73, 56, 71, 69, 69, 68, 59, 73, 68, 69, 64, 67, 64, 66)
Xm <- mean(X)

# Hipótese nula (H0): µ = 65
# Desvio padrão (σ) estimado como 9 e tamanho da amostra (n) como 15
z_calculado <- (Xm - 65) / (9/sqrt(15))

# Valor Crítico para α = 0.05 (unilateral à direita)
z_critico <- qnorm(1 - 0.05, lower.tail = FALSE)

# Valor de p para teste unilateral à direita
p_value_unilateral_direita <- pnorm(q = z_calculado, lower.tail = FALSE)

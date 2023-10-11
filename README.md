# Rinha de backend

Repo original da competição: https://github.com/zanfranceschi/rinha-de-backend-2023-q3

## Objetivo

O objetivo era criar uma aplicação em elixir que fosse capaz de fazer tudo que os outros projetos já fizeram, mas SEM algumas das principais regras/otimizações utilizadas:

- nginx
- multiplos serviços (apenas um app)
- sem batch insert

Para poder testar a capacidade de escalar verticalmente do elixir, embora no final das contas a quantidade de recursos da aplicação nunca foi uma preocupação real

## Prints

### Resultado do gatling
![resultado gatling navegador](./images/gatling-browser.png)

### Resultado do gatling no console
![resultado gatling console](./images/gatling-console.png)

### Recusos do docker durante a parte mais pesada do teste

Sobraram bastante recursos de memória e um pouco de CPU

![Recusos do docker durante a parte mais pesada do teste](./images/docker-stats.png)

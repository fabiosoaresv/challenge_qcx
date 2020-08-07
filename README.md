# README

Projeto realizado para um desafio na @qcx :)

### Desafio
A documentação oficial está [aqui](https://github.com/qcx/desafio-backend), irei deixar um resumo.

```console
Você vai ser responsável por modelar e desenvolver esse serviço utilizando as bibliotecas/frameworks que achar que mais convenientes para a solução. Tenha em mente de que temos mais de 300 mil clientes diários então escala é algo imprescindível por aqui. Para isso você deve ler os arquivos json neste repositório e baseado nos dados contidos criar os seguintes modelos de busca:

Disciplinas com questões mais quentes: Listar as disciplinas onde as questões foram as mais acessadas nas ultimas 24H
Mais acessadas por periodo: Listar as questões mais acessadas por semana/mês/ano
```

### Requisitos
- Ruby 2.6.3
- Rails 6.0
- Bundler 2.1.4
- PostgreSQL 12.3
- Git

### Arquitetura do projeto
O projeto foi divido com a lógica principal centralizada em [Service](https://github.com/fabiosoaresv/challenge_qcx/blob/master/app/services/questions_accessed.rb), para poder ser utilizado o Rest-Client para objter o json no repo da @qcx.

Em seguida, a lógica necessária foi extraída para os métodos privados, para se obter as disciplinas mais acessadas de acordo com os ranges (24 horas, semana, mês, ano).

### Configuração inicial
```console
$ git clone https://github.com/fabiosoaresv/challenge_qcx.git
$ cd challenge_qcx/
$ bundle install
# NOTE: run with RAILS_ENV=test or RAILS_ENV=development
$ bundle exec rake db:create db:migrate db:seed
```

### Contato
Caso haja dúvidas, envie um e-mail para:
fabiosoares@outlook.com.br

# Descrição

Um projeto em ruby on rails para construir uma estrutura ágil Kanban capaz de criar, autalizar, deletar e mostrar tarefas; transpassar a tarefa entre diferentes status e mostrar um Dashboard com dados sobre as tarefas.

Requerimentos:
Ruby on Rails 7.0.7.2
Ruby 3.2.2
Javascript
Postgresql 15

# Para executar o projeto

* Execute o comando git clone https://github.com/Alex-dev-if/Kanban_ruby_on_rails.git
* Entre na pasta "Kanban_ruby_on_rails" que foi criada com seu editor de código (no vscode basta entra na pasta, no cmd, e digitar code .)
* Abra a pasta "config" e abra o arquivo "database.yml"
* Nos campos "username" e "password" mude para seus respectivos nome de usuário e senha do postgreSQL.
* Agora, no cmd, na pasta "Kanban_ruby_on_rails" digite o comando "rails db:create"
* Digite o comando "rails db:migrate"
  O projeto já está pronto para executar, para fazer isso digite "rails s" e no navegador abra no host que foi definido no arquivo "database.yml". Por padrão está em localhost com a porta 3000 (127.0.0.1:3000)
  ps: Caso de algum erro tente atualizar a página e provavelmente se resolverá.

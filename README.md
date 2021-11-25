# API para processo seletivo GranConcursos
####Desenvolvida por Fernando Ferreira

* ###[Requisitos](#Requisitos)
  * Possuir o framework Lumen instalado [Link](https://lumen.laravel.com/docs/8.x).
  * Possuir o composer instalado [Link](https://getcomposer.org/download/).
  * No terminal, certificar que os arquivos do JWT estão instalados, comando <code>composer require firebase/php-jwt</code>
  * Habilitar o mysql no arquivo php.ini
  * Com o mysql instalado, criar um schema com o nome "processo-seletivo"

* ###[Rodando a api via server](#Rodando a api via server)
    * No diretório raiz do projeto:
        * Executar os migrations, caso não tenha os arquivos:
            * <code>php artisan make:migration criar_tabela_eventos --create=eventos</code>
            * <code>php artisan make:migration criar_tabela_noticias --create=noticias</code>
            * <code>php artisan make:migration criar_tabela_usuarios --create=usuarios</code>
        * Executar o comando <code><strong>php artisan migrate</strong></code>
        * Para popular o banco com dados aleatórios, decisão opcional:
            * Criar os seeders caso o projeto não possua:
                * <code>php artisan make:seeder EventosSeeder</code>
                * <code>php artisan make:seeder NoticiasSeeder</code>
                * <code>php artisan make:seeder UsuariosSeeder</code>
            * Compilar no terminal <code>php artisan db:seed</code>
        * Executar <code>php -S localhost:8000 -t public</code>

* ###[Endpoints](#Endpoints)
  * GET http://localhost:8000/api/noticias
    * Retorna uma lista de notícias, por padrão, retorna os primeiros 5 itens;
    * Para paginar as consultas, deve-se informar o QueryParameter ?per_page=numero_de_itens_por_pagina
    
  * POST http://localhost:8000/api/usuario/cadastrar
    * Body: <code>{
      "nome" : string,
      "email" : string,
      "senha" : string
      }</code>
    * Type: <code>Json</code>
    * ResponseCode: <code>400, 201, 500</code>   

  * POST http://localhost:8000/api/usuario/login
    * Body: <code>{
      "email" : string,
      "senha" : string
      }</code>
    * Type: <code>Json</code>
    * ResponseCode: <code>400, 200, 500</code>
    * Response: <code>{
      "nome": string,
      "email": string,
      "updated_at": DateTime,
      "created_at": DateTime,
      "id": int,
      "token": string
      }</code>
    
  * GET http://localhost:8000/api/eventos
    * API protegida
    * Requer no Header a autenticação no formato: <code>{"api_token": token}</code>
    * Token é fornecido no login ou no cadastro
    * ResponseCode: <code>401, 200, 500</code>
    * Type: <code>Json</code>
    

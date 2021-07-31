Feature: GoRest

@GoRest
    Scenario: Pré-teste - Verificar funcionamento da API GoRest
        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public/v1/users"
        And eu defino o query parameter "Authentication" como "YmVhcmVyIDIyNzVlMmNiYmY4ZGMxZDExM2IyNWZiMDE4Y2RiMmUwN2UwODhiMzViYjVmN2I3YzEzY2ExNjBlZDk2YTgyYmE="
        And eu defino o query parameter "access-token" como "MjI3NWUyY2JiZjhkYzFkMTEzYjI1ZmIwMThjZGIyZTA3ZTA4OGIzNWJiNWY3YjdjMTNjYTE2MGVkOTZhODJiYQ=="
        When envio uma requisição GET
        Then o status code deve ser 200
        And eu imprimo o body do response

@GoRest
    Scenario: Pré-teste - Listar usuário por ID da API GoRest
        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public/v1/users"
        And eu defino o query parameter "Authentication" como "YmVhcmVyIDIyNzVlMmNiYmY4ZGMxZDExM2IyNWZiMDE4Y2RiMmUwN2UwODhiMzViYjVmN2I3YzEzY2ExNjBlZDk2YTgyYmE="
        And eu defino o query parameter "access-token" como "MjI3NWUyY2JiZjhkYzFkMTEzYjI1ZmIwMThjZGIyZTA3ZTA4OGIzNWJiNWY3YjdjMTNjYTE2MGVkOTZhODJiYQ=="
        And eu defino o query parameter "id" como "1"
        When envio uma requisição GET
        Then o status code deve ser 200
        And eu imprimo o body do response

@GoRest
    Scenario: 1 - Usar o endpoint de 'Criar um Usuário' para criar um usuário válido, e então validar se o mesmo foi criado no endpoint 'Listar todos Usuários'
        
        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o query parameter "access-token" como "2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba"
        And eu defino o request payload como '{"name": "Yuro Teste","email": "yuro@gmail.com","gender": "Male","status": "Active"}'
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o header content type como 'application/json'
        And eu imprimo o body do request
        When envio uma requisição POST
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/id" do response na variável temporária "idPOST"
        And eu imprimo o valor da variável temporária "idPOST"
        And eu salvo o valor do campo "data/id" do response na variável temporária inter-cenário "idUsuario"
        And eu imprimo o valor da variável temporária "idUsuario"
        And eu salvo o valor do campo "data/name" do response na variável temporária "namePOST"
        And eu imprimo o valor da variável temporária "namePOST"
        And eu salvo o valor do campo "data/email" do response na variável temporária "emailPOST"
        And eu imprimo o valor da variável temporária "emailPOST"
        And eu imprimo o valor da variável temporária "id"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o query parameter "id" como "${idPOST}"
        And eu imprimo a rota completa
        And envio uma requisição GET
        And o status code deve ser 200
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/0/id" do response na variável temporária "idGET"
        And eu imprimo o valor da variável temporária "idGET"
        And eu salvo o valor do campo "data/0/name" do response na variável temporária "nameGET"
        And eu imprimo o valor da variável temporária "nameGET"
        And eu salvo o valor do campo "data/0/email" do response na variável temporária "emailGET"
        And eu imprimo o valor da variável temporária "emailGET"
        Then o valor salvo na variável temporária "idGET" deve igual ao da variável temporária "idPOST"
        And o valor salvo na variável temporária "nameGET" deve igual ao da variável temporária "namePOST"
        And o valor salvo na variável temporária "emailGET" deve igual ao da variável temporária "emailPOST"

        Given eu imprimo o texto "Limpando a massa de dados para não afetar os próximos cenários."
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users/${idGET}"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        When envio uma requisição DELETE
        Then o status code deve ser 200

@GoRest
    Scenario: 2 - Alterar o nome deste usuário criado com o endpoint 'Alterar dados do Usuário' e então validar as alterações no endpoint 'Listar um único Usuário'
        
        Given eu imprimo o texto "Preparando a massa de dados para o cenário 2"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o query parameter "access-token" como "2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba"
        And eu defino o request payload como '{"name": "Yuro Teste","email": "yuro@gmail.com","gender": "Male","status": "Active"}'
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o header content type como 'application/json'
        And envio uma requisição POST
        And eu salvo o valor do campo "data/id" do response na variável temporária "idPOST"
        And eu salvo o valor do campo "data/id" do response na variável temporária inter-cenário "idUsuario"
        And eu salvo o valor do campo "data/name" do response na variável temporária "namePOST"
        And eu salvo o valor do campo "data/email" do response na variável temporária "emailPOST"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o query parameter "id" como "${idPOST}"
        And envio uma requisição GET
        And o status code deve ser 200
        And eu salvo o valor do campo "data/0/id" do response na variável temporária "idGET"
        And eu salvo o valor do campo "data/0/name" do response na variável temporária "nameGET"
        And eu salvo o valor do campo "data/0/email" do response na variável temporária "emailGET"
        Then o valor salvo na variável temporária "idGET" deve igual ao da variável temporária "idPOST"
        And o valor salvo na variável temporária "nameGET" deve igual ao da variável temporária "namePOST"
        And o valor salvo na variável temporária "emailGET" deve igual ao da variável temporária "emailPOST"
        
        Given eu imprimo o texto "Iniciando o cenário 2."
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users/${idGET}"
        And eu defino o query parameter "access-token" como "2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba"
        And eu defino o request payload como '{"name": "Yuri Modificação"}'
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o header content type como 'application/json'
        And eu imprimo o body do request
        When envio uma requisição PUT
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/id" do response na variável temporária "idPUT"
        And eu imprimo o valor da variável temporária "idPUT"
        And eu salvo o valor do campo "data/name" do response na variável temporária "namePUT"
        And eu imprimo o valor da variável temporária "namePUT"
        And eu salvo o valor do campo "data/email" do response na variável temporária "emailPUT"
        And eu imprimo o valor da variável temporária "emailPUT"
        And eu imprimo o valor da variável temporária "id"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o query parameter "id" como "${idGET}"
        And eu imprimo a rota completa
        And envio uma requisição GET
        And o status code deve ser 200
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/0/id" do response na variável temporária "idGET"
        And eu imprimo o valor da variável temporária "idGET"
        And eu salvo o valor do campo "data/0/name" do response na variável temporária "nameGET"
        And eu imprimo o valor da variável temporária "nameGET"
        And eu salvo o valor do campo "data/0/email" do response na variável temporária "emailGET"
        And eu imprimo o valor da variável temporária "emailGET"
        Then o valor salvo na variável temporária "idGET" deve igual ao da variável temporária "idPUT"
        And o valor salvo na variável temporária "nameGET" deve igual ao da variável temporária "namePUT"
        And o valor salvo na variável temporária "emailGET" deve igual ao da variável temporária "emailPUT"

        Given eu imprimo o texto "Limpando a massa de dados para não afetar os próximos cenários."
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users/${idGET}"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        When envio uma requisição DELETE
        Then o status code deve ser 200

@GoRest
    Scenario: 3 - Deletar o usuário criado no endpoint 'Deletar Usuario' e validar se o mesmo foi removido no endpoint 'Listar todos Usuários''
        
        Given eu imprimo o texto "Preparando a massa de dados para o Cenário 3"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o query parameter "access-token" como "2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba"
        And eu defino o request payload como '{"name": "Yuro Teste","email": "yuro@gmail.com","gender": "Male","status": "Active"}'
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o header content type como 'application/json'
        When envio uma requisição POST
        And eu salvo o valor do campo "data/id" do response na variável temporária "idPOST"
        And eu salvo o valor do campo "data/id" do response na variável temporária inter-cenário "idUsuario"
        And eu salvo o valor do campo "data/name" do response na variável temporária "namePOST"
        And eu salvo o valor do campo "data/email" do response na variável temporária "emailPOST"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o query parameter "id" como "${idPOST}"
        And eu imprimo a rota completa
        And envio uma requisição GET
        And o status code deve ser 200
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/0/id" do response na variável temporária "idGET"
        And eu imprimo o valor da variável temporária "idGET"
        And eu salvo o valor do campo "data/0/name" do response na variável temporária "nameGET"
        And eu imprimo o valor da variável temporária "nameGET"
        And eu salvo o valor do campo "data/0/email" do response na variável temporária "emailGET"
        And eu imprimo o valor da variável temporária "emailGET"
        Then o valor salvo na variável temporária "idGET" deve igual ao da variável temporária "idPOST"
        And o valor salvo na variável temporária "nameGET" deve igual ao da variável temporária "namePOST"
        And o valor salvo na variável temporária "emailGET" deve igual ao da variável temporária "emailPOST"

        Given eu imprimo o texto "Iniciando o cenário 3"
        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users/${idGET}"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino a variável temporária "resultado" com o valor null
        When envio uma requisição DELETE
        And eu imprimo o body do response
        And o status code deve ser 200
        And eu salvo o valor do campo "data" do response na variável temporária "dataDELETE"
        And eu imprimo o valor da variável temporária "dataDELETE"
        Then o valor salvo na variável temporária "resultado" deve igual ao da variável temporária "dataDELETE"

@GoRest
    Scenario: Teste 4 - Criar, editar e excluir usuário utilizando a API GoRest
        
        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o query parameter "access-token" como "2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba"
        And eu defino o request payload como '{"name": "Yuro Teste","email": "yuro@gmail.com","gender": "Male","status": "Active"}'
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o header content type como 'application/json'
        And eu imprimo o body do request
        And envio uma requisição POST
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/id" do response na variável temporária "idPOST"
        And eu imprimo o valor da variável temporária "idPOST"
        And eu salvo o valor do campo "data/id" do response na variável temporária inter-cenário "idUsuario"
        And eu imprimo o valor da variável temporária "idUsuario"
        And eu salvo o valor do campo "data/name" do response na variável temporária "namePOST"
        And eu imprimo o valor da variável temporária "namePOST"
        And eu salvo o valor do campo "data/email" do response na variável temporária "emailPOST"
        And eu imprimo o valor da variável temporária "emailPOST"
        And eu imprimo o valor da variável temporária "id"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o query parameter "id" como "${idPOST}"
        And eu imprimo a rota completa
        And envio uma requisição GET
        And o status code deve ser 200
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/0/id" do response na variável temporária "idGET"
        And eu imprimo o valor da variável temporária "idGET"
        And eu salvo o valor do campo "data/0/name" do response na variável temporária "nameGET"
        And eu imprimo o valor da variável temporária "nameGET"
        And eu salvo o valor do campo "data/0/email" do response na variável temporária "emailGET"
        And eu imprimo o valor da variável temporária "emailGET"
        Then o valor salvo na variável temporária "idGET" deve igual ao da variável temporária "idPOST"
        And o valor salvo na variável temporária "nameGET" deve igual ao da variável temporária "namePOST"
        And o valor salvo na variável temporária "emailGET" deve igual ao da variável temporária "emailPOST"

        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users/${idGET}"
        And eu defino o query parameter "access-token" como "2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba"
        And eu defino o request payload como '{"name": "Yuri Modificação"}'
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o header content type como 'application/json'
        And eu imprimo o body do request
        When envio uma requisição PUT
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/id" do response na variável temporária "idPUT"
        And eu imprimo o valor da variável temporária "idPUT"
        And eu salvo o valor do campo "data/name" do response na variável temporária "namePUT"
        And eu imprimo o valor da variável temporária "namePUT"
        And eu salvo o valor do campo "data/email" do response na variável temporária "emailPUT"
        And eu imprimo o valor da variável temporária "emailPUT"
        And eu imprimo o valor da variável temporária "id"
        And eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino o query parameter "id" como "${idGET}"
        And eu imprimo a rota completa
        And envio uma requisição GET
        And o status code deve ser 200
        And eu imprimo o body do response
        And eu salvo o valor do campo "data/0/id" do response na variável temporária "idGET"
        And eu imprimo o valor da variável temporária "idGET"
        And eu salvo o valor do campo "data/0/name" do response na variável temporária "nameGET"
        And eu imprimo o valor da variável temporária "nameGET"
        And eu salvo o valor do campo "data/0/email" do response na variável temporária "emailGET"
        And eu imprimo o valor da variável temporária "emailGET"
        Then o valor salvo na variável temporária "idGET" deve igual ao da variável temporária "idPUT"
        And o valor salvo na variável temporária "nameGET" deve igual ao da variável temporária "namePUT"
        And o valor salvo na variável temporária "emailGET" deve igual ao da variável temporária "emailPUT"

        Given eu defino o ambiente da API como "https://gorest.co.in"
        And eu uso a rota "/public-api/users/${idGET}"
        And eu defino o bearer token como 'Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba'
        And eu defino a variável temporária "resultado" com o valor null
        When envio uma requisição DELETE
        And eu imprimo o body do response
        And o status code deve ser 200
        And eu salvo o valor do campo "data" do response na variável temporária "dataDELETE"
        And eu imprimo o valor da variável temporária "dataDELETE"
        Then o valor salvo na variável temporária "resultado" deve igual ao da variável temporária "dataDELETE"
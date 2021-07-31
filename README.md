# javascript-cypress-cucumber

Esqueleto base para automação de testes frontend (Web UI) e backend (REST API) com Cypress, Nodejs, Cucumber e Allure Report.

# Pré-requisitos

- NPM versão 6.12.0 (pelo menos) instalado no computador (utilizado para executar os comandos)
- NodeJS versão v12.13.0 (pelo menos) instalado no computador (utilizado para interpretar o projeto feito em JavaScript)
- Google Chrome instalado no computador (utilizado para executar o Cypress)
- JAVA 8 (JDK 1.8.0) instalado no computador (utilizado para executar o Allure Report)
- Variáveis de ambiente do JAVA JDK 1.8.0 configuradas para o usuário no Path e para o sistema no JAVA_HOME (utilizado para executar o Allure Report)
- Outros pré-requisitos serão instalados durante a instalação do projeto

# Instalando o projeto

Siga os passos abaixo:

1. Clone o projeto em qualquer pasta de sua escolha
2. Abra o projeto em uma IDE (sugestão VSCode)
3. Execute o comando ```npm -i``` para instalar o projeto com os módulos

# Executando os testes

Para executar todos os testes, siga os passos abaixo:

1. Abra o terminal de sua preferência
2. Navegue até a pasta onde o projeto foi clonado e instalado
3. Execute o comando ```npm run execute:all:tests```

Observação: existem três feature files, sendo eles:

1. O arquivo ```1_GoREST.feature``` contém testes com a API **GoREST** com os métodos GET, POST, PUT e DELETE sendo utilizados (todos os testes passam)
2. O arquivo ```2_BackendExample.feature``` contém testes com a API **themoviedb** com o método GET sendo utilizado e com BDD scenario outline (todos os testes passam)
3. O arquivo ```3_Google.feature``` contém testes de UI utilizando a página inicial do Google (alguns testes falham e outros passam para gerar diferença no relatório Allure)

# Gerando o relatório Allure

Para gerar o relatório Allure, siga os passos abaixo:

1. Abra o terminal de sua preferência
2. Navegue até a pasta onde o projeto foi clonado e instalado
3. Execute o comando ```npm run generate:new:allure:report```

# Abrindo o relatório Allure

Para gerar o relatório Allure, siga os passos abaixo:

1. Abra o terminal de sua preferência
2. Navegue até a pasta onde o projeto foi clonado e instalado
3. Execute o comando ```npm run open:report```

# Informações adicionais

- Tanto os testes de UI quanto os de API utilizam BDD em Gherkin
- Os cenários de teste são independentes, seguindo boas práticas de teste, logo um cenário não depende da execução de outro
- Esse projeto utiliza a dependência ```@shelex/cypress-allure-plugin```
- Esse projeto utiliza a dependência ```cypress-cucumber-preprocessor```
- Todas as definições de execução podem ser alteradas no arquivo ```package.json``` na seção ```scripts```
- Todas as definições do cucumber podem ser alteradas no arquivo ```package.json``` na seção ```cypress-cucumber-preprocessor```
- Todas as definições de navegador e ambiente podem ser alteradas no arquivo ```cypress.json```
- Feature files devem ser criados dentro da pasta ```./cypress/integration```
- Page objects devem ser criados dentro da pasta ```./cypress/support/pageobjects```
- Web elements utilizados nos page objects devem ser criados dentro da pasta ```./cypress/support/elements```
- Passos com as funções dos feature files devem ser criados dentro da pasta ```./cypress/support/steps```
- Before e after hooks podem ser modificados no arquivo ```Hooks.js``` dentro da pasta ```./cypress/support/steps```

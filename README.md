# javascript-cypress-cucumber

Esqueleto base para automação frontend e backend com cypress, nodejs, cucumber e allure report.

# Pré-requisitos

- NPM versão 6.12.0 (pelo menos) instalado
- NodeJS versão v12.13.0 (pelo menos) instalado
- Google Chrome instalado
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

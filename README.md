# javascript-cypress-cucumber

Esqueleto base para automação frontend e backend com cypress, nodejs, cucumber e allure report.

# Pré-requisitos

- NPM versão 6.12.0 (pelo menos)
- NodeJS versão v12.13.0 (pelo menos)
- Outros pré-requisitos serão instalados durante a instalação do projeto

# Instalando o projeto

Siga os passos abaixo:

1. Clone o projeto em qualquer pasta de sua escolha
2. Abra o projeto em uma IDE (sugestão VSCode)
3. Execute o comando **_npm -i_** para instalar o projeto com os módulos

# Executando os testes

Para executar todos os testes, siga os passos abaixo:

1. Abra o terminal de sua preferência
2. Navegue até a pasta onde o projeto foi clonado e instalado
3. Execute o comando **_npm run execute:all:tests_**

# Gerando o relatório Allure

Para gerar o relatório Allure, siga os passos abaixo:

1. Abra o terminal de sua preferência
2. Navegue até a pasta onde o projeto foi clonado e instalado
3. Execute o comando **_npm run generate:new:allure:report_**

# Abrindo o relatório Allure

Para gerar o relatório Allure, siga os passos abaixo:

1. Abra o terminal de sua preferência
2. Navegue até a pasta onde o projeto foi clonado e instalado
3. Execute o comando **_npm run open:report_**

# Informações adicionais

- Esse projeto utiliza a dependência **_@shelex/cypress-allure-plugin_**
- Esse projeto utiliza a dependência **_cypress-cucumber-preprocessor_**
- Todas as definições de execução podem ser alteradas no arquivo **_package.json_** na seção **_scripts_**
- Todas as definições do cucumber podem ser alteradas no arquivo **_package.json_** na seção **_cypress-cucumber-preprocessor_**
- Todas as definições de navegador e ambiente podem ser alteradas no arquivo **_cypress.json_**
- Feature files devem ser criados dentro da pasta **_./cypress/integration_**
- Page objects devem ser criados dentro da pasta **_./cypress/support/pageobjects_**
- Web elements utilizados nos page objects devem ser criados dentro da pasta **_./cypress/support/elements**
- Passos com as funções dos feature files devem ser criados dentro da pasta **_./cypress/support/steps**
- Before e after hooks podem ser modificados no arquivo **_Hooks.js_** dentro da pasta **_./cypress/support/steps**

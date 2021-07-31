/// <reference types="Cypress" />

const { clearAllVariables } = require("./BackendSteps");

const {
    Before,
    After,
  } = require("cypress-cucumber-preprocessor/steps");

   
  // this will get called before each scenario
  
  Before(() => {
    clearAllVariables();
    cy.log("Todas as variáveis foram limpas antes de iniciar o cenário.");
  });

  After(() => {
    cy.screenshot();
    cy.log("Evidência registrada por screenshot depois de finalizar o cenário.");
  });
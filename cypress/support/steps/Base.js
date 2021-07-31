// Variáveis e funções globais para os testes

class globalContext {
    constructor() {
        this.response;
        this.urlAPI;
        this.jsonObject;
        this.fieldName = {};
        this.queryParams = {};
        this.headers = {};
        this.request;
        this.contentType;
        this.bearerToken;
        this.interScenarioVar = {};
    }
  }
  
  export default (new globalContext);
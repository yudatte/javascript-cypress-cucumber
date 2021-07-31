import globalContext from './Base'

Given("eu uso o ambiente de testes de API", () => {
    globalContext.urlAPI = `http://api.themoviedb.org`;
})

Given("eu defino o ambiente da API como {string}", (urlAPI) => {
    globalContext.urlAPI = null;
    globalContext.urlAPI = urlAPI;
})

And("eu defino o bearer token como {string}", (token) => {
    globalContext.bearerToken = token;
})

And("eu defino o header content type como {string}", (contentType) => {
    globalContext.contentType = contentType;
})

And("eu defino a variável temporária {string} com o valor {}", (tempVarName, fieldValue) => {
    if (fieldValue = 'null'){
        fieldValue = null;
    }
    globalContext.fieldName[tempVarName] = fieldValue;
})

Given("eu imprimo a rota completa", () => {
    cy.log("A rota completa utilizada é: " + JSON.stringify(globalContext.urlAPI))
    
})

And("eu uso a rota {string}", (route) => {

    // Caso a rota tenha uma variável, ela será substituída aqui
    if(route.includes("${"))
     {
        let variableInTheURL = route.split('{').pop().split('}')[0];
        let newRoute = route.replace(variableInTheURL,globalContext.fieldName[variableInTheURL]);
        newRoute = newRoute.replace("${","");
        newRoute = newRoute.replace("}","");

        globalContext.urlAPI = globalContext.urlAPI + newRoute;
     }else{
        globalContext.urlAPI = globalContext.urlAPI + route;
     }
})

And("eu defino o query parameter {string} como {string}", (key, value) => {
    
    
    // Caso o query parameter tenha uma variável, ela será substituída aqui
        if(value.includes("${"))
        {
            let variableInTheParam = value.split('{').pop().split('}')[0];
            let newValue = value.replace(variableInTheParam,globalContext.fieldName[variableInTheParam]);
            newValue = newValue.replace("${","");
            newValue = newValue.replace("}","");
   
            globalContext.queryParams[key] = newValue;
        }else{
            globalContext.queryParams[key] = value;
        }
   })

When("envio uma requisição GET", () => {
    globalContext.response = null;
    cy.request({
        method: 'GET',
        url: globalContext.urlAPI,
        qs: globalContext.queryParams,
        headers: {
            'Authorization': globalContext.bearerToken
        },
        failOnStatusCode: false
    }).then(res => {
        globalContext.response = res;
    })
})

And("eu defino o request payload como {string}", (request) => {
    globalContext.request = JSON.parse(JSON.stringify(request));
})

When("envio uma requisição POST", () => {
    globalContext.response = null;
    cy.request({
        method: 'POST',
        body: globalContext.request,
        url: globalContext.urlAPI,
        headers: {
            'Content-Type': globalContext.contentType,
            'Authorization': globalContext.bearerToken
        },
        qs: globalContext.queryParams,
        failOnStatusCode: false
    }).then(res => {
        globalContext.response = res;
    })
})

When("envio uma requisição PUT", () => {
    globalContext.response = null;
    cy.request({
        method: 'PUT',
        body: globalContext.request,
        url: globalContext.urlAPI,
        headers: {
            'Content-Type': globalContext.contentType,
            'Authorization': globalContext.bearerToken
        },
        qs: globalContext.queryParams,
        failOnStatusCode: false
    }).then(res => {
        globalContext.response = res;
    })
})

When("envio uma requisição DELETE", () => {
    globalContext.response = null;
    cy.request({
        method: 'DELETE',
        body: globalContext.request,
        url: globalContext.urlAPI,
        qs: globalContext.queryParams,
        headers: {
            'Content-Type': globalContext.contentType,
            'Authorization': globalContext.bearerToken
        },
        failOnStatusCode: false
    }).then(res => {
        globalContext.response = res;
    })
})

Then("o status code deve ser {}", (status) => {
    assert.equal(globalContext.response.status,status);
})

And("eu salvo o valor do campo {string} do response na variável temporária {string}", (path,tempVarName) => {
    let entrada = path;
    let entradas = entrada.split("/");
    let fieldValue = globalContext.response.body;
    for(let item of entradas){
        fieldValue = readObject(fieldValue,item);     
    }

    globalContext.fieldName[tempVarName] = fieldValue;
})

And("eu salvo o valor do campo {string} do response na variável temporária inter-cenário {string}", (path,tempVarName) => {
    //Não se recomenda misturar cenários. Portanto não é recomendada a utilização desse tipo de variável
    let entrada = path;
    let entradas = entrada.split("/");
    let fieldValue = globalContext.response.body;
    for(let item of entradas){
        fieldValue = readObject(fieldValue,item);     
    }

    globalContext.interScenarioVar[tempVarName] = fieldValue;
})

And("o valor salvo na variável temporária {string} deve ser {string}", (variableValue,expectedValue) => {
    assert.equal(globalContext.fieldName[variableValue],expectedValue);
})

And("o valor salvo na variável temporária {string} deve igual ao da variável temporária {string}", (variableValue1,variableValue2) => {
    assert.equal(globalContext.fieldName[variableValue1],globalContext.fieldName[variableValue2]);
})

And("eu imprimo a duração da requisição", () => {
    cy.log("A requisição levou "+ globalContext.response.duration + " ms");
})

And("eu imprimo o texto {string}", (texto) => {
    cy.log(texto);
})

And("eu imprimo o valor da variável temporária {string}", (tempVarName) => {
    cy.log("O valor da variável é "+ globalContext.fieldName[tempVarName] + ".");
})

And("eu imprimo o body do response", () =>{
    cy.log("O valor da do response JSON é "+ JSON.stringify(globalContext.response.body) + ".");
})

And("eu imprimo o body do request", () =>{
    cy.log("O valor da do request JSON é "+ JSON.stringify(globalContext.request) + ".");
})

And("eu limpo todas as variáveis temporárias", () =>{
    clearAllVariables ();
})

And("eu limpo todas as variáveis temporárias inter-cenário", () =>{
    interScenarioVar = null;
})

function readObject (obj,key) {
    let result = undefined;
    try{
        result = obj.get(String(key));
    }
        catch(e){}
    if(result === undefined){
        return obj[key];
    }
    
    return result;
}

Then("o valor do campo {string} do response JSON deve ser {string}", (jsonKey,jsonValue) => {
    let entrada = jsonKey;
    let entradas = entrada.split("/");
    let fieldValue = globalContext.response.body;

    for(let item of entradas){
        fieldValue = readObject(fieldValue,item);     
    }

    assert.equal(fieldValue,jsonValue);
})

export function clearAllVariables () {
    // Limpa todas as variáveis que serão usadas em cada teste. Essa função deve ser chamada dentro do hook before each.
    globalContext.response = null;
    globalContext.urlAPI = null;
    globalContext.jsonObject = null;
    globalContext.fieldName = {};
    globalContext.queryParams = {};
    globalContext.request = null;
    globalContext.contentType = null;
    globalContext.bearerToken = null;
}


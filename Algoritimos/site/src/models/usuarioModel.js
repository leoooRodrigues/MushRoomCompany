var database = require("../database/config")

function autenticar(cnpj, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", cnpj, senha)
    var instrucao = `
        SELECT id, razao_social, cnpj FROM empresa WHERE cnpj = '${cnpj}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha, empresaCNPJ, telefone) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
    INSERT INTO empresa (nome, cnpj, email, telefone, senha) VALUES ('${nome}', '${empresaCNPJ}', '${email}', '${telefone}', '${senha}');`; 
    
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// prototipo da integração dos dados da dashboard para o banco 

function dashboard(){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var valorDash = `
    INSERT INTO registros (idRegistros,fkEmpresa,fkSetor) VALUES ( '${idResgistros}', '${fkEmpresa}', '${fksetor}');`; 
    
    console.log("Executando a instrução SQL: \n" + valorDash);
    return database.executar(valorDash);
}

module.exports = {
    autenticar,
    cadastrar,

};
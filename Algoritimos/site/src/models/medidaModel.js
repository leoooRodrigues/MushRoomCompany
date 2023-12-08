var database = require("../database/config");

function buscarUltimasMedidas(sector, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        momento,
                        FORMAT(momento, 'HH:mm:ss') as momento_grafico
                    from medida
                    where fk_aquario = ${sector}
                    order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        DadosUmi as umidade,
        DadosTemp as temperatura, 
                     dataHora,
                      DATE_FORMAT(dataHora,'%H:%i') as momento_grafico
                    from registros
                    where fkEmpresa = 1
                    order by idRegistros desc limit ${limite_linhas};`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidasDouUmi(sector) {

    instrucaoSql = `select 
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros) FROM registros)
				order by DadosUmi desc)) as hora1,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -1) FROM registros)
				order by DadosUmi desc))as hora2,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -2) FROM registros)
				order by DadosUmi desc))as hora3,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -3) FROM registros)
				order by DadosUmi desc))as hora4,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -4) FROM registros)
				order by DadosUmi desc))as hora5,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -5) FROM registros)
				order by DadosUmi desc))as hora6,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -6) FROM registros)
				order by DadosUmi desc))as hora7,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -7) FROM registros)
				order by DadosUmi desc))as hora8,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -8) FROM registros)
				order by DadosUmi desc))as hora9,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -9) FROM registros)
				order by DadosUmi desc))as hora10,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -10) FROM registros)
				order by DadosUmi desc))as hora12,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -11) FROM registros)
				order by DadosUmi desc))as hora13,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -12) FROM registros)
				order by DadosUmi desc))as hora14,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -13) FROM registros)
				order by DadosUmi desc))as hora15,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -14) FROM registros)
				order by DadosUmi desc))as hora16,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -15) FROM registros)
				order by DadosUmi desc))as hora17,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -16) FROM registros)
				order by DadosUmi desc))as hora18,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -17) FROM registros)
				order by DadosUmi desc))as hora19,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -18) FROM registros)
				order by DadosUmi desc))as hora20,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -19) FROM registros)
				order by DadosUmi desc))as hora21,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -20) FROM registros)
				order by DadosUmi desc))as hora22,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -21) FROM registros)
				order by DadosUmi desc))as hora23,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros - 22) FROM registros)
				order by DadosUmi desc))as hora24
from registros where fkEmpresa = 1 limit ${sector};`

    

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}





function buscarUltimasMedidasDouTemp(sector) {

    instrucaoSql = `select 
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros) FROM registros)
				order by DadosTemp desc)) as hora1,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -1) FROM registros)
				order by DadosTemp desc))as hora2,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -2) FROM registros)
				order by DadosTemp desc))as hora3,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -3) FROM registros)
				order by DadosTemp desc))as hora4,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -4) FROM registros)
				order by DadosTemp desc))as hora5,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -5) FROM registros)
				order by DadosTemp desc))as hora6,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -6) FROM registros)
				order by DadosTemp desc))as hora7,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -7) FROM registros)
				order by DadosTemp desc))as hora8,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -8) FROM registros)
				order by DadosTemp desc))as hora9,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -9) FROM registros)
				order by DadosTemp desc))as hora10,
    (select DadosTemp from registros where 
        idRegistros = ( SELECT idRegistros FROM registros 
            WHERE idRegistros=(SELECT max(idRegistros -9) FROM registros)
                order by DadosTemp desc))as hora11,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -10) FROM registros)
				order by DadosTemp desc))as hora12,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -11) FROM registros)
				order by DadosTemp desc))as hora13,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -12) FROM registros)
				order by DadosTemp desc))as hora14,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -13) FROM registros)
				order by DadosTemp desc))as hora15,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -14) FROM registros)
				order by DadosTemp desc))as hora16,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -15) FROM registros)
				order by DadosTemp desc))as hora17,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -16) FROM registros)
				order by DadosTemp desc))as hora18,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -17) FROM registros)
				order by DadosTemp desc))as hora19,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -18) FROM registros)
				order by DadosTemp desc))as hora20,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -19) FROM registros)
				order by DadosTemp desc))as hora21,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -20) FROM registros)
				order by DadosTemp desc))as hora22,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -21) FROM registros)
				order by DadosTemp desc))as hora23,
	(select DadosTemp from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros - 22) FROM registros)
				order by DadosTemp desc))as hora24
from registros where fkEmpresa = ${sector} limit 1;`

    console.log("Executando a instrução SQL popopopo: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}




// DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
function buscarMedidasEmTempoReal(sector) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, momento, 108) as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${sector} 
                    order by id desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        DadosUmi as umidade,
        DadosTemp as temperatura, 
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                        fkEmpresa 
                        from registros where fkEmpresa = 1 
                    order by idRegistros desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarUltimasMedidasDouUmi,
    buscarUltimasMedidasDouTemp
}

var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 10;

    var sector = req.params.sector;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas(sector, limite_linhas).then(function (resultado) {
        console.log(resultado);
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUltimasMedidasDouUmi(req, res) {


    var sector = req.params.sector;
    
    console.log(`Recuperando as ultimas 24 Horas medidas`);
    
    console.log(sector + 'asdkgasd haçsdhçasjd alçsdaçksj');
    medidaModel.buscarUltimasMedidasDouUmi(sector).then(function (resultado) {
        console.log('lajsdasnd asdn iaidiasdoasi');
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUltimasMedidasDouTemp(req, res) {


    var sector = req.params.sector;

    console.log(`Recuperando as ultimas 24 Horas medidas Temp`);

    medidaModel.buscarUltimasMedidasDouTemp(sector).then(function (resultado) {
        if (resultado.length > 0) {
            console.log("asjdnasjdnas teste2"+resultado)
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMedidasEmTempoReal(req, res) {

    var sector = req.params.sector;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(sector).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarUltimasMedidasDouUmi,
    buscarUltimasMedidasDouTemp

}
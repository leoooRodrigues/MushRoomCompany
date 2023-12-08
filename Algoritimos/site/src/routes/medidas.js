var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:sector", function (req, res) {
    // console.log('Aqquiiiiii');
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/ultimasDouUmi/:sector", function (req, res) {
    // console.log('requisito');
    medidaController.buscarUltimasMedidasDouUmi(req, res);
});

router.get("/ultimasDouTemp/:sector", function (req, res) {
    medidaController.buscarUltimasMedidasDouTemp(req, res);
});

router.get("/tempo-real/:sector", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;
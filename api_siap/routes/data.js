var express = require('express');
var router = express.Router();
var config = require('./../Configs');
router.get('/', function (req, res){
    res.send("Astagfirullah")
})

router.post('/', function(req, res){
    res.send("ANJAAAY");
});

module.exports = router;
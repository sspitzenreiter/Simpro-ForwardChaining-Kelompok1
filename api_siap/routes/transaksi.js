var express = require('express');
var router = express.Router();

router.get('/', function(req, res){
    var data = req.query;
    res.send(data);
});

router.post('/', function(req, res){
    res.send("TRANSAKSI MANTAP ANJAY .. MANTAP ");
});

module.exports=router;
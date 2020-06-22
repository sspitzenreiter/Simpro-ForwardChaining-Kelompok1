var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send('ASTAGFIRULLAH');
});

router.post('/', function(req, res, next) {
  res.send('ASTAGFIRULLAH');
});

router.get('/cek', function(req, res, next) {
  res.send('ASTAGFIRULLAH');
});



module.exports = router;

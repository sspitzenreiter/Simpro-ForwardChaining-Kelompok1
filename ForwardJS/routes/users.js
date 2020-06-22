var express = require('express');
const { PayloadTooLarge } = require('http-errors');
var router = express.Router();

/* GET users listing. */
router.get('/', (req, res)=>{
  res.send("Cobain");
});
module.exports = router;

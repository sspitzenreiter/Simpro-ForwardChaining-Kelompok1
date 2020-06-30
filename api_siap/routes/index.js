var express = require('express');
var router = express.Router();

/* GET home page. */
var mysql = require('mysql');
var connection = mysql.createConnection({
  host:'localhost',
  user:'root',
  password:'',
  database:'siap_db'
})

router.use('/',(req,res,next)=>{
  res.header("Access-Control-Allow-Origin","'");
  res.header('Access-Control-Allow-Origin','GET,POST');
  res.header("Access-Control-Allow-Origin","Origin,Authorization,X-Requested-With,Content-Type,Accept");
  next();
})

router.get("/nilai", (req, res)=>{
  connection.query("SELECT matakuliah.nama_matkul,nilai.nilai from nilai inner join matakuliah on matakuliah.id_matkul = nilai.id_matkul WHERE npm = '"+req.query.npm+"'",(err,rows,fields)=>{
    if(err){
      console.log(err);
      res.send({
        status:0,
        message:"Data error"
      })
    }else{
      res.send({
        status:1,
        message:"Berhasil mengambil data",
        data:rows
      })
    }
  });
})


module.exports = router;

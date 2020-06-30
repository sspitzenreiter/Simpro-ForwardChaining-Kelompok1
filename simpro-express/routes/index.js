var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var axios = require('axios');
var connection = mysql.createConnection({
  host:'localhost',
  user:'root',
  password:'',
  database:'simpro'
})
/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
router.use('/', (req, res, next)=>{
  res.header("Access-Control-Allow-Origin", "*");
  res.header('Access-Control-Allow-Methods', 'GET,POST');
  res.header("Access-Control-Allow-Headers", "Origin, Authorization,X-Requested-With, Content-Type, Accept");
  next();
})
router.post('/cek-rekomendasi', (req, res)=>{
  // res.send(req.body);
  connection.query('select avg(nilai_bimbingan) as nilai_bimbingan, count(*) as total_bimbingan, avg(total_revisi) as total_revisi, id_proyek from v_bimbingan where id_proyek = "'+req.body.id_proyek+'" group by id_proyek', (err, rows, fields)=>{
    if(err){
      console.log(err);
      res.send({
        status:0,
        message:"Error pada server"
      })
    }else{
      axios.post("http://localhost:3002/checkRule", {
        nilai_bimbingan:rows[0].nilai_bimbingan, 
        nilai_sidang:(parseInt(req.body.nilaiSidangPenguji)+parseInt(req.body.nilaiSidangPembimbing))/2,
        total_revisi:rows[0].total_revisi,
        total_bimbingan:rows[0].total_bimbingan,
        max_bimbingan:12,
        min_bimbingan:8}).then((result)=>{
        res.send(result.data);
      });
      // res.send({
      //   status:1,
      //   message:"Berhasil mengambil data",
      //   data:rows
      // })
    
    }
  });
})
router.get('/data', (req, res)=>{
  connection.query("select proyek.id_proyek, proyek.judul_proyek, (select nama from mahasiswa where npm = proyek.npm_ketua) as nama_ketua, (select nama from mahasiswa where npm = proyek.npm_anggota) as nama_anggota, proyek.npm_ketua, proyek.npm_anggota from proyek", (err, rows, fields)=>{
    if(err){
      console.log(err);
      res.send({
        status:0,
        message:"Error pada server"
      })
    }else{
      res.send({
        status:1,
        message:"Berhasil mengambil data",
        data:rows
      })
    }
  });
});

module.exports = router;

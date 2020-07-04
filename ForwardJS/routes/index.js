var express = require('express');
var router = express.Router();
var RuleEngine = require('node-rules');
var async = require('async');
var axios = require('axios');
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
// var max_bimbingan = 12;

var rule_nilai_bimbingan_rata = [{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan > 85);
  },
  "consequence":function(R){
    this.stat_bimbingan=4;
    R.next();
  }
},{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan > 70 && this.nilai_bimbingan <= 85);
  },
  "consequence":function(R){
    this.stat_bimbingan=3;
    R.next();
  }
},{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan > 55 && this.nilai_bimbingan <= 70);
  },
  "consequence":function(R){
    this.stat_bimbingan=2;
    R.next();
  }
},{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan > 30 && this.nilai_bimbingan <= 55);
  },
  "consequence":function(R){
    this.stat_bimbingan=1;
    R.next();
  }
},{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan <= 30);
  },
  "consequence":function(R){
    this.stat_bimbingan=0;
    R.next();
  }
}];
var rule_nilai_sidang_rata = [{
  "name":"nilai_sidang",
  "condition":function(R){
    R.when(this.nilai_sidang > 85);
  },
  "consequence":function(R){
    this.stat_sidang=4;
    R.next();
  }
},{
  "name":"nilai_sidang",
  "condition":function(R){
    R.when(this.nilai_sidang > 70 && this.nilai_sidang <= 85);
  },
  "consequence":function(R){
    this.stat_sidang=3;
    R.next();
  }
},{
  "name":"nilai_sidang",
  "condition":function(R){
    R.when(this.nilai_sidang > 55 && this.nilai_sidang <=70);
  },
  "consequence":function(R){
    this.stat_sidang=2;
    R.next();
  }
},{
  "name":"nilai_sidang",
  "condition":function(R){
    R.when(this.nilai_sidang > 30 && this.nilai_sidang <= 55);
  },
  "consequence":function(R){
    this.stat_sidang=1;
    R.next();
  }
},{
  "name":"nilai_sidang",
  "condition":function(R){
    R.when(this.nilai_sidang <= 30);
  },
  "consequence":function(R){
    this.stat_sidang=0;
    R.next();
  }
}];
var rule_total_bimbingan_rata = [{
  "name":"total_bimbingan",
  "condition":function(R){
    var presentase_total = this.total_bimbingan/this.max_bimbingan;
    R.when(this.total_bimbingan>this.min_bimbingan && presentase_total<1);
  },
  "consequence":function(R){
    this.stat_total_bimbingan=0.5;
    R.next();
  }
},{
  "name":"total_bimbingan",
  "condition":function(R){
    var presentase_total = this.total_bimbingan/this.max_bimbingan;
    R.when(presentase_total==1);
  },
  "consequence":function(R){
    this.stat_total_bimbingan=1;
    R.next();
  }
}];
var rule_nilai_siap = [
  {
    "name":"nilai_siap",
    "condition":function(R){
      R.when(this.nilai_siap<=85 && this.nilai_siap>75);
    },
    "consequence":function(R){
      this.stat_siap=0.5;
      R.next();
    }
  },
  {
    "name":"nilai_siap",
    "condition":function(R){
      R.when(this.nilai_siap>85);
    },
    "consequence":function(R){
      this.stat_siap=1;
      R.next();
    }
  },
]
var lulus = [
  {
    "name":"lulus",
    "condition":function(R){
      var stat = this.stat_sidang+this.stat_bimbingan;
      R.when(stat>=6);
    },"consequence":function(R){
      this.status_lulus="1";
      R.stop();
    }
  },{
    "name":"lulus_bersyarat",
    "condition":function(R){
      var stat = this.stat_sidang+this.stat_bimbingan+this.stat_total_bimbingan+this.stat_siap;
      R.when(stat>=7);
    },"consequence":function(R){
      this.status_lulus="0";
      R.stop();
    }
  }
];
router.post('/checkRule', (req, res)=>{
  var rules = [...rule_nilai_bimbingan_rata,...rule_nilai_sidang_rata,...rule_total_bimbingan_rata, ...rule_nilai_siap,...lulus];
  var R = new RuleEngine();
  R.register(rules);
  async.waterfall([
    callback=>{
      axios.get('http://localhost:4200/nilai?npm='+req.body.npm).then((result)=>{
        callback(null, result.data.data);
      });
    },(nilai,callback)=>{
      var rata_rata = 0;
      nilai.map(x=>{
        rata_rata+=x.nilai;
      });
      var fact = {
        "nilai_bimbingan":parseInt(req.body.nilai_bimbingan),
        "nilai_sidang":parseInt(req.body.nilai_sidang),
        "total_revisi":parseInt(req.body.total_revisi),
        "total_bimbingan":parseInt(req.body.total_bimbingan),
        "max_bimbingan":parseInt(req.body.max_bimbingan),
        "min_bimbingan":parseInt(req.body.min_bimbingan),
        "nilai_siap":rata_rata/nilai.length,
        "info_siap":nilai,
        "keterangan":"",
        "status_lulus":"-1"
      }
      R.execute(fact, function(data){
        res.send({
          status:1,
          message:"Sukses",
          data:data
        });
      })
    }
  ])
  
})

module.exports = router;

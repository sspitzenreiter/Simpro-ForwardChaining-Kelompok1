var express = require('express');
var router = express.Router();
var RuleEngine = require('node-rules');


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
var max_bimbingan = 12;
var bimbingan_minimal = 0.75;
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
    R.when(this.nilai_bimbingan > 60 && this.nilai_bimbingan <= 85);
  },
  "consequence":function(R){
    this.stat_bimbingan=3;
    R.next();
  }
},{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan > 45 && this.nilai_bimbingan <= 60);
  },
  "consequence":function(R){
    this.stat_bimbingan=2;
    R.next();
  }
},{
  "name":"nilai_bimbingan",
  "condition":function(R){
    R.when(this.nilai_bimbingan > 30 && this.nilai_bimbingan <= 45);
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
    R.when(this.nilai_sidang > 60 && this.nilai_sidang <= 85);
  },
  "consequence":function(R){
    this.stat_sidang=3;
    R.next();
  }
},{
  "name":"nilai_sidang",
  "condition":function(R){
    R.when(this.nilai_sidang > 55 && this.nilai_sidang <= 60);
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
  "name":"nilai_sidang",
  "condition":function(R){
    var presentase_total = this.total_bimbingan/max_bimbingan;
    R.when(presentase_total>bimbingan_minimal && presentase_total<1);
  },
  "consequence":function(R){
    this.stat_total_bimbingan=0.5;
    R.next();
  }
},{
  "name":"nilai_sidang",
  "condition":function(R){
    var presentase_total = this.total_bimbingan/max_bimbingan;
    R.when(presentase_total==1 && this.nilai_bimbingan>=95);
    R.when(presentase_total==1 && this.nilai_bimbingan>=85 && this.total_revisi<=2)
  },
  "consequence":function(R){
    this.stat_total_bimbingan=1;
    R.next();
  }
}];
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
      var stat = this.stat_sidang+this.stat_bimbingan;
      R.when(stat>=6);
    },"consequence":function(R){
      this.status_lulus="0";
      R.stop();
    }
  }
];
router.get('/checkRule', (req, res)=>{
  var rules = [...rule_nilai_bimbingan_rata,...rule_nilai_sidang_rata,...rule_total_bimbingan_rata, ...lulus];
  var R = new RuleEngine();
  R.register(rules);
  var fact = {
    "nilai_bimbingan":70,
    "nilai_sidang":70,
    "total_revisi":4,
    "total_bimbingan":10,
    "keterangan":""
  }
  R.execute(fact, function(data){
    res.send(data);
  })
})

module.exports = router;

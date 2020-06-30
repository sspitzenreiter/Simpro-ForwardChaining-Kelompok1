<template>
  <el-container>
    <el-main>
      <data-tables-server :data="data_shown" :action-col="action_col" :total="total" @query-change="loadData" :pagination-props="{ pageSizes: [5, 10, 15] }">
        <el-table-column v-for="title in titles" :prop="title.props" :key="title.label" :label="title.label">
        </el-table-column>
      </data-tables-server>
    </el-main>
    <el-dialog
        title="Tips"
        :visible.sync="dialogVisible"
        width="30%"
      >
        <el-form ref="form" :model="form">
          <el-form-item label="Mahasiswa">
            <el-select  v-model="selectedNPM" @change="selectChangeListener">
              <el-option v-for="list in listNPM" :label="list" :value="list" :key="list"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Nilai Sidang Penguji">
            <el-input v-model="nilaiSidangPenguji"></el-input>
          </el-form-item>
          <el-form-item label="Nilai Sidang Pembimbing">
            <el-input v-model="nilaiSidangPembimbing"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="cekRekomendasi" type="primary">Cek Nilai</el-button>
          <el-button @click="dialogVisible=false">Cancel</el-button>
        </span>
    </el-dialog>
  </el-container>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data(){
    return{
      dialogVisible:false,
      nilaiSidangPenguji:0,
      nilaiSidangPembimbing:0,
      action_col:{
        label:"Aksi",
        props:{
          align:"center"
        },
        buttons:[
          {
            props:{
              type:"primary",
              icon:"el-icon-edit"
            },
            handler:row=>{
              this.dialogVisible = true;
              this.listNPM = [];
              this.listNPM.push(row.npm_ketua);
              this.listNPM.push(row.npm_anggota);
              this.selectedNPM = row.npm_ketua;
              this.selectedIDPROYEK = row.id_proyek;
            },
            label:'Cek Nilai'
          }
        ]
      },
      listNPM:[],
      selectedNPM:'',
      selectedIDPROYEK:'',
      data_shown:[],
      total:44,
      titles:[
        {props:"judul_proyek", label:"Judul Proyek"},
        {props:"nama_ketua", label:"Nama Ketua"},
        {props:"nama_anggota", label:"Nama Anggota"}
      ]
    }
  },
  methods:{
    selectChangeListener(){
      this.nilaiSidangPenguji = 0;
      this.nilaiSidangPembimbing = 0;
    },
    cekRekomendasi(){
      var status = "ketua";
      if(this.listNPM[1]==this.selectedNPM){
        status = "anggota";
      }
      this.axios.post('http://localhost:3000/cek-rekomendasi', {
        npm:this.selectedNPM, 
        nilaiSidangPenguji:this.nilaiSidangPenguji, 
        nilaiSidangPembimbing:this.nilaiSidangPembimbing,
        status:status,
        id_proyek:this.selectedIDPROYEK
        }).then((res)=>{
        console.log(res.data);
      });
    },
    async loadData(queryInfo){
      // console.log(JSON.stringify(queryInfo));
      this.axios.get('http://localhost:3000/data').then((res)=>{
        // console.log(res.data);
        // this.data = res.data.data;
        this.nilaiSidangPenguji = 0;
        this.nilaiSidangPembimbing = 0;
        this.total = res.data.data.length;
        this.data_shown = res.data.data.slice((queryInfo.page-1)*queryInfo.pageSize,queryInfo.page*queryInfo.pageSize);
      });
      
      // console.log(queryInfo.page*queryInfo.pageSize);
      // console.log(this.data_shown);
    }
  },
  mounted(){
    this.axios.get('http://localhost:3000/data').then((res)=>{
      // console.log(res.data);
      this.data = res.data.data;
      this.total = res.data.data.length;
      this.data_shown = this.data.splice(0, 5);
    });
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>

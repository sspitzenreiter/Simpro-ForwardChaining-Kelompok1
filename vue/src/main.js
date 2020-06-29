import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'
import 'element-ui/lib/theme-chalk/index.css'
import VueDataTables from 'vue-data-tables'
import axios from 'axios';
Vue.config.productionTip = false
Vue.prototype.axios = axios;
Vue.use(VueDataTables)
Vue.use(ElementUI, { locale })
new Vue({
  render: h => h(App),
}).$mount('#app')

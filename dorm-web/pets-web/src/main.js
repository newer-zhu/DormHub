import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './assets/css/reset.css'
import './assets/css/border.css'
import Vant from 'vant';
import 'vant/lib/index.css';


Vue.config.productionTip = false

//解决移动端点击300ms延迟问题
// import fastClick from 'fastclick'
// fastClick.attach(document.body)
Vue.use(Vant);

// 该指令的作用是dom渲染后触发，因为非vue的插件有的是dom必须存在的情况下才可以执行
Vue.directive('loaded-callback', {
  inserted: function (el, binding, vnode) {
    binding.value(el, binding, vnode)
  }
})

//用户已登录且未连接websocket
// if (store.state.user.token && store.state.chat.stomp == null){
//   console.log('connect websocket ---- main.js');
//   store.dispatch('chat/connect')
// }

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

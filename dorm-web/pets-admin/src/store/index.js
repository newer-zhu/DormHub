import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import app from './modules/app'
import settings from './modules/settings'
import user from './modules/user'
import chat from '@/store/modules/chat'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    settings,
    user,
    chat
  },
  getters
})
store.watch(function (state) {
  return state.sessions
}, function (val) {
  console.log('CHANGE: ', val);
  localStorage.setItem('vue-chat-session', JSON.stringify(val));
}, {
  deep: true/*这个貌似是开启watch监测的判断,官方说明也比较模糊*/
});
export default store

import Vue from 'vue'
import Vuex from 'vuex'
import user from "./modules/user";
import chat from "./modules/chat";
import post from "./modules/post";
import getters from "./getters";
Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    user,
    chat,
    post
  },
  getters
})

store.watch(function (state) {
  return state.chat.sessions
}, function (val) {
  console.log('CHANGE: ', val);
  localStorage.setItem('vue-chat-session', JSON.stringify(val));
}, {
  deep: true/*这个貌似是开启watch监测的判断,官方说明也比较模糊*/
});

export default store

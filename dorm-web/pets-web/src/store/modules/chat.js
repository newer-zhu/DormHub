import Stomp from 'stompjs'
import SockJS from 'sockjs-client'
import Toast from "vant";
import Vue from "vue";
import {getUsers} from "../../api/chat";
const chat = {
  namespaced: true,
  state: {
    sessions: [],
    currentAdmin: JSON.parse(window.localStorage.getItem('user')),
    admins: [],//聊天对象数组
    currentSession: null,
    sockJs: null,
    stomp: null,
    isDot: {}
  },
  mutations:{
    changeCurrentSession(state, currentSession) {
      state.currentSession = currentSession;
      // Vue.set(state.isDot, state.currentAdmin.username+'#'+state.currentSession.username.to, false);
    },
    //发送消息
    addMessage(state, msg) {
      let mss = state.sessions[state.currentAdmin.username + '#' + msg.to];
      if (!mss) {
        Vue.set(state.sessions, state.currentAdmin.username + '#' + msg.to, []);
      }
      console.log(state.sessions[state.currentAdmin.username + '#' + msg.to]);
      state.sessions[state.currentAdmin.username + '#' + msg.to].push({
        content: msg.content,
        date: msg.date,
        self: msg.self
      })
    },
    //获取本地聊天记录
    INIT_DATA(state) {
      // 浏览器本地的历史聊天记录可以在这里完成
      let data = localStorage.getItem('vue-chat-session');
      if (data) {
        state.sessions = JSON.parse(data);
      }
    },
    //初始化聊天用户
    INIT_ADMIN(state, data) {
      state.admins = data;
    }
  },
  actions: {
    //连接websocket
    connect(context) {
      const { commit, dispatch, state, rootState, rootGetters } = context
      state.sockJs = new SockJS('/ws/pets')
      state.stomp = Stomp.over(state.sockJs);
      let token = window.localStorage.getItem("token");
      state.stomp.connect({'Auth-Token': token}, success => {
        //点对点消息默认前缀/user
        state.stomp.subscribe('/user/message/chat', msg => {
          let receiveMsg = JSON.parse(msg.body);
          if (!state.currentSession || receiveMsg.from != state.currentSession.username){
            // Toast.success({
            //   message: '[' + receiveMsg.fromNickName + ']发来一条消息',
            // })
            // Vue.set(state.isDot, state.currentAdmin.username+'#'+receiveMsg.to, []);
          }
          receiveMsg.self = false;
          // 为了在sessions中能正确存储
          receiveMsg.to = receiveMsg.from;
          commit('addMessage', receiveMsg);
        })
      }, error => {
        console.log("websocket connect error")
      })
    },
    //发送消息
    sendMessage({ commit, state}, msgObj){
      state.stomp.send('/sendMsg', {}, JSON.stringify(msgObj));
      commit('addMessage',msgObj);
    },
    initData(context) {
      getUsers().then(res=>{
        if (res.data){
          context.commit('INIT_ADMIN', res.data);
        }
      })
    }
  }
}


export default chat

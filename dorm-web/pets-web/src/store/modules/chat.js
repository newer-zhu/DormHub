import Stomp from 'stompjs'
import SockJS from 'sockjs-client'
import { Notify } from 'vant';
import Vue from "vue";
import {getUsers} from "../../api/chat";
import store from "../index";

const chat = {
  namespaced: true,
  state: {
    sessions: [],//会话，是一个map，储存聊天信息
    currentAdmin: JSON.parse(window.localStorage.getItem('user')),//当前用户
    admins: [],//聊天对象
    currentSession: null,//当前聊天对象
    sockJs: null,
    stomp: null,
    isDot: {}
  },
  mutations:{
    //改变当前聊天会话session
    changeCurrentSession(state, currentSession) {
      state.currentSession = currentSession;
      // Vue.set(state.isDot, state.currentAdmin.username+'#'+state.currentSession.username.to, false);
    },
    //添加消息进会话session
    addMessage(state, msg) {
      //会话key的定义
      const sessionKey = state.currentAdmin.username + '#' + msg.to;
      //找到该会话，如果会话从未创建就初始化，然后把message push进去
      let mss = state.sessions[sessionKey];
      if (!mss) {
        Vue.set(state.sessions, sessionKey, []);
      }
      state.sessions[sessionKey].push({
        content: msg.content,
        date: new Date(),
        self: !msg.notSelf//是否是自己发的消息
      })
      console.log(state.sessions)
    },
    //获取本地聊天记录

    //初始化所有聊天用户
    INIT_ADMIN(state, data) {
      state.admins = data;
    }
  },
  actions: {
    //连接websocket
    connect(context) {
      context.dispatch('initChatUsers')//初始化所有用户
      const { state } = context
      let socket = new SockJS('/ws/pets')
      state.stomp = Stomp.over(socket);
      const token = store.state.user.token;
      state.stomp.connect({'Auth-Token': token}, success => {
        //订阅聊天消息,注意加上默认前缀/user，这点在后端代码已经指出
        state.stomp.subscribe('/user/message/chat', msg => {
          let receiveMsg = JSON.parse(msg.body);
          //当前不在消息页面或者正在和另一个人聊天，消息提示
          if (!state.currentSession || receiveMsg.from != state.currentSession.username){
            Notify({type: 'primary',message: receiveMsg.fromNickName+'发来了信息'})
          }
          //接收到的消息设为不是自己发的
          receiveMsg.notSelf = true;
          receiveMsg.to = receiveMsg.from;
          context.commit('addMessage', receiveMsg);
        })
        //订阅在线用户
        // state.stomp.subscribe('/broadcast/onlineUsers', msg => {
        //   context.commit('SET_OnlineUsers', msg.body);
        // });
        //只执行一次
        // state.stomp.subscribe('/welcome', msg => {
        //   context.commit('SET_OnlineUsers', msg.body);
        // });
      }, error => {
      })

      //监听窗口关闭
      window.onbeforeunload = function (event) {
        socket.close()
      }
    },

    //发送消息
    sendMessage({ commit, state}, msgObj){
      state.stomp.send('/sendMsg', {}, JSON.stringify(msgObj));
      commit('addMessage',msgObj);
    },
    //初始化所有聊天用户
    initChatUsers(context) {
      getUsers().then(res=>{
        if (res.data){
          context.commit('INIT_ADMIN', res.data.users);
        }
      })
    }
  }
}


export default chat

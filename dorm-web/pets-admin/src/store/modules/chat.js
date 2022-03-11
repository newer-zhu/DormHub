import { getAllUsers } from '@/api/chat'
import { getToken, getUserInfo } from '@/utils/auth'
import Stomp from 'stompjs'
import SockJS from 'sockjs-client'
import { Notification } from 'element-ui'
import Vue from 'vue'

const state = {
    sessions: [],//所有会话记录
    currentAdmin: getUserInfo(),
    userInfo: getUserInfo(),
    chatUsers: [],//可聊天对象列表
    currentSession: null,//当前聊天对象
    onlineUserNum: '',//在线人数
    onlineUserMap: {},//在线用户map
    stomp: null,
    isDot: {}
}

export const getChatState = () => {return this.state}

const mutations = {
  RESET_STATE: (state) => {
    // Object.assign(state, getChatState())
    state = {}
  },
  SET_USERS(state, data) {
    state.chatUsers = data.users;

    state.onlineUserMap = data.onlineUsers
    console.log(data)
    state.onlineUserNum = state.onlineUserMap['size']
  },
  addMessage(state, msg) {
    const sessionKey = state.currentAdmin.username + '#' + msg.to
    let mss = state.sessions[sessionKey];
    if (!mss) {
      Vue.set(state.sessions, sessionKey, []);
    }
    state.sessions[sessionKey].push({
      content: msg.content,
      date: new Date(),
      self: !msg.notSelf
    })
    console.log(state.sessions)
  },
  //切换正在聊天的用户
  changeCurrentSession(state, currentSession) {
    state.currentSession = currentSession;
    Vue.set(state.isDot, currentSession.username+'#'+state.currentAdmin.username, false);
  },
  //参数是userMap
  SET_OnlineUsers(state, users){
    state.onlineUserMap = JSON.parse(users)
    state.onlineUserNum = state.onlineUserMap['size']
  },
}

const actions = {
  // connect websocket
  connect(context) {
    const { state } = context
    let socket = new SockJS('/ws/pets')
    state.stomp = Stomp.over(socket);
    const token = getToken();
    state.stomp.connect({'Auth-Token': token}, success => {
      //订阅聊天消息
      state.stomp.subscribe('/user/message/chat', msg => {
        let receiveMsg = JSON.parse(msg.body);
        //当前不在消息页面或者正在和另一个人聊天，消息提示
        if (!state.currentSession || receiveMsg.from != state.currentSession.username){
          Notification.info({
            title: '[' + receiveMsg.fromNickName + ']发来一条消息',
            message: receiveMsg.length > 10? receiveMsg.content.substr(0, 10) : receiveMsg.content,
            position: 'bottom-right'
          })
          Vue.set(state.isDot, receiveMsg.from+'#'+receiveMsg.to, true);
          // console.log(state.isDot)
        }
        receiveMsg.notSelf = true;
        receiveMsg.to = receiveMsg.from;
        context.commit('addMessage', receiveMsg);
      })
      //订阅在线用户
      state.stomp.subscribe('/broadcast/onlineUsers', msg => {
        context.commit('SET_OnlineUsers', msg.body);
      });
      //只执行一次
      state.stomp.subscribe('/welcome', msg => {
        context.commit('SET_OnlineUsers', msg.body);
      });
    }, error => {
    })

    //监听窗口关闭
    window.onbeforeunload = function (event) {
      socket.close()
    }
  },

  //init users
  initChatUsers(context) {
    getAllUsers().then(res => {
      if (res.data){
        context.commit('SET_USERS', res.data);
      }
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

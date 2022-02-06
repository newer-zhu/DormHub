import {login, register} from '@/api/login'
import {Toast} from "vant";

const user = {
  namespaced: true,
  state: {
      token: localStorage.getItem('token'),
      userInfo: JSON.parse(window.localStorage.getItem('user')),
      // dormInfo: JSON.parse(window.localStorage.getItem('dorm'))
  },
  mutations: {
    SET_TOKEN(state, token){
      state.token = token
    },
    SET_USERINFO(state, userInfo){
      state.userInfo = userInfo
    },
    SET_DORM_INFO(state, dormInfo){
      state.userInfo.dorm = dormInfo
      if (dormInfo){
        state.userInfo.dormId = dormInfo.id
      }else {
        state.userInfo.dormId = -1
      }
    },
    CLEAR(state){
      state.token = ''
      state.userInfo = JSON.parse(window.localStorage.getItem('user'))
    }
  },
  actions: {
    //登录逻辑
    userLogin(context, user){
      const { commit , dispatch } = context
      const username = user.username.trim()
      return new Promise((resolve, reject) => {
        login(username, user.password).then(response => {
          const data = response.data
          const userInfo = data.userInfo
          const tokenStr = data.tokenHead+data.token
          // const dormInfo = data.dormInfo
          commit('SET_TOKEN', tokenStr)
          commit('SET_USERINFO', userInfo)
          // commit('SET_DORM_INFO', dormInfo)
          localStorage.setItem('token', tokenStr)
          localStorage.setItem('user', JSON.stringify(userInfo))
          dispatch('chat/connect',{}, {root: true})
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },
    //注册逻辑
    userRegister({ commit }, user){
      return new Promise((resolve, reject) => {
        //注册成功后自动进入登录状态
        register(user).then(response => {
          Toast.success(response.msg)
          const data = response.data
          const userInfo = data.userInfo
          const tokenStr = data.tokenHead+data.token
          commit('CLEAR')
          commit('SET_TOKEN', tokenStr)
          commit('SET_USERINFO', userInfo)
          localStorage.setItem('token', tokenStr)
          localStorage.setItem('user', JSON.stringify(userInfo))
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    }
  }
}

export default user
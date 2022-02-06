
const post = {
  namespaced: true,
  state: {
    _scrollTop: 0  // 存储组件的scrollTop值
  },
  mutations: {
    updatePosition (state, payload) {
      state._scrollTop = payload.top  // 更改scrollTop值
    }
  },
  actions: {
    updatePosition ({commit}, top) {
      commit({type: 'updatePosition', top: top}) // 提交mutation 更改状态
    }
  }
}

export default post

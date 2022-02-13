const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  avatar: state => state.user.userInfo.avatar,
  name: state => state.user.name,
  userInfo: state => state.user.userInfo,
  routes: state => state.user.routes
}
export default getters

const getters = {
  token: state => state.user.token,
  user: state => state.user.userInfo,
  chatMessages: state => state.chat.sessions[state.chat.currentAdmin.username+'#'+state.chat.currentSession.username]
}
export default getters

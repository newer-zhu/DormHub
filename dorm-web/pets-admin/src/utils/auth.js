import Cookies from 'js-cookie'

const TokenKey = 'vue_admin_template_token'
const userInfo = 'user_info'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}

export function getUserInfo() {
  return JSON.parse(sessionStorage.getItem(userInfo))
}

export function setUserInfo(info) {
  return sessionStorage.setItem(userInfo, JSON.stringify(info))
}

export function removeUserInfo() {
  return sessionStorage.removeItem(userInfo)
}

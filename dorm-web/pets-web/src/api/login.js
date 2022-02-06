import request from '../utils/request'

//登录
export function login(username, password) {
  return request({
    url: '/user/login',
    method: 'post',
    data: {
      username,
      password
    }
  })
}

//注册
export function register(user) {
  return request({
    url: '/user/register',
    method: 'post',
    data: user
  })
}
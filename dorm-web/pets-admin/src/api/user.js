import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/user/login',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: '/user/info',
    method: 'post',
    data: token
  })
}

export function getAllUsers() {
  return request({
    url: '/user',
    method: 'get'
  })
}


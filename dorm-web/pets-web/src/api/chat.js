import request from '../utils/request'

export function getUsers() {
  return request({
    url: '/user',
    method: 'get',
  })
}

export function getAllUsers() {
  return request({
    url: '/chat/user',
    method: 'get',
  })
}

//搜索
export function searchUsers(str) {
  return request({
    url: '/chat/search/'+str,
    method: 'get',
  })
}
import request from '@/utils/request'

export function getAllUsers() {
  return request({
    url: '/chat/user',
    method: 'get'
  })
}

export function getFilterUsers(str) {
  return request({
    url: '/chat/search/'+str,
    method: 'get'
  })
}

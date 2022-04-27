import request from '../utils/request'

export function getUsers() {
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

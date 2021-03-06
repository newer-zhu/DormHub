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

export function searchUsers(con) {
  return request({
    url: '/user/filter',
    method: 'post',
    data: con
  })
}

export function uploadExcel(param) {
  return request({
    url: '/user/admin/excel/import',
    method: 'post',
    data: param
  })
}

export function getAllUserWithRole(name) {
  return request({
    url: '/user/role/info?username='+name,
    method: 'get'
  })
}

export function allocateRole(userId, param) {
  return request({
    url: '/user/role/'+userId,
    method: 'post',
    data: param
  })
}

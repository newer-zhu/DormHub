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
    url: '/user/excel/import',
    method: 'post',
    data: param
  })
}

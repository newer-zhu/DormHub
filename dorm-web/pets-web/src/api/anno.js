import request from '../utils/request'

export function getIndexList() {
  return request({
    url: '/announcement/fresh',
    method: 'get',
  })
}

export function getAnnoById(id) {
  return request({
    url: '/announcement/'+id,
    method: 'get',
  })
}
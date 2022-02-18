import request from '@/utils/request'

//获取所有假条信息
export function getAllRequests() {
  return request({
    url: '/leave-request',
    method: 'get'
  })
}

export function deleteRequest(id) {
  return request({
    url: '/leave-request/'+id,
    method: 'delete'
  })
}

//获取指定申请人假条信息(返回列表)
export function getRequests(param) {
  return request({
    url: '/leave-request?prosper=' + param,
    method: 'get'
  })
}

export function passRequest(param) {
  return request({
    url: '/leave-request/proposer/pass',
    method: 'post',
    data: param
  })
}

export function failRequest(param) {
  return request({
    url: '/leave-request/proposer/fail',
    method: 'post',
    data: param
  })
}

import request from '../utils/request'

//获取假条信息(返回列表)
export function getRequests(param) {
  return request({
    url: '/leave-request' + param,
    method: 'get'
  })
}

//能否请假
export function canRequest(userId) {
  return request({
    url: '/leave-request/judge/'+userId,
    method: 'get'
  })
}

//获取审批人
export function getAuditors(id) {
  return request({
    url: '/leave-request/auditors/'+id,
    method: 'get'
  })
}

//通过
export function passRequest(req) {
  return request({
    url: '/leave-request/pass',
    method: 'post',
    data: req
  })
}

//不通过
export function failRequest(req) {
  return request({
    url: '/leave-request/fail',
    method: 'post',
    data: req
  })
}

//销假
export function destroyRequest(req) {
  return request({
    url: '/leave-request/destroy',
    method: 'post',
    data: req
  })
}

//提交
export function requestLeave(req) {
  return request({
    url: '/leave-request',
    method: 'post',
    data: req
  })
}

//删除假条
export function deleteLeave(id) {
  return request({
    url: '/leave-request/'+id,
    method: 'delete'
  })
}


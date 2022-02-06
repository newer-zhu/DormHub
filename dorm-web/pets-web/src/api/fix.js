import request from '../utils/request'

//提交报修单
export function sendFixReport(fix) {
  return request({
    url: '/fix/save',
    method: 'post',
    data: fix
  })
}

//软删除报修单
export function softDelFixReport(id) {
  return request({
    url: '/softDel/'+id,
    method: 'get'
  })
}

//硬删除报修单
export function hardDelFixReport(id) {
  return request({
    url: '/fix/'+id,
    method: 'delete'
  })
}

//获取所有分类
export function getAllCategories() {
  return request({
    url: '/fix-cat',
    method: 'get'
  })
}

//获取用户的报修单
export function getReportsByUserId(uid) {
  return request({
    url: '/fix/user/'+uid,
    method: 'get'
  })
}

//获取报修单
export function getReportById(id) {
  return request({
    url: '/fix/'+id,
    method: 'get'
  })
}

//获取寝室的报修单
export function getReportsByDormId(did) {
  return request({
    url: '/fix/dorm/'+did,
    method: 'get'
  })
}

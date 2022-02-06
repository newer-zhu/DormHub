import request from '../utils/request'

//获取宿舍详细信息
export function getDormById(dormId) {
  return request({
    url: '/dorm/'+dormId,
    method: 'get'
  })
}

//获取所有宿舍信息
export function getAllDorms(buildingID) {
  return request({
    url: '/dorm',
    method: 'get'
  })
}

//获取预定宿舍信息
export function getReserveDorms(userId) {
  return request({
    url: '/dorm/reserve/'+userId,
    method: 'get'
  })
}
import request from '../utils/request'

//获取宿舍详细信息
export function getDormById(dormId) {
  return request({
    url: '/dorm/'+dormId,
    method: 'get'
  })
}

//获取所有宿舍信息
export function getDormsByBuildingId(buildingID) {
  return request({
    url: '/dorm/buildings/'+buildingID,
    method: 'get'
  })
}

//获取所有楼栋号
export function getBuildingId() {
  return request({
    url: '/dorm/buildings',
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

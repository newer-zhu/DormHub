import request from '../utils/request'

export function reserve(userId, bedId) {
  return request({
    url: '/bed/appointment?userId='+userId+'&bedId='+bedId,
    method: 'get',
  })
}

export function cancel(userId, bedId) {
  return request({
    url: '/bed/appointment?userId='+userId+'&bedId='+bedId,
    method: 'delete',
  })
}

export function myReservation(userId) {
  return request({
    url: '/bed/info/'+userId,
    method: 'get',
  })
}

export function getBedsByDormId(dormId) {
  return request({
    url: '/bed/dorm/'+dormId,
    method: 'get',
  })
}
import request from '@/utils/request'

export function getTimes() {
  return request({
    url: '/checkLog/time',
    method: 'get',
  })
}

export function search(cur, con) {
  return request({
    url: '/checkLog/search/'+cur,
    method: 'post',
    data: con
  })
}

export function getCheckReport(id, time) {
  return request({
    url: '/checkLog/dorm/'+id+'/'+time,
    method: 'get',
  })
}

export function getCheckItems() {
  return request({
    url: '/checkItem/update',
    method: 'get',
  })
}

export function updateCheckItems(data) {
  return request({
    url: '/checkItem/update',
    method: 'post',
    data: data
  })
}

export function getLastTenAvgScores() {
  return request({
    url: '/eCharts/avgScores',
    method: 'get'
  })
}

export function getTenMaxScores() {
  return request({
    url: '/eCharts/maxScores',
    method: 'get'
  })
}

export function getScoresAccount() {
  return request({
    url: '/eCharts/countScores',
    method: 'get'
  })
}

export function getRankedScores() {
  return request({
    url: '/eCharts/rankedAvgScores',
    method: 'get'
  })
}

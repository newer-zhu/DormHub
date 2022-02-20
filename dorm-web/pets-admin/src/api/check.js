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

import request from '@/utils/request'

export function getBedsByDormId(id) {
  return request({
    url: '/bed/dorm/PC/'+id,
    method: 'get',
  })
}

export function setBed(uid, bid) {
  return request({
    url: '/bed/allocate?bedId='+bid+'&uid='+uid,
    method: 'get',
  })
}

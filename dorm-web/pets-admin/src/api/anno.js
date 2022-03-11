import request from '@/utils/request'

const prefix = '/announcement'
export function saveAnnouncement(data) {
  return request({
    url: prefix+'/admin/save',
    method: 'post',
    data: data
  })
}

export function updateAnnouncement(data) {
  return request({
    url: prefix+'/admin/update',
    method: 'post',
    data: data
  })
}

export function withdrewById(id) {
  return request({
    url: prefix+'/admin/withdrew/'+id,
    method: 'get'
  })
}

export function disWithdrewById(id) {
  return request({
    url: prefix+'/admin/withdrew/dis/'+id,
    method: 'get'
  })
}

export function getById(id) {
  return request({
    url: prefix+'/'+id,
    method: 'get'
  })
}

export function deleteById(id) {
  return request({
    url: prefix+'/admin/del/hard/'+id,
    method: 'get'
  })
}

export function getAnnouncements(cur) {
  return request({
    url: prefix+'/list?cur='+cur,
    method: 'get'
  })
}

export function uploadImg(data) {
  return request({
    url: '/image/announcement',
    method: 'post',
    data: data
  })
}


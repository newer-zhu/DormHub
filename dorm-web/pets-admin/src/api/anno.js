import request from '@/utils/request'

export function saveAnnouncement(data) {
  return request({
    url: '/announcement/save',
    method: 'post',
    data: data
  })
}

export function updateAnnouncement(data) {
  return request({
    url: '/announcement/update',
    method: 'post',
    data: data
  })
}

export function withdrewById(id) {
  return request({
    url: '/announcement/withdrew/'+id,
    method: 'get'
  })
}

export function disWithdrewById(id) {
  return request({
    url: '/announcement/withdrew/dis/'+id,
    method: 'get'
  })
}

export function getById(id) {
  return request({
    url: '/announcement/'+id,
    method: 'get'
  })
}

export function deleteById(id) {
  return request({
    url: '/announcement/del/hard/'+id,
    method: 'get'
  })
}

export function getAnnouncements(cur) {
  return request({
    url: '/announcement/list?cur='+cur,
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


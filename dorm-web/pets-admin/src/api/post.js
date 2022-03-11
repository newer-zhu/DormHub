import request from '@/utils/request'

export function getPostsByCondition(cur, data) {
  return request({
    url: '/post/con/'+cur,
    method: 'post',
    data: data
  })
}

export function deletePost(id) {
  return request({
    url: '/post/'+id,
    method: 'delete'
  })
}

export function getUncheckedPosts() {
  return request({
    url: '/post/audit/unchecked',
    method: 'get'
  })
}

export function passPosts(ids) {
  return request({
    url: '/post/audit/check/batch',
    method: 'post',
    data: ids
  })
}

export function passPost(id) {
  return request({
    url: '/post/audit/check/'+id,
    method: 'get'
  })
}

export function failPost(id) {
  return request({
    url: '/post/audit/fail/'+id,
    method: 'get'
  })
}

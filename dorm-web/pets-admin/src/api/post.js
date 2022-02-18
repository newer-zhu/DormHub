import request from '@/utils/request'

export function getPostsByCondition() {
  return request({
    url: '/post/con',
    method: 'get'
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
    url: '/post/unchecked',
    method: 'get'
  })
}

export function passPosts(ids) {
  return request({
    url: '/post/check/batch',
    method: 'post',
    data: ids
  })
}

export function passPost(id) {
  return request({
    url: '/post/check/'+id,
    method: 'get'
  })
}

export function failPost(id) {
  return request({
    url: '/post/fail/'+id,
    method: 'get'
  })
}

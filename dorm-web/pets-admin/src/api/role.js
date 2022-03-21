import request from '@/utils/request'

export function getAllRoles() {
  return request({
    url: '/role',
    method: 'get'
  })
}

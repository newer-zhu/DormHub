import request from '@/utils/request'

export function getLoginLogs() {
  return request({
    url: '/log/login',
    method: 'get'
  })
}

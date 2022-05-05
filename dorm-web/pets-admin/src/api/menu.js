import request from '@/utils/request'
import store from '@/store'

export function getMenus() {
  return request({
    url: '/menu/list/' + store.getters.userInfo.id,
    method: 'get'
  })
}

export function getAllMenus() {
  return request({
    url: '/menu',
    method: 'get'
  })
}

import request from '@/utils/request'

export function getMenusByRoleId(roleId) {
  return request({
    url: '/menu/allocate/'+roleId,
    method: 'get',
  })
}

export function setMenusWithRoleId(roleId, menus) {
  return request({
    url: '/menu/allocate/'+roleId,
    method: 'post',
    data: menus
  })
}

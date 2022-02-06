import request from '../utils/request'



//删除头像
export function deleteAvatar(key) {
  return request({
    url: '/user/avatarDelete?'+'key='+key,
    method: 'get'
  })
}

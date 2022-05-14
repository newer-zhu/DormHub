import request from '../utils/request'

//上传报修图片
export function uploadFixPic(fixId, pic) {
  let param = new FormData()
  param.append('fixPic', pic, pic.name)
  return request({
    url: '/image/fix/'+fixId,
    method: 'post',
    config: {
      headers: {'Content-Type': 'multipart/form-data'}
    },
    data: param
  })
}

//上传反馈图片
export function uploadPostPic(pic) {
  let param = new FormData()
  param.append('postPic', pic, pic.name)
  return request({
    url: '/image/post',
    method: 'post',
    config: {
      headers: {'Content-Type': 'multipart/form-data'}
    },
    data: param
  })
}

//上传请假图片
export function uploadLeavePic(file, requestId) {
  let param = new FormData()
  param.append('reqFile', file, file.name)
  return request({
    url: '/image/leave/'+requestId,
    method: 'post',
    config: {
      headers: {'Content-Type': 'multipart/form-data'}
    },
    data: param
  })
}

//上传头像
export function uploadAvatar(avatar) {
  let param = new FormData()
  param.append('avatar', avatar, avatar.name)
  return request({
    url: '/image/avatar',
    method: 'post',
    config: {
      headers: {'Content-Type': 'multipart/form-data'}
    },
    data: param
  })
}

//删除图片
export function deletePic(imageId) {
  return request({
    url: '/image/'+imageId,
    method: 'delete',
  })
}


export function updateAvatar(userId, avatar) {
  let param = new FormData()
  param.append('avatar', avatar, avatar.name)
  return request({
    url: '/image/avatarUpdate/'+userId,
    method: 'post',
    config: {
      headers: {'Content-Type': 'multipart/form-data'}
    },
    data: param
  })
}

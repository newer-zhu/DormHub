import request from '../utils/request'
//发布帖子
export function sendPost(post) {
  return request({
    url: '/post/save',
    method: 'post',
    data: post
  })
}

//获取帖子
export function getPostById(postId) {
  return request({
    url: '/post/'+postId,
    method: 'get'
  })
}
//获取用户帖子
export function getPostByUserId(id) {
  return request({
    url: '/post?userId='+id,
    method: 'get'
  })
}
//获取审核通过的帖子
export function getCheckedPost(lastId, userId) {
  return request({
    url: '/post/checked?lastId='+lastId+'&userId='+userId,
    method: 'get',
  })
}

//删除帖子
export function deletePost(id) {
  return request({
    url: '/post/'+id,
    method: 'delete'
  })
}

//点赞
export function like(uid, postId) {
  return request({
    url: '/post/like/'+true+'?uId='+uid+'&postId='+postId,
    method: 'get'
  })
}

//取消点赞
export function dislike(uid, postId) {
  return request({
    url: '/post/like/'+false+'?uId='+uid+'&postId='+postId,
    method: 'get'
  })
}

//获取评论
export function getComments(postId) {
  return request({
    url: '/post-comment/post/'+postId,
    method: 'get'
  })
}

//删除评论
export function delComment(id) {
  return request({
    url: '/post-comment/'+id,
    method: 'delete'
  })
}

//发送评论
export function addComment(comment) {
  return request({
    url: '/post-comment/',
    method: 'post',
    data: comment
  })
}

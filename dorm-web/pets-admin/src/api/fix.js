import request from '@/utils/request'

//获取所有分类
export function getAllCategories() {
  return request({
    url: '/fix-cat',
    method: 'get'
  })
}

//更新分类
export function updateCategories(data) {
  return request({
    url: '/fix-cat',
    method: 'put',
    data: data
  })
}

//新增分类
export function saveCategories(data) {
  return request({
    url: '/fix-cat',
    method: 'post',
    data: data
  })
}

//获取分类饼图
export function getPieData() {
  return request({
    url: '/fix-cat/pie',
    method: 'get'
  })
}

export function getFixReportsByCondition(cur) {
  return request({
    url: '/fix/table/'+cur,
    method: 'get'
  })
}

export function finish(id) {
  return request({
    url: '/fix/table/finish/'+id,
    method: 'get'
  })
}

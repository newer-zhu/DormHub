import request from "../utils/request";

//宿舍检查评分
export function sendCheckLog(log) {
  return request({
    url: '/checkLog',
    method: 'post',
    data: log
  })
}

//获取宿舍检查项目
export function getCheckItem() {
  return request({
    url: '/checkItem/enabled',
    method: 'get',
  })
}

//获取结果时间列表
export function getLogTime(dormId) {
  return request({
    url: '/checkLog/time/' + dormId,
    method: 'get'
  })
}

//获取检查结果
export function getCheckLogRes(dormId, time) {
  return request({
    url: '/checkLog/dorm/' + dormId + '/' + time,
    method: 'get'
  })
}

//获取检查结果分析
export function getAnalysis(dormId) {
  return request({
    url: '/checkLog/analysis/' + dormId,
    method: 'get'
  })
}

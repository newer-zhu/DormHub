import request from '@/utils/request'

export function getBuildings() {
  return request({
    url: '/dorm/buildings',
    method: 'get',
  })
}

export function getDormsByBuildingId(b) {
  return request({
    url: '/dorm/buildings/'+b,
    method: 'get',
  })
}

export function getDormsWithStu(b, f) {
  return request({
    url: '/dorm/buildings/detail?building='+b+'&floor='+f,
    method: 'get',
  })
}

export function setDormAdmin(d, u) {
  return request({
    url: '/dorm/buildings/detail/setAdmin?admin='+u+'&dormId='+d,
    method: 'get',
  })
}



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



import axios from 'axios'
import store from '../store'
import router from "../router";
import {Toast} from "vant";
// 创建axios实例
const service = axios.create({
  // baseURL: process.env.BASE_API,
  baseURL: '/api', // api的base_url
  timeout: 15000 // 请求超时时间
})

// request拦截器
service.interceptors.request.use(config => {
  if (store.getters.token) {
    config.headers['Authorization'] = localStorage.getItem('token') // 让每个请求携带自定义token 请根据实际情况自行修改
  }
  return config
}, error => {
  // Do something with request error
  console.log(error) // for debug
  Promise.reject(error)
})

// respone拦截器
service.interceptors.response.use(
  response => {
  /**
  * code为非200是抛错 可结合自己业务进行修改
  */
    const res = response.data
    if (res.code !== 200) {
      // 401:未登录;
      if (res.code === 401) {
        Toast.fail(res.msg)
        router.replace({name: 'Login'})
      }
      if (res.code === 403) {
        Toast.fail(res.msg)
      }
      return Promise.reject('error')
    } else {
      return res
    }
  },
  error => {
    console.log('err' + error)// for debug
    return Promise.reject(error)
  }
)

export default service

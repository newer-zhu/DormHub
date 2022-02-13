import { getMenus } from '@/api/menu'
import {setRouter, getRouter} from '@/utils/auth'

export const initMenu = (router, store) => {
  if (store.getters.routes.length > 0) {
    return
  }
  getMenus().then(res => {
    if (res.data) {
      // 格式化router
      const fmtRoutes = formatRoutes(res.data)
      // 404 page must be placed at the end !!!
      fmtRoutes.push({ path: '*', redirect: '/404', hidden: true })
      // 添加到router
      console.log(fmtRoutes)
      console.log('添加进router')
      router.addRoutes(fmtRoutes)
      // 将数据存入vuex
      store.commit('user/SET_ROUTES', fmtRoutes)
      // 连接websocket
      // store.dispatch('connect')
    }
  })
}

export const formatRoutes = (routes) => {
  const fmRoutes = []
  routes.forEach(router => {
    let {
      path,
      component,
      name,
      iconCls,
      children,
      hidden
    } = router

    const fmRouter = {
      path: path,
      name: name,
      hidden: hidden,
      alwaysShow: true,//一直显示根路由
      meta: {title: name, icon: iconCls},
      component(resolve) {
        if (component.startsWith('Home')) {
          require(['@/layout/index.vue'], resolve)
        }else if (component.startsWith('Anno')) {
          require(['@/views/anno/' + component + '.vue'], resolve)
        }else if (component.startsWith('Fix')){
          require(['@/views/fix/' + component + '.vue'], resolve)
        }else if (component.startsWith('Leave')){
          require(['@/views/leave/' + component + '.vue'], resolve)
        }
      }
    }
    if (children && children instanceof Array) {
      // 递归
      fmRouter.children = formatRoutes(children)
    }else {
      fmRouter.alwaysShow = false
    }
    fmRoutes.push(fmRouter)
  })
  return fmRoutes
}

import { getMenus } from '@/api/menu'
import el from 'element-ui/src/locale/lang/el'

export const initMenu = (router, store) => {
  if (store.getters.routes.length > 0) {
    return
  }
  getMenus().then(res => {
    //double check
    if (store.getters.routes.length > 0) {
      return
    }
    if (res.data) {
      // 格式化router
      const fmtRoutes = formatRoutes(res.data)
      // 404 page must be placed at the end !!!
      fmtRoutes.push({ path: '*', redirect: '/404', hidden: true })
      // 添加到router
      console.log('添加进router')
      // console.log(fmtRoutes)
      router.addRoutes(fmtRoutes)
      // 将数据存入vuex
      store.commit('user/SET_ROUTES', fmtRoutes)
      // 连接websocket
      store.dispatch('chat/connect')
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
        }else if (component.startsWith('Post')){
          require(['@/views/post/' + component + '.vue'], resolve)
        }else if (component.startsWith('Check')){
          require(['@/views/check/' + component + '.vue'], resolve)
        }else if (component.startsWith('User')){
          require(['@/views/user/' + component + '.vue'], resolve)
        }else if (component.startsWith('Chat')){
          require(['@/views/chat/' + component + '.vue'], resolve)
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

import Vue from 'vue'
import VueRouter from 'vue-router'
import Individual from "../views/individual/index";
import Login from '../views/login/index'
import Chat from '../views/chat/index'
import ChatDetail from '../views/chat/chatDetails/ChatDetail'
import Index from '../views/index/index'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/individual'
  },
  {
    path: '/index',
    name: 'Index',
    component: Index,
    meta: {
      showFooter: true
    }
  },
  {
    path: '/individual',
    name: 'Individual',
    component: Individual,
    meta: {
      showFooter: true
    }
  },
  {
    path: '/chat',
    name: 'Chat',
    component: Chat,
    meta: {
      showFooter: true
    },
  },
  {
    path: '/chatDetail',
    name: 'ChatDetail',
    component: ChatDetail
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('../views/register/index')
  },
  {
    path: '/dormInfo',
    name: 'MyDorm',
    component: () => import('../views/dorm/dormInfo/MyDorm')
  },
  {
    path: '/inspection',
    name: 'Inspection',
    component: () => import('../views/dorm/inspection/index'),
    meta: {
      showFooter: true
    },
  },
  {
    path: '/inspection/evaluate',
    name: 'Evaluate',
    component: () => import('../views/dorm/inspection/Evaluate')
  },
  {
    path: '/inspection/checkLogRes',
    name: 'CheckLogRes',
    component: () => import('../views/dorm/inspection/Result')
  },
  {
    path: '/inspection/modifyItems',
    name: 'Modify',
    component: () => import('../views/dorm/inspection/Modify')
  },
  {
    path: '/inspection/graph',
    name: 'ResGraph',
    component: () => import('../views/dorm/inspection/ResGraph')
  },
  {
    path: '/post',
    name: 'PostList',
    component: () => import('../views/dorm/post/index'),
    meta: {
      showFooter: true,
      keepAlive: true
    }
  },
  {
    path: '/post/edit',
    name: 'Edit',
    keepAlive: false,
    component: () => import('../views/dorm/post/Edit')
  },
  {
    path: '/post/mine',
    name: 'MyPosts',
    keepAlive: false,
    component: () => import('../views/dorm/post/MyPosts')
  },
  {
    path: '/post/detail/:id',
    name: 'PostDetail',
    component: () => import('../views/dorm/post/PostDetail')
  },
  {
    path: '/fix',
    name: 'FixReport',
    component: () => import('../views/dorm/fix/FixReport')
  },
  {
    path: '/fix/mine',
    name: 'MyFixReports',
    component: () => import('../views/dorm/fix/MyFixReports')
  },
  {
    path: '/fix/dorm',
    name: 'DormFixReports',
    component: () => import('../views/dorm/fix/DormFixReports')
  },
  {
    path: '/fix/detail/:id',
    name: 'FixDetail',
    component: () => import('../views/dorm/fix/FixDetail')
  },
  {
    path: '/leave/request',
    name: 'LeaveRequest',
    component: () => import('../views/dorm/leave/Request')
  },
  {
    path: '/leave/detail',
    name: 'leaveDetail',
    component: () => import('../views/dorm/leave/Detail'),
    keepAlive: true
  },
  {
    path: '/leave/list',
    name: 'MyRequests',
    component: () => import('../views/dorm/leave/MyRequests')
  },
  {
    path: '/reserve',
    name: 'ReserveIndex',
    component: () => import('../views/dorm/reserve/index'),
  },
  {
    path: '/anno/list',
    name: 'AnnoList',
    component: () => import('../views/dorm/announcement/AnnoList'),
  },
  {
    path: '/anno/detail/:id',
    name: 'AnnoDetail',
    component: () => import('../views/dorm/announcement/AnnoDetail'),
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

<template>
  <div>
    <van-row>
      <div class="van-hairline--top"></div>
      <van-tabbar v-model="active">
        <van-tabbar-item name="home" icon="home-o" @click="gotoIndex">首页</van-tabbar-item>
        <van-tabbar-item name="search" @click="gotoPostList" icon="apps-o">广场</van-tabbar-item>
        <van-tabbar-item name="friends" icon="friends-o" @click="gotoChat">聊天</van-tabbar-item>
        <van-tabbar-item name="setting" icon="user-circle-o" @click="gotoIndvidual">个人</van-tabbar-item>
      </van-tabbar>
    </van-row>
  </div>
</template>

<script>
  export default {
    name: "FooterGuide",
    data(){
      return {
        active: 0
      }
    },
    methods:{
      gotoIndvidual(){
        this.$router.replace({
          path: '/individual'
        })
      },
      gotoChat(){
        this.$router.replace({
          path: '/chat'
        })
      },
      gotoIndex(){
        this.$router.replace({
          path: '/index'
        })
      },
      gotoPostList(){
        this.$router.replace({
          path: '/post'
        })
      }
    }
  }
</script>

<style scoped>

</style>
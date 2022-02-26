<template>
  <div id="card">
  	<header>
  		<img class="avatar" v-bind:src="user.avatar" v-bind:alt="user.name">
  		<p class="name">{{user.nickName}}</p>
      <span style="font-size: 12px; ">{{user.username}}</span>
  	</header>
  	<footer>
      <input class="search" type="text" v-model="searchStr" placeholder="输入用户名或学工号">
      <i style="margin-left: 5px" class="el-icon-search" @click="search"></i>
    </footer>
  </div>
</template>

<script>
import { getFilterUsers } from '../../../api/chat'

export default {
  name: 'card',
  data () {
    return {
      user: this.$store.getters.userInfo,
      searchStr: ''
    }
  },
  methods:{
    search(){
      if (this.searchStr){
        getFilterUsers(this.searchStr).then(res => {
          console.log(res)
          this.$store.commit('chat/SET_USERS', res.data)
        })
      }else {
        this.$store.dispatch('chat/initChatUsers')
      }
    }
  },
  watch:{
    searchStr(newVal, oldVal){
      if (!newVal){
        this.$store.dispatch('chat/initChatUsers')
      }
    }
  }
}
</script>

<style lang="scss" scoped>
#card {
	padding: 12px;
  .avatar{
  	width: 40px;
  	height: 40px;
  	vertical-align: middle;/*这个是图片和文字居中对齐*/
  }
  .name {
  	display: inline-block;
  	padding: 10px;
  	margin-bottom: 15px;
  	font-size: 16px;
  }
  .search {
  	background: #26292E;
  	height: 30px;
  	line-height: 30px;
  	padding: 0 5px;
  	border: 1px solid #3a3a3a;
  	border-radius: 4px;
    width: 88%;
  	outline: none;/*鼠标点击后不会出现蓝色边框*/
    color: #FFF;
  }
}
</style>

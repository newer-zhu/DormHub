<template>
  <div id="card">
  	<header>
  		<img class="avatar" v-bind:src="user.avatar" v-bind:alt="user.name">
  		<p class="name">{{user.nickName}}</p>
      <span style="font-size: 12px; ">{{user.username}}</span>
  	</header>
  	<footer>
  		<input class="search" type="text" v-model="$store.state.chat.filterKey" placeholder="查询用户...">
  	</footer>
  </div>
</template>

<script>
export default {
  name: 'card',
  data () {
    return {
      user: this.$store.getters.userInfo
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
  	padding: 0 10px;
  	border: 1px solid #3a3a3a;
  	border-radius: 4px;
  	outline: none;/*鼠标点击后不会出现蓝色边框*/
    color: #FFF;
  }
}
</style>

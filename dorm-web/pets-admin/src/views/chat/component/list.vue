<template>
  <div id="list">
    <ul style="padding-left: 0px">
      <li v-for="item in chatUsers"
          v-if="item.username !== user.username"
          :class="{ active: currentSession?item.username === currentSession.username :false }"
          v-on:click="changeCurrentSession(item)">
        <el-badge value="on" :hidden="onlineUserMap[item.id] == null" type="warning">
          <img class="avatar" :src="item.avatar" :alt="item.name">
        </el-badge>
        <el-badge :is-dot="isDot[item.username+'#'+user.username]">
          <p class="name">{{item.nickName}}</p>
          <span style="font-size: 12px; margin-left: 10px">{{item.username}}</span>
        </el-badge>
      </li>
    </ul>
  </div>
</template>

<script>
import {mapState} from 'vuex'

export default {
  name: 'list',
  data () {
    return {
      user: this.$store.getters.userInfo
    }
  },
  computed: mapState('chat',[
  'chatUsers',
  'currentSession',
    'isDot',
    'onlineUserMap'
	]),
  methods:{
  	changeCurrentSession(session) {
  		this.$store.commit('chat/changeCurrentSession',session)
  	},
  },
  mounted() {
  }
}
</script>

<style lang="scss" scoped>
#list {
	li {
		padding: 15px 15px;
		border-bottom: 1px solid #292C33;
		cursor: pointer;
		&:hover {
			background-color: rgba(255, 255, 255, 0.03);
		}
	}
  li.active {/*注意这个是.不是冒号:*/
			background-color: rgba(255, 255, 255, 0.1);
	}
	.avatar {
		border-radius: 2px;
		width: 30px;
		height: 30px;
		vertical-align: middle;
	}
	.name {
		display: inline-block;
		margin-left: 15px;
	}
}
</style>

<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 title="联系列表" >
      <template #right>
        <van-icon name="search" size="18" />
      </template>
    </van-nav-bar>

    <van-search
      v-model="searchStr"
      background="#EBEDF0"
      placeholder="请输入关键词"
      @search="search"
    >
      <template #action>
        <div @click="search">搜索</div>
      </template>
    </van-search>

    <van-cell-group style="margin-top: 5px">
      <van-cell
        v-for="user in displayUsers" :key="user.id"
        @click="changeCurrentSession(user)"
      >
        <template #title>
          <van-row>
            <van-col :span="5">
              <van-image round width="50" height="50" :src="user.avatar"/>
            </van-col>
            <van-col :span="12">
              <div style="font-size: 16px">
                {{user.nickName}}
              </div>
              <div style="font-size: 14px; color: #969799">
                {{'学号: '+user.username}}
              </div>
            </van-col>
          </van-row>
        </template>
      </van-cell>
    </van-cell-group>
  </div>
</template>

<script>
  import {getAllUsers, searchUsers} from "../../api/chat";
  import {mapState} from 'vuex'
  export default {
    name: "Chat",
    data(){
      return{
        users: [],
        searchStr: '',
        displayUsers: []
      }
    },
    mounted() {
      this.$store.dispatch('chat/initData');
      getAllUsers().then(res => {
        this.users = res.data
        this.displayUsers = this.users
      })
    },
    computed: {
      ...mapState('chat',['currentSession', 'admins']),
    },
    watch:{
      searchStr(val, oldVal){
        if (!val){
          this.displayUsers = this.users
        }
      }
    },
    methods:{
      changeCurrentSession(session) {
        this.$store.commit('chat/changeCurrentSession',session)
        this.$router.push({
          name: 'ChatDetail'
        })
      },
      search(){
        if (this.searchStr){
          searchUsers(this.searchStr).then(res => {
            this.displayUsers = res.data
            console.log(res.data);
          })
        }
      }
    }
  }
</script>

<style scoped>

</style>
<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 title="联系人列表" >
      <template #right>
        <van-button icon="search" hairline style="height: 30px; width: 50px;" type="primary" @click="search" />
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

    <van-cell-group style="margin-top: 5px; margin-bottom: 2rem">
      <van-cell
        v-show="self.id !== user.id"
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
        searchStr: '',
        displayUsers: [],
        self: this.$store.getters.user
      }
    },
    mounted() {
      this.displayUsers = this.admins
    },
    computed: {
      ...mapState('chat',['currentSession', 'admins']),
    },
    watch:{
      searchStr(val, oldVal){
        if (!val){
          this.displayUsers = this.admins
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
            this.displayUsers = res.data.users
            console.log(this.displayUsers);
          })
        }
      }
    }
  }
</script>

<style scoped>

</style>

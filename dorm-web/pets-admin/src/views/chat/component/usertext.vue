<template>
  <div id="usertext">
<!--    <el-button @click="addMessage" style="float: right" type="primary">发送</el-button>-->
<!--    <el-input type="textarea"-->
<!--              :rows="5" v-model="content"-->
<!--              placeholder="请输入内容"></el-input>-->
    <el-input maxlength="100" minlength="1"
              clearable placeholder="请输入内容"
              v-model="content" class="input-with-select">
      <el-button style="background-color: #3f9dfe; color: #FFFFFF" slot="append" @click="addMessage">发送</el-button>
    </el-input>
<!--  <textarea placeholder="发送" v-model="content"></textarea>-->
  </div>
</template>

<script>
  import {mapState} from 'vuex'

  export default {
    name: 'usertext',
    data() {
      return {
        content: ''
      }
    },
    computed: mapState('chat',[
      'sessions',
      'currentSession'
    ]),
    methods: {
      addMessage(e) {
        if (this.content.length) {
          if (!this.currentSession){
            this.$message({type: 'warning', message: '请选择聊天对象'})
          } else{
            let msgObj = new Object();
            msgObj.to = this.currentSession.username;
            msgObj.content = this.content;
            this.$store.getters.stomp.send('/sendMsg', {}, JSON.stringify(msgObj));
            this.$store.commit('chat/addMessage',msgObj);
            this.content = '';
          }
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
  #uesrtext {
    position: absolute;
    bottom: 0;
    right: 0;
    width: 100%;
    height: 30%;
    border-top: solid 1px #DDD;
    > textarea {
      padding: 10px;
      width: 100%;
      height: 100%;
      border: none;
      outline: none;
    }
  }
</style>

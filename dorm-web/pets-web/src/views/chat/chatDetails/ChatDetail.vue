<template>
  <div style="display: flex; flex-direction: column; justify-content: center">
<!--    头部-->
    <MessageHeader id="message-head"/>
<!--    内容-->
    <MessageList id="message-list"/>
<!--    输入框-->
    <div id="message-text">
      <van-field
        style="border: 1px solid #f2e6d0"
        v-model="content"
        center
        clearable>
        <template #button>
          <van-button size="small" type="primary" @click="addMessage">发送</van-button>
        </template>
      </van-field>
    </div>
  </div>
</template>

<script>
  import {mapState} from 'vuex'
  import MessageList from "./components/MessageList";
  import MessageHeader from "./components/MessageHeader";
  export default {
    name: "ChatDetail",
    data(){
      return{
        user: JSON.parse(window.localStorage.getItem('user')),
        content: ''
      }
    },
    components: {MessageList,  MessageHeader},
    computed:{
      ...mapState('chat', ['sessions', 'currentSession', 'stomp', 'admins'])
    },
    methods:{
      addMessage(e) {
        if (this.content.length) {
          let msgObj = new Object();
          msgObj.to = this.currentSession.username;
          msgObj.content = this.content;
          msgObj.self = true;
          msgObj.date = new Date()
          this.$store.dispatch('chat/sendMessage', msgObj)
          this.content = '';
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
  #message-list {
    height: 88vh;
    overflow: hidden;    // 非常之关键
  }
  #message-text {
    width: 100vw;
  }
</style>
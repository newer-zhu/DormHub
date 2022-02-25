<template>
  <div style="width: 100%; height: 700px; background-color: #f5f6f9">
    <div id="friendChat">
      <div class="sidebar">
        <card></card>
        <list></list>
      </div>
      <div class="main">
        <message></message>
        <usertext></usertext>
      </div>
    </div>
  </div>
</template>

<script>
  import card from './component/card'
  import list from './component/list'
  import message from './component/message'
  import usertext from './component/usertext'

  export default {
    name: 'ChatPanel',
    data () {
      return {

      }
    },
    mounted() {
      this.$store.dispatch('chat/initChatUsers');
    },
    components:{
      card,
      list,
      message,
      usertext
    }
  }
</script>

<style lang="scss" scope>
  #friendChat {
    margin: 20px auto;
    width: 800px;
    height: 600px;
    overflow: hidden;
    border-radius: 10px;
    .sidebar, .main {
      height: 100%;
    }
    .sidebar {
      float: left;
      color: #f4f4f4;
      background-color: #2e3238;
      width: 200px;
      overflow: hidden;
    }
    .main {
      position: relative;
      overflow: hidden;
      background-color: #eee;
    }
  }
</style>

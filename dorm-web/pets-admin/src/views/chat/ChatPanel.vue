<template>
  <div class="chat-page">
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
  .chat-page{
    width: 100%; height: 700px;
    background-color: rgb(255 255 255);
    margin-top: 10%
  }
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
      width: 220px;
      overflow: auto;
    }
    .main {
      height: 100%;
      position: relative;
      overflow: hidden;
      background-color: #eee;
    }
  }
</style>
<!--美化拖动条-->
<style>
  ::-webkit-scrollbar{
    width: 7px;
  }
  ::-webkit-scrollbar-track{

    background-color: #f5f5f5;

    -webkit-box-shadow:inset 0 0 3px rgba(0,0,0,0.1);

    border-radius:5px;

  }
  ::-webkit-scrollbar-thumb{

    background-color: rgba(0, 0, 0, 0.2);

    border-radius: 5px;
  }
  ::-webkit-scrollbar-button{

    background-color: #eee;

    display: none;

  }
  ::-webkit-scrollbar-corner{

    background-color: black;

  }
</style>

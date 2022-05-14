<template>
  <div class="record-wrapper">
    <div class="time"></div>

    <div v-if="self" class="msg msg-right">
      <div class="img-wrapper">
        <van-image class="img"
             :src="currentAdmin.avatar" />
      </div>
      <div class="message-wrapper message-wrapper-right">
        <div class="message">{{ message }}</div>
      </div>
    </div>

    <div v-else class="msg msg-left">
      <div class="img-wrapper">
        <img class="img"
             :src="currentSession.avatar" />
      </div>
      <div class="message-wrapper message-wrapper-left">
        <div class="message">{{ message }}</div>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapState} from 'vuex'
  export default {
    name: "Message",
    props:{
      self: Boolean,
      message: String,
      timestamp: {

      }
    },
    computed:{
      ...mapState('chat',['currentAdmin', 'currentSession'])
    }
  }
</script>

<style lang="scss" scoped>
  .record-wrapper {
    margin: 4px;
    padding: 4px;
  }
  .time {
    text-align: center;
  }
  .msg {
    display: flex;
    flex-direction: row;

    .message-wrapper {
      max-width: 220px;

      margin: 0px 10px 0px 10px;

      .message {
        font-weight: 500;
        color: rgba(54, 54, 54, 0.96);
        margin: 10px 8px 8px 8px;
        word-wrap: break-word; //英文换行
      }
    }

    .message-wrapper-left {
      background-color: #76b4f7;
      border-radius: 0px 12px 12px 12px;
    }

    .message-wrapper-right {
      background-color: powderblue;
      border-radius: 12px 0px 12px 12px;
    }

    .img {
      flex: auto;
      height: 1rem;
      width: 1rem;
      border-radius: 8px
    }
  }
  .msg-right {
    flex-direction: row-reverse;
  }
  .msg-left {
    flex-direction: row;
  }
</style>

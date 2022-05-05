<template>
  <div>
    <van-sticky>
      <van-nav-bar
        :title="'聊天('+currentSession.nickName+')'"
        left-text="返回"
        left-arrow
        @click-left="$router.back()"
      />
    </van-sticky>
  </div>
</template>

<script>
  import {mapState} from "vuex";

  export default {
    name: "MessageHeader",
    computed:{
      ...mapState('chat',['currentSession'])
    }
  }
</script>

<style scoped>

</style>

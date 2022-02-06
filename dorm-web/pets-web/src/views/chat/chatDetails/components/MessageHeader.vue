<template>
  <div>
    <van-sticky>
      <van-nav-bar
        title="聊天"
        left-text="返回"
        right-text="按钮"
        left-arrow
        @click-left="$router.back()"
      />
    </van-sticky>
  </div>
</template>

<script>
  export default {
    name: "MessageHeader"
  }
</script>

<style scoped>

</style>
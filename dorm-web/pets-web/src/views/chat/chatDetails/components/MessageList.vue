<template>
  <div class="scroll-wrapper" ref="scroll">
    <div class="scroll-content">
      <Message
        v-for="item in chatMessages"
        :key="item.message"
        :message="item.content"
        :timestamp="item.date"
        :self="item.self"
      ></Message>
    </div>
  </div>
</template>

<script>
  import Message from "./Message";
  import BScroll from '@better-scroll/core'
  import MouseWheel from '@better-scroll/mouse-wheel'
  import {mapGetters} from 'vuex'
  BScroll.use(MouseWheel)
  export default {
    name: "MessageList",
    components: {Message},
    data(){
      return{
      }
    },
    mounted() {
      this.$nextTick(() => {
        this.init();
      })
    },
    beforeDestroy() {
      this.bs.destroy();
    },
    methods: {
      // better-scroll的代码
      init() {
        this.bs = new BScroll(this.$refs.scroll, {
          scrollY: true, // 上下滚动
          click: true,   // 开启点击事件
          startY: document.querySelector(".scroll-wrapper").clientHeight - this.$refs.scroll.scrollHeight + 5 , // 初始高度
          mouseWheel: true,   // 鼠标滚动
          probeType: 2, // listening scroll hook
        });
        // 下面的不要也行，官网抄的顺便留下来了
        this.bs.on("scroll", ({ y }) => {
          console.log("scrolling:" + y);
        });
        this.bs.on("scrollEnd", () => {
          console.log("scrollingEnd");
        });
      },
      clickHandler(item) {
        alert(item);
      },
    },
    computed:{
      ...mapGetters(['chatMessages'])
    }
  }
</script>

<style lang="scss" scoped>

</style>

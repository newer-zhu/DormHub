<template>
  <div style="background-color: rgba(245,246,249,0.49)">
    <van-nav-bar
      title="首页"
    />

    <van-swipe @change="onChange" style="height: 200px">
      <van-swipe-item :key="i" v-for="(img,i) in covers">
        <van-image style="padding: 1px 0px; border-radius: 4px" :src="img"></van-image>
      </van-swipe-item>
      <template #indicator>
        <div class="custom-indicator">{{ current + 1 }}/2</div>
      </template>
    </van-swipe>

    <van-grid style="margin-top: 20px;" squaren clickable :column-num="3">
      <van-grid-item to="/inspection" text="宿舍检查" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/inspecton.png')"></van-image>
        <div class="menu-text">宿舍检查</div>
      </van-grid-item>
      <van-grid-item to="/leave/request" text="离寝请假" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/leave.png')"></van-image>
        <div class="menu-text">离寝请假</div>
      </van-grid-item>
      <van-grid-item to="/reserve" text="自选床位" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/reserve.png')"></van-image>
        <div class="menu-text">自选床位</div>
      </van-grid-item>
      <van-grid-item to="/fix" text="报修" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/fix.png')"></van-image>
        <div class="menu-text">报修</div>
      </van-grid-item>
      <van-grid-item to="/post/edit" text="反馈" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/post.png')"></van-image>
        <div class="menu-text">反馈</div>
      </van-grid-item>
      <van-grid-item to="" text="反馈" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/announcement.png')"></van-image>
        <div class="menu-text">公告</div>
      </van-grid-item>
    </van-grid>

    <van-divider/>

    <div style="background-color: #ffffff;padding: 10px 0px">
      <van-row v-for="i in 3" style="padding: 5px 5px 5px 20px;border-bottom: 1px solid #EBEDF0">
        <van-col :span="8">
          <van-image class="pre-img" src="https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF" />
        </van-col>
        <van-col :span="15">
          <div style="height: 50px">标题标题标题标题标题标题标题标题标题</div>
          <div style="margin-top: 5px; font-size: 14px; color: #646566;display: inline">2020/12/12 12:12:20</div>
          <div style="margin-top: 5px; font-size: 14px; color: #646566; display: inline; margin-left: 20px">宋老师</div>
        </van-col>
      </van-row>
    </div>

  </div>
</template>

<script>
  export default {
    name: "Index",
    data(){
      return {
        show: 0,
        current: 0,
        covers: [
          require('../../assets/img/index/cover1.jpg'),
          require('../../assets/img/index/cover2.jpg')
        ]
      }
    },
    methods:{
      onChange(index) {
        this.current = index;
      },
    }
  }
</script>

<style scoped>
  /deep/ .van-nav-bar__content {
    background-color: #1988f9;
    height: 50px;
  }
  /deep/ .van-nav-bar__title {
    color: #f7f8fa;
    font-weight: 500;
    font-size: 22px;
    font-family: "Microsoft YaHei UI";
  }
  .custom-indicator {
    position: absolute;
    right: 5px;
    bottom: 5px;
    padding: 2px 5px;
    font-size: 12px;
    background: rgba(0, 0, 0, 0.1);
  }
  .menu-icon{
    width: 55px;
    height: 55px;
  }
  .menu-text{
    margin-top: 10px;
    color: #646566
  }
  .pre-img{
    border-radius: 15px;
    width: 100px;
    height: 80px;
  }
</style>

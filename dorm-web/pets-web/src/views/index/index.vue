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
      <van-grid-item to="/anno/list" text="反馈" >
        <van-image class="menu-icon" :src="require('../../assets/img/index/announcement.png')"></van-image>
        <div class="menu-text">公告</div>
      </van-grid-item>
    </van-grid>

    <van-divider/>

    <div style="background-color: #ffffff;padding: 10px 0px">
      <van-row @click="toAnnoDetail(a.id)" v-for="(a,i) in list" :key="i" style="padding: 5px 5px 5px 20px;border-bottom: 1px solid #EBEDF0">
        <van-col :span="8">
          <van-image class="pre-img" :src="a.cover? a.cover.url:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpy.66wz.com%2Fpic%2F003%2F007%2F268%2F00300726849_9f92aa0e.jpg&refer=http%3A%2F%2Fpy.66wz.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1648905923&t=75ab9618bcfe32713795c0dc87315c1b'" />
        </van-col>
        <van-col :span="15">
          <div style="height: 50px; font-size: 18px; line-height: 18px">{{a.title}}</div>
          <div style="margin-top: 5px; font-size: 14px; color: #646566;display: inline">{{a.publishTime}}</div>
          <div style="margin-top: 5px; font-size: 14px; color: #646566; display: inline; margin-left: 20px">{{a.nickName}}</div>
        </van-col>
      </van-row>
    </div>

  </div>
</template>

<script>
  import {getIndexList} from "../../api/anno";

  export default {
    name: "Index",
    data(){
      return {
        show: 0,
        current: 0,
        covers: [
          require('../../assets/img/index/cover1.jpg'),
          require('../../assets/img/index/cover2.jpg')
        ],
        list: []
      }
    },
    methods:{
      onChange(index) {
        this.current = index;
      },
      toAnnoDetail(id){
        this.$router.push({name: 'AnnoDetail', params: {id: id}})
      }
    },
    mounted() {
      getIndexList().then(res => {
        // console.log(res.data);
        this.list = res.data
      })
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

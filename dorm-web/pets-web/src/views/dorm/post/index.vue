<template>
  <div style="width: 100%;">
    <van-sticky>
      <van-nav-bar  @click-right="$router.push('/post/edit')"
                   title="反馈广场">
        <template #right><van-icon name="add-o" size="25" /><span style="margin-left: 5px; font-size: 18px">发帖</span></template>
      </van-nav-bar>
    </van-sticky>

    <van-pull-refresh id="list" success-text="加载成功" v-model="refreshing" @refresh="onRefresh">
      <van-list style="width: 100%"
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
        :offset="100"
      >
        <div style="margin: 10px 0px 15px 0px; width: 100%" v-for="(item) in data" @click="toPostDetail(item.id)" :key="item.id">
          <!--        头部-->
          <van-row>
            <van-col :span="6" style="margin-left: 15px">
              <van-image
                round
                fit="cover"
                width="60px"
                height="60px"
                :src="item.avatar"
              />
            </van-col>
            <van-col style="height: 63px" :span="10">
              <div style="height: 32px; line-height: 37px; font-size: 18px">{{item.nickName}}</div>
              <div style="height: 31px; line-height: 31px;font-size: 14px; color: #969799">{{item.time}}</div>
            </van-col>
            <van-col :span="5" :offset="1">
              <div style="line-height: 63px; height: 63px; font-size: 20px; color: #646566">
                {{item.buildingId}}
              </div>
            </van-col>
          </van-row>
          <!--        正文-->
          <van-row>
            <div style="width: 100%;word-wrap: break-word;max-height: 100px;overflow: hidden">
              <h3 v-html="item.content" class="content">
              </h3>
            </div>
          </van-row>
          <!--        图片-->
          <van-row v-show="item.images != null">
            <van-swipe class="my-swipe"  indicator-color="white">
              <van-swipe-item v-for="(u,index) in item.images" :key="index">
                <img style="width: 100%; height: 200px" :src="u.url">
              </van-swipe-item>
            </van-swipe>
          </van-row>

          <van-row style="margin-top: 10px">
            <van-col :span="3" :offset="1">
              <van-image v-show="!isLiked(item.id)" width="35px" height="35px" @click.stop="likePost(item.id)" :src="require('@/assets/img/点赞.png')"/>
              <transition name="van-slide-up">
                <van-image v-show="isLiked(item.id)" width="35px" height="35px" @click.stop="dislikePost(item.id)" :src="require('@/assets/img/已赞.png')"/>
              </transition>
            </van-col>
            <van-col :span="2"><div style="margin-top: 10px; font-size: 22px; ">{{'('+item.likeNum+')'}}</div></van-col>
            <van-col :span="3" style="margin-left: 10px"><van-image width="35px" height="35px" :src="require('@/assets/img/评论.png')"></van-image></van-col>
          </van-row>
          <van-divider :style="{borderColor: '#DEDEE0'}" />
        </div>
      </van-list>
    </van-pull-refresh>

    <div style="height: 200px"></div>
  </div>
</template>

<script>
  import {dislike, getCheckedPost, like} from "../../../api/post";
  import {mapState, mapActions} from 'vuex'
  export default {
    name: "PostList",
    data(){
      return{
        loading: true,
        data: [],
        //用户点赞过的帖子Id
        liked: [],
        finished: false,
        refreshing: true
      }
    },
    computed:{
      ...mapState({
        userInfo: (state) => state.user.userInfo,
        topDistance: (state) => state.post._scrollTop
      })
    },
    mounted() {
      this.loading = true
      document.querySelector('#list').addEventListener('scroll', this.handleScroll, false);
      this.initLoad()
    },
    methods:{
      ...mapActions([
        'updatePosition'
      ]),
      //初始加载
      initLoad(){
        console.log('初始加载');
        getCheckedPost(-1, this.userInfo.id).then(res => {
          this.data = res.data.posts
          this.finished = res.data.isEnd
          res.data.likedList.forEach(l => {this.liked.push(l)})
          this.loading = false
          this.refreshing = false
          console.log(res.data);
        })
      },
      //随着下滑继续动态加载数据
      onLoad(){
        this.loading = true
        getCheckedPost(this.data[this.data.length-1].id, this.userInfo.id).then(res => {
          console.log('加载更多');
          console.log(res.data);
          if (res.data.posts){
            res.data.posts.forEach(i => {this.data.push(i)})
            res.data.likedList.forEach(l => {this.liked.push(l)})
          }
          this.finished = res.data.isEnd
          this.loading = false
        })
      },
      //点赞
      async likePost(pid){
        await like(this.userInfo.id, pid).then(res => {
          if (res.code == 200){
            this.liked.push(pid)
            this.data.forEach(d => {
              if (d.id == pid){
                d.likeNum += 1
              }
            })
          }
        })
      },
      //取消赞
      async dislikePost(pid){
        await dislike(this.userInfo.id, pid).then(res => {
          if (res.code == 200){
            // console.log(this.liked.indexOf(pid));
            this.liked.splice(this.liked.indexOf(pid), 1)
            this.data.forEach(d => {
              if (d.id == pid){
                d.likeNum -= 1
              }
            })
          }
        })
      },
      //下拉刷新
      async onRefresh(){
        this.data = []
        this.finished = false
        this.loading = true
        await this.initLoad()
      },
      isLiked(id){
        return this.liked.indexOf(id) >= 0
      },
      //跳转到帖子详情页面
      toPostDetail(id){
        this.$router.push({
          path: `post/detail/${id}`
        })
      },
      handleScroll(){
        this.box = document.querySelector('#list')
        this.updatePosition(this.box.scrollTop)
      },
    },
    activated () {
      document.querySelector('#list').scrollTop = this.topDistance // 更新缓存组件的scrollTop值
    },
  }
</script>

<style scoped>
  .content{
    padding: 10px 10px 10px 20px;
    font-size: 15pt;
    line-height: 22px;
    color: #323233;
  }
</style>

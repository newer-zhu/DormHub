<template>
  <div>
    <van-sticky>
      <van-nav-bar  @click-right="$router.push('/post/edit')" left-arrow left-text="返回" @click-left="$router.back()"
                    title="反馈内容">
      </van-nav-bar>
    </van-sticky>

    <van-skeleton title avatar :row="5" :loading="loading" title>
      <div>
        <div style="margin: 10px 0px 15px 15px;font-size: 22px;word-wrap: break-word;">
          {{post.title}}
        </div>
        <van-row>
          <van-col :span="6">
            <van-image style="margin: 5px 0px 0px 15px" round :src="post.avatar" width="55" height="55"></van-image>
          </van-col>
          <van-col :span="4">
            <div style="margin-top: 10px">{{post.nickName}}</div>
            <div style="margin-top: 10px; color: #969799">{{post.buildingId}}</div>
          </van-col>
        </van-row>
        <!--    内容-->
        <div class="content">
          {{post.content}}
        </div>
        <!--        图片-->
        <van-row v-show="post.images != []">
          <van-swipe class="my-swipe"  indicator-color="white">
            <van-swipe-item v-for="(u,index) in post.images" :key="index">
              <img style="width: 100%; height: 200px" :src="u.url">
            </van-swipe-item>
          </van-swipe>
        </van-row>
        <div style="display: flex; flex-direction: row-reverse">
          <div style="margin: 10px 10px 0px 0px; color: #C8C9CC">{{post.time}}</div>
        </div>

        <!--    评论-->
        <div v-if="post.status == 1">
          <van-divider content-position="left">评论</van-divider>
          <div ref="commentList">
            <van-sticky :container="container">
              <van-field
                style="border: 1px solid #90cc92; border-radius: 5px; width: 94%; margin: 0 auto;padding: 5px; bottom: 2px"
                v-model="myComment.content"
                clearable
                maxlength="30"
                placeholder="友善发言哦"
              >
                <template #button>
                  <van-button @click="sendComment" size="small" type="primary">评论</van-button>
                </template>
              </van-field>
            </van-sticky>
            <van-cell :title="c.nickName" v-for="(c,i) in post.comments" :key="c.id" :value="c.buildingId" :label="c.content" />
          </div>
        </div>

        <div style="width: 100%" v-else-if="post.status == -1">
          <van-icon style="margin-left: 15px; font-size: 18px; color: #ee0a24; margin-top: 20px" name="failure">审核不通过</van-icon>
          <van-field label="原因" style="font-size: 18px; margin-top: 15px" autosize rows="10" readonly  size="large"  type="textarea" v-model="post.reason"/>
        </div>

        <div v-else>
          <van-image style="margin-left: 25%" height="200" width="200" :src="require('../../../assets/img/post/checking.png')" />
        </div>
      </div>
    </van-skeleton>

  </div>
</template>

<script>
  import {addComment, getComments, getPostById} from "../../../api/post";

  export default {
    name: "PostDetail",
    data(){
      return{
        loading: true,
        container: null,
        post: {
          avatar: "",
          buildingId: "",
          comments: [],
          content: "",
          id: -1,
          images: [],
          like: 0,
          nickName: '',
          status: 1,
          reason: '',
          time: "",
          title: "",
          userId: -1
        },
        myComment: {
          content: '',
          postId: -1,
          userId: this.$store.getters.user.id
        }
      }
    },
    mounted() {
      this.container = this.$refs.commentList
      this.post.id = this.$route.params.id
      this.myComment.postId = this.post.id
      getPostById(this.post.id).then(res => {
        console.log(res.data);
        this.post = res.data;
      })
      this.loading = false
    },
    methods:{
      sendComment(){
        let _this = this
        addComment(this.myComment).then(res => {
          if (res.code == 200){
            this.myComment.content = ''
            getComments(_this.post.id).then(res => {
              _this.post.comments = res.data
            })
            this.$notify({message: res.msg, type: "success"})
          }else {
            this.$notify({message: res.msg, type: "danger"})
          }
        })
      }
    }
  }
</script>

<style scoped>
  .content{
    padding: 10px 15px 10px 15px;
    font-size: 18px;
    line-height: 22px;
    letter-spacing: 1px;
    color: #646566;
    word-wrap: break-word;
  }
</style>
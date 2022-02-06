<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 title="帖子编辑" left-text="返回" left-arrow>
      <template #right></template>
    </van-nav-bar>

    <van-notice-bar
      left-icon="volume-o"
      text="帖子发布后通过审核才会展示，24小时后自动通过。"
    />

    <van-row style="margin-top: 10px">
      <van-form>
        <van-field
          v-model="post.title"
          name="标题"
          label="标题"
          placeholder="请输入标题"
          :rules="[{ required: true, message: '标题不能未空' }]"
        />
        <van-field
          v-model="post.content"
          rows="4"
          autosize
          label="内容"
          type="textarea"
          maxlength="500"
          placeholder="请输入内容"
          show-word-limit
          :rules="[{ required: true, message: '内容不能未空' }]"
        />
      </van-form>

      <van-cell title="上传图片"/>
      <div style="margin-left: 16px">
        <van-uploader
          name="postPic"
          :after-read="afterRead"
          @delete="remove"
          v-model="fileList" multiple
          :max-count="3"
        />
      </div>

      <van-divider/>

      <div style="margin: 16px;">
        <van-button round block type="info"
                    @click="onSubmit"
                    native-type="submit">提交</van-button>
      </div>
    </van-row>
  </div>
</template>

<script>
  import {mapState} from "vuex";
  import {sendPost,deletePost} from "../../../api/post";
  import {uploadPostPic, deletePic} from "../../../api/file";

  export default {
    name: "Edit",
    data(){
      return{
        post: {
          id: null,
          title: '',
          content: '',
          userId: this.$store.getters.user.id,
        },
        //附件列表
        fileList: [],
        //附件后台返回列表
        keyList: []
      }
    },
    computed:{
      ...mapState('user',['userInfo'])
    },
    methods:{
      onSubmit(){
        sendPost(this.post).then(res => {
          if (res.code == 200){
            this.post.status = 0
            this.$notify({ type: 'success', message: '发布成功!审核通过后将展示', duration: 2500});
            this.$router.replace({
              path: '/post'
            })
          }
        })
      },
      //删除图片
      remove(file, detail){
        deletePic(this.keyList[detail.index]).then(res => {
          this.keyList.splice(detail.index, 1)
        })
      },
      //上传图片
      async afterRead(file, detail){
        file.status = 'uploading'
        if (this.post.id == null){
          await sendPost(this.post).then(res => {
            this.post = res.data
            this.post.status = -1
          })
        }
        await uploadPostPic(this.post.id, file.file).then(res => {
          if (res.code == 200){
            this.keyList.push(res.data.imageId)
            file.status = 'done'
          }else {//上传失败
            file.status = 'failed'
          }
        })
      }
    },

    beforeRouteLeave(to, from, next){
      if (this.post.id != null && this.post.status == -1){
        deletePost(this.post.id).then(res => {
          console.log('删除未完成的post');
        })
      }
      next();
    }
  }
</script>

<style scoped>

</style>

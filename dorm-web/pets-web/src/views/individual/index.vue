<template>
  <div style="background-color: #f5f6f9; height: 100%;width: 100%; top: 0; bottom: 0; position: absolute">
    <van-nav-bar
      title="个人" @click-right="changeUser"  right-text="切换账号">
    </van-nav-bar>

    <div style="padding: 10px;width: 100%; margin-top: 15px">
      <van-row>
        <!--          头像-->
        <van-col span="4" style="margin-left: 15px">
          <van-image
            round v-if="!showUpload"
            width="1.5rem"
            height="1.5rem"
            @click="changeAvatar()"
            :src="url"
          >
            <template v-slot:loading>
              <van-loading type="spinner" size="20" />
            </template>
          </van-image>
          <van-uploader :max-count="1"
                        ref="avatar"
                        v-else
                        v-model="fileList"
                        name="avatar"
                        upload-text="头像上传"
                        :after-read="afterRead"
                        :max-size="10 * 1000 * 1024" @oversize="onOversize"
                        style="display: flex; justify-content: center; align-items: center"
          />
        </van-col>

        <van-col :span="15" :offset="2">
          <div style="text-align: center; font-size: 20px">
            {{userInfo.nickName}}
          </div>
          <div style="margin-top: 20px; color: #646566; text-align: center">
            <div>学号 {{this.userInfo.username}}</div>
          </div>
        </van-col>

      </van-row>
    </div>

    <!--      菜单-->
    <div>
      <van-row style="margin-top: 0.5rem;">
        <van-cell-group inset>
          <van-cell class="item" :to="{name: 'MyDorm'}" size="large" title="我的宿舍" is-link/>
          <van-cell class="item" :to="{name: 'MyRequests'}" size="large" title="我的请假" is-link/>
          <van-cell class="item " :to="{name: 'MyPosts'}" size="large" title="我的反馈" is-link/>
          <van-cell class="item" size="large" title="我的打卡" is-link/>
        </van-cell-group>

        <van-cell-group inset title="卫生检查">
          <van-cell class="item " :to="{name: 'CheckLogRes'}" size="large" title="检查报告" is-link/>
          <van-cell class="item " :to="{name: 'ResGraph'}" size="large" title="检查统计" is-link/>
        </van-cell-group>

        <van-cell-group inset title="报修信息">
          <van-cell class="item" :to="{name: 'MyFixReports'}" size="large" title="我的报修" is-link/>
          <van-cell class="item" :to="{name: 'DormFixReports'}" size="large" title="宿舍报修" is-link/>
        </van-cell-group>
      </van-row>
    </div>
  </div>
</template>

<script>
  import {mapState} from 'vuex'
  import {updateAvatar} from "../../api/file";
  import {Toast} from "vant";
  import user from "../../store/modules/user";
  export default {
    name: "Individual",
    data(){
      return{
        showUpload: false,
        url: this.$store.getters.user.avatar,
        fileList: [],
      }
    },
    methods: {
      changeUser(){
        this.$router.push({
          name: 'Login'
        })
      },
      changeAvatar(){
        this.showUpload = true
      },
      //上传头像
      async afterRead(file) {
        file.status = 'uploading'
        await updateAvatar(this.userInfo.id, file.file).then((res) => {
          this.url  = res.data
          file.status = 'done'
        })
        this.showUpload = false
        let payload = this.userInfo
        payload.avatar = this.url
        this.$store.commit('user/SET_USERINFO', payload)
      },
      onOversize(file) {
        Toast('文件大小不能超过 10Mb')
      },
    },
    computed:{
      ...mapState('user',['userInfo'])
    },
    mounted() {
      // console.log(this.userInfo)
    }

  }
</script>

<style scoped>
  .item{
    background-color: #fff;
    border-color: #DCDEE0;
    border-radius: 8px;
  }
  .van-cell--large .van-cell__title {
    font-size: 18px;
  }
</style>

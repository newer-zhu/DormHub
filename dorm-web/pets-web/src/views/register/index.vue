<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 title="用户注册" left-text="返回" left-arrow>
      <template #right>

      </template>
    </van-nav-bar>
    <van-row>
<!--      头像-->
      <van-row>
        <div>
          <van-uploader :max-count="1"
                        ref="avatar"
                        v-model="fileList"
                        name="avatar"
                        upload-text="头像上传"
                        :after-read="afterRead"
                        @delete="removeAvatar"
                        :max-size="10 * 1000 * 1024" @oversize="onOversize"
                        style="display: flex; justify-content: center; align-items: center"
          />
        </div>
      </van-row>

      <van-row>
        <van-form @submit="registerUser">
          <van-field
            v-model="user.username"
            name="学号"
            label="学号"
            placeholder="学号"
            :rules="[{ required: true, message: '请填写学号' }]"
          />
          <van-field
            v-model="user.nickName"
            name="姓名"
            label="姓名"
            placeholder="真实姓名"
            :rules="[{ required: true, message: '请填写姓名' }]"
          />
          <van-field
            v-model="user.password"
            type="password"
            name="密码"
            label="密码"
            placeholder="密码"
            :rules="[{ required: true, message: '请填写密码' }]"
          />
          <van-field
            v-model="user.phone"
            name="手机号"
            label="手机号"
            placeholder="手机号"
            :rules="[{pattern: rules.phone, required: true, message: '请填写手机号' }]"
          />
          <van-field
            v-model="user.email"
            name="邮箱"
            label="邮箱"
            placeholder="非必填"
            :rules="[{ required: false}]"
          />
          <div style="margin: 16px;">
            <van-button round block type="info" native-type="submit">提交</van-button>
          </div>
        </van-form>
      </van-row>
    </van-row>
  </div>
</template>

<script>
  import {Toast} from "vant";
  import {mapActions} from 'vuex'
  import {deleteAvatar} from "../../api/individual";
  import {uploadAvatar} from "../../api/file";

  export default {
    name: "Register",
    data(){
      return{
        rules: {
          phone: /^1[0-9]{10}$/,
        },
        user:{
          username: '',
          password: '',
          email: '',
          avatar: this.avatarUrl,
          phone: '',
          nickName: ''
        },
        //图片地址前缀
        remoteAddr: '',
        //图片储存的key
        avatarKey: '',
        fileList: [],
      }
    },
    computed: {
      avatarUrl(){
        return this.remoteAddr + this.avatarKey
      }
    },
    methods:{
      ...mapActions('user', ['userRegister']),
      //注册提交
      async registerUser(){
        await this.userRegister(this.user)
        this.$router.replace({
          path: '/login'
        })
      },
      //上传头像
      afterRead(file) {
        file.status = 'uploading'
        uploadAvatar(file.file).then((res) => {
          this.remoteAddr  = res.data.remoteAddr
          this.avatarKey = res.data.key
          this.user.avatar = this.avatarUrl
          file.status = 'done'
        })
      },
      onOversize(file) {
        Toast('文件大小不能超过 10Mb')
      },
      //删除头像
      removeAvatar(file){
        deleteAvatar(this.avatarKey).then((res) => {
          this.user.avatar = this.remoteAddr = this.avatarKey = ''
          Toast.success('移除成功')
        })
      }
    }
  }
</script>

<style scoped>

</style>

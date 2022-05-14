<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 title="登录" left-text="返回" left-arrow>
      <template #right>

      </template>
    </van-nav-bar>

    <van-row>
      <van-form @failed="onFailed" @submit="loginSubmit">
        <van-field
          v-model="user.username"
          name="学号"
          label="学号"
          placeholder="用户名"
          :rules="[{ required: true, message: '请填写用户名' }]"
        />
        <van-field
          v-model="user.password"
          type="password"
          name="密码"
          label="密码"
          placeholder="密码"
          :rules="[{ required: true, message: '请填写密码' }]"
        />
        <div style="margin: 16px;">
          <van-button round block type="info" native-type="submit">登录</van-button>
        </div>
      </van-form>
    </van-row>
    <van-row>
      <van-col :span="8" :offset="16">
        <van-button icon="arrow" to="/register">注册</van-button>
      </van-col>
    </van-row>
  </div>
</template>

<script>
  import {Toast} from 'vant'
  import {mapActions} from 'vuex'
  export default {
    name: "Login",
    components: {},
    data() {
      return {
        user: {
          username: '',
          password: '',
        }
      }
    },
    mounted() {
    },
    computed: {
    },
    methods: {
      ...mapActions('user', ['userLogin']),
      loginSubmit(){
        let _this = this;
        this.userLogin(_this.user).then(() => {
          _this.$router.replace({path: '/individual'})
        })
      },
      onFailed(errorInfo) {
        Toast.fail('出错了~')
      },
    },
  }
</script>

<style scoped>

</style>

<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="公告详情"
                 left-text="返回" left-arrow>
    </van-nav-bar>
    <van-row>
      <div style="margin: 15px 0px 15px 20px; font-size: 30px">
        {{anno.title}}
      </div>
      <div style="margin: 15px 0px 15px 0px; line-height: 20px">
        <span style="margin-left: 25px; font-size: 18px">{{anno.nickName}}</span>
        <span style="float: right;margin-right: 15px; font-size: 16px; color: #646566">{{anno.publishTime}}</span>
      </div>
    </van-row>
    <div>
      <div id="content" v-html="anno.content">

      </div>
    </div>


    <van-row style="margin-top: 20px" type="flex" justify="center">
      <van-col>
        <van-button :disabled="isConfirm" @click="check" style="display: flex; justify-content: center" color="linear-gradient(to right, #ff6034, #ee0a24)">
          {{isConfirm? '已确认':'确认收到'}}
        </van-button>
      </van-col>
    </van-row>

  </div>
</template>

<script>
  import {confirm, getAnnoById} from "../../../api/anno";

  export default {
    name: "AnnoDetail",
    data(){
      return{
        anno: '',
        isConfirm: false
      }
    },
    methods:{
      check(){
        confirm(this.anno.id).then(res => {
          this.$notify({ type: 'success', message: res.msg })
          this.isConfirm = true
        })
      }
    },
    mounted() {
      getAnnoById(this.$route.params.id).then(res=> {
        // console.log(res.data);
        this.anno = res.data
      })
    }
  }
</script>

<style scoped>
  #content{
    width: 95%;
    margin: 0 auto;
    padding: 10px;
    line-height: 28px;
    text-align: start;
    font-size: 22px;
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 10px;
  }
</style>

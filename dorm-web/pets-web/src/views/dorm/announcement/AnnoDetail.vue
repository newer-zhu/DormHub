<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="公告详情"
                 left-text="返回" left-arrow>
    </van-nav-bar>
    <van-row>
      <div style="margin: 15px 0px 0px 20px; font-size: 30px">
        {{anno.title}}
      </div>
      <div style="margin-top: 15px; line-height: 20px">
        <span style="margin-left: 25px; font-size: 18px">{{anno.nickName}}</span>
        <span style="float: right;margin-right: 15px; font-size: 16px; color: #646566">{{anno.publishTime}}</span>
      </div>
    </van-row>
    <div id="content" style="" v-html="anno.content">

    </div>

    <van-row style="margin-top: 20px" type="flex" justify="center">
      <van-col>
        <van-button style="display: flex; justify-content: center" color="linear-gradient(to right, #ff6034, #ee0a24)">
          确认收到
        </van-button>
      </van-col>
    </van-row>

  </div>
</template>

<script>
  import {getAnnoById} from "../../../api/anno";

  export default {
    name: "AnnoDetail",
    data(){
      return{
        anno: ''
      }
    },
    mounted() {
      getAnnoById(this.$route.params.id).then(res=> {
        console.log(res.data);
        this.anno = res.data
      })
    }
  }
</script>

<style scoped>
  #content{
    padding: 18px;
    font-size: 20px;
    line-height: 20px;
    width: 100%
  }
</style>

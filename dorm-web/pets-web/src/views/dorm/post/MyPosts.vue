<template>
  <div>
    <van-sticky>
      <van-nav-bar  @click-right="$router.push('/post/edit')" left-arrow left-text="返回" @click-left="$router.back()"
                    title="我的反馈">
        <template #right><van-icon name="add-o" size="25" /><span style="margin-left: 5px; font-size: 18px">发帖</span></template>
      </van-nav-bar>
    </van-sticky>

    <div>
      <van-tabs v-model="active" sticky>
        <van-tab name="0">
          <template #title> <van-icon name="success" />{{'已通过 '+checkedList.length}}</template>
          <van-cell style="" v-for="(l, i) in checkedList" :key="i" size="large"
                    @click="toPost(l.id)"
                    center :title="l.title" :value="l.time" :label="desc(l.content)" />
        </van-tab>
        <van-tab name="1">
          <template #title> <van-icon name="circle" />{{'审核中 '+checkingList.length}}</template>
          <van-cell style="" v-for="(l, i) in checkingList" :key="i" size="large"
                    @click="toPost(l.id)"
                    center :title="l.title" :value="l.time" :label="desc(l.content)" />
        </van-tab>
        <van-tab name="2">
          <template #title> <van-icon name="cross" />{{'未通过 '+failedList.length}}</template>
          <van-cell style="" v-for="(l, i) in failedList" :key="i" size="large"
                    @click="toPost(l.id)"
                    center :title="l.title" :value="l.time" :label="desc(l.content)" />
        </van-tab>
      </van-tabs>


    </div>
  </div>
</template>

<script>
  import {getPostByUserId} from "../../../api/post";

  export default {
    name: "MyPosts",
    data(){
      return{
        checkedList: [],
        failedList: [],
        checkingList: [],
        active: '0'
      }
    },
    mounted() {
      getPostByUserId(this.$store.getters.user.id).then(res => {
        console.log(res.data);
        this.checkedList = res.data.checked
        this.failedList = res.data.failed
        this.checkingList = res.data.unchecked
      })
    },
    methods:{
      desc(con){
        if (con.length > 50){
          return con.substr(0, 25)+'...'
        }else {
          return con
        }
      },
      toPost(id){
        this.$router.push({name: 'PostDetail', params: {id: id}})
      }
    }
  }
</script>

<style scoped>

</style>
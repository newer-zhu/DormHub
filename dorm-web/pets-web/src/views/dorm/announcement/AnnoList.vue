<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="公告列表"
                 left-text="返回" left-arrow>
    </van-nav-bar>

    <van-list
      v-model:loading="loading"
      :finished="finished"
      finished-text="没有更多了"
      @load="onLoad"
    >
      <van-cell @click="toAnnoDetail(item.id)" v-for="item in list" :key="item.id"
                :title="item.title" :value="item.publishTime" :label="item.nickName">

      </van-cell>
    </van-list>
  </div>
</template>

<script>
  import {getAnnoPage} from "../../../api/anno";

  export default {
    name: "AnnoList",
    data(){
      return{
        finished: false,
        loading: true,
        list: []
      }
    },
    methods:{
      toAnnoDetail(id){
        this.$router.push({name: 'AnnoDetail', params: {id: id}})
      },
      onLoad(){

      },
      load(cur){
        getAnnoPage(cur).then(res => {
          console.log(res.data);
          res.data.records.forEach(f => {
            this.list.push(f)
          })
          this.loading = false
          this.finished = res.data.current == res.data.pages
        })
      }
    },
    mounted() {
      this.load(1)
    }
  }
</script>

<style scoped>

</style>

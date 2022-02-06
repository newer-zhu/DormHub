<template>
  <div>
    <van-card
      @click="toFixDetail(r.id)"
      v-for="(r,i) in list"
      :key="i"
      :num="r.num"
      :desc="desc(r.detail)"
      :title="r.thing"
      :thumb="r.images.length? r.images[0].url : require('@/assets/img/fix/request.png')"
    >
      <template #tags>
        <van-tag style="margin-top: 10px" size="medium" plain type="danger">{{emergency(r.priority)}}</van-tag>
      </template>
      <template #footer>
        <van-button :disabled="r.status!=0" type="info" size="mini">{{r.status==0? '报修中' : '已完成'}}</van-button>
      </template>
    </van-card>
  </div>
</template>

<script>
  export default {
    name: "FixList",
    methods:{
      desc(d){
        if (d.length < 15)
          return d
        else
          return d.substr(0,13) + '...'
      },
      emergency(e){
        switch (e) {
          case 0:
            return '非常紧急'
          case 1:
            return '急迫'
          case 2:
            return '较急'
          case 3:
            return '不急'
        }
      },
      toFixDetail(id){
        this.$router.push({name: 'FixDetail', params: {id}})
      }
    },
    props:{
      list:{
        type: Array,
        default: []
      }
    },
    mounted() {
      console.log(this.list);
    }
  }
</script>

<style scoped>
  .van-card__title {
    margin-bottom: 5px;
    font-size: 16px;
    max-height: 36px;
    font-weight: 500;
    line-height: 16px;
  }
</style>

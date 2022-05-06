<template>
  <div>
    <van-nav-bar
      title="假条列表"
      left-text="返回"
      left-arrow
      @click-left="$router.back()"
    />

    <van-skeleton title :row="3" :loading="loading">
      <LeaveList :is-admin="isAdmin" :lists="lists"/>
    </van-skeleton>

  </div>
</template>

<script>
  import LeaveList from "../../../components/leave/LeaveList";
  import {getRequests} from "../../../api/leave";
  export default {
    name: "MyRequests",
    components:{LeaveList},
    data(){
      return{
        loading: true,
        lists: [],
        isAdmin: false
      }
    },
    mounted() {
      /**
       * 学生进入页面
       */
      getRequests('?proposer='+this.$store.getters.user.id).then(res => {
        this.isAdmin = false;
        this.lists = res.data
        // console.log(res.data)
      })
      this.loading = false
    }
  }
</script>

<style scoped>

</style>

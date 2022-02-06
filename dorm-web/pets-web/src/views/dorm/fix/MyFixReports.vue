<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="我的报修"
                 left-text="返回" left-arrow>
    </van-nav-bar>

    <van-skeleton title avatar :loading="loading" :row="3">
      <div>
        <van-empty
          v-if="list.length == 0"
          class="custom-image"
          image="https://img01.yzcdn.cn/vant/custom-empty-image.png"
          description="暂无你的报修记录"
        />
        <FixList v-else :list="list" />
      </div>
    </van-skeleton>

  </div>
</template>

<script>
  import {getReportsByUserId} from "../../../api/fix";
  import FixList from "../../../components/fix/FixList";

  export default {
    name: "MyFixReports",
    components: {FixList},
    data(){
      return{
        loading: true,
        list: []
      }
    },
    mounted() {
      getReportsByUserId(this.$store.getters.user.id).then(res => {
        this.list = res.data
      })
      this.loading = false
    },

  }
</script>

<style scoped>

</style>
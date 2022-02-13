<template>
  <div>
    <el-row style="margin-top: 20px">
      <el-col :span="22" :offset="1">
        <el-tabs type="border-card">
          <el-tab-pane :label="'未处理('+unresolved.length+')'">
            <RequestTable :table-data="unresolved"/>
          </el-tab-pane>
          <el-tab-pane :label="'已处理'+solved.length+')'">
            <RequestTable :table-data="solved"/>
          </el-tab-pane>
        </el-tabs>
      </el-col>
    </el-row>

  </div>
</template>

<script>
  import {getRequests} from '../../api/leave'
  import RequestTable from './component/RequestTable'

  export default {
    name: 'LeaveRequest',
    components: { RequestTable },
    data(){
      return{
        //已通过
        passed: [],
        //未通过
        failed: [],
        //未处理
        unresolved: [],
        //已销假
        finished: [],
        solved: [],
        data: []
      }
    },
    methods:{},
    mounted() {
      getRequests(this.$store.getters.userInfo.id).then(res => {
        res.data.forEach( f => {
          if (f.status === 0){
            this.unresolved.push(f)
          }else if (f.status !== 0){
            this.solved.push(f)
          }
          // else if (f.status === 1){
          //   this.passed.push(f)
          // }else if (f.status === -1){
          //   this.failed.push(f)
          // } else if (f.status === 2){
          //   this.failed.push(f)
          // }
        })
        this.data = this.unresolved
      })
    }
  }
</script>

<style scoped>

</style>

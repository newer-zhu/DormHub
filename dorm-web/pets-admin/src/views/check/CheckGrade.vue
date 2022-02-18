<template>
  <div>
    <el-row style="margin-top: 20px">
      <el-col :offset="1" :span="5">
        <el-date-picker
          v-model="searchConfig.checkTime"
          align="right"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择日期"
          :picker-options="pickerOptions">
        </el-date-picker>
      </el-col>
      <el-col :span="4">
        <el-input placeholder="请输入寝室楼号" v-model="searchConfig.buildingId"></el-input>
      </el-col>
      <el-col :span="5" style="margin-left: 15px">
        <el-input placeholder="请输入寝室门牌号" v-model="searchConfig.dormId"></el-input>
      </el-col>
      <el-col :span="3" style="margin-left: 15px">
        <el-button @click="searchInfo" icon="el-icon-search" type="primary">查询</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getTimes, search } from '../../api/check'
  import { parseTime } from '../../utils'
  let moment = require('moment');
  export default {
    name: 'CheckGrade',
    data() {
      return {
        //检查时间
        times: [],
        pickerOptions: {
          disabledDate: (time) => {
            const s = moment(time).format('yyyy-MM-DD').toString()
            return this.times.indexOf(s) < 0
          },
          shortcuts: [
            {
            text: '今天',
            onClick(picker) {
              picker.$emit('pick', new Date());
            }
          }, {
            text: '昨天',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit('pick', date);
            }
          }, {
            text: '一周前',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', date);
            }
          }]
        },
        searchConfig: {
          checkTime: '',
          buildingId: '',
          dormId: ''
        },
      };
    },
    methods:{
      searchInfo(){
        search(1, this.searchConfig).then(res => {
          console.log(res.data)
        })
      }
    },
    mounted() {
      getTimes().then(res => {
        this.times = res.data
        console.log(res.data)
      })
    }
  }
</script>

<style scoped>

</style>

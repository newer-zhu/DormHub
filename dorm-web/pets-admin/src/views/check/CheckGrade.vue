<template>
  <div>
<!--    搜索栏-->
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
<!--    表格-->
    <el-row style="margin-top: 40px;">
      <el-col :offset="1" :span="14">
        <el-table
          border
          :data="tableData"
          style="width: 100%">
          <el-table-column
            prop="buildingId"
            label="宿舍楼号">
          </el-table-column>
          <el-table-column
            prop="dormId"
            label="门牌号">
          </el-table-column>
          <el-table-column
            prop="totalScore"
            sortable
            label="总得分">
          </el-table-column>
          <el-table-column
            prop="checkUsername"
            label="检查人学号">
          </el-table-column>
          <el-table-column
            prop="checkTime"
            label="检查日期">
          </el-table-column>
          <el-table-column
            label="操作">
            <template slot-scope="scope">
              <el-button @click="detail(scope.row.targetDorm, scope.row.checkTime)" type="primary">查看</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
      <el-col :span="7">
        <el-card style="margin-left: 25px">
          <el-descriptions v-if="detailInfo" title="检查项细则" :column="1" border>
            <el-descriptions-item label="排名" label-class-name="rank-label" :content-style="{fontSize: '15px'}">
              {{detailInfo.rank + ' / ' + detailInfo.total}}
            </el-descriptions-item>
            <el-descriptions-item v-for="(d,i) in detailInfo.itemScores" :key="d.itemId" :label="d.item">
              {{d.score + ' / ' + d.itemScore}}
            </el-descriptions-item>
          </el-descriptions>
          <el-empty description="检查项细则" v-else></el-empty>
        </el-card>
      </el-col>
    </el-row>
<!--    分页-->
    <el-row style="margin-top: 40px">
      <el-col :offset="5" :span="18">
        <el-pagination
          :current-page="cur"
          background
          @current-change="change"
          layout="prev, pager, next"
          :page-count="pages">
        </el-pagination>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getCheckReport, getTimes, search } from '../../api/check'
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
        tableData: [],
        cur: 1,
        pages: 1,
        detailInfo: ''
      };
    },
    methods:{
      searchInfo(){
        search(this.cur, this.searchConfig).then(res => {
          console.log(res.data)
          this.tableData = res.data.records
          this.pages = res.data.pages
        })
      },
      change(cur){
        this.searchInfo(cur)
      },
      detail(dormId, time){
        getCheckReport(dormId, time).then(res => {
          console.log(res.data)
          this.detailInfo = res.data
        })
      }
    },
    mounted() {
      getTimes().then(res => {
        this.times = res.data
        if (this.times.length !== 0){
          this.searchConfig.checkTime = this.times[0]
          this.searchInfo()
        }
      })
    }
  }
</script>

<style>
  .rank-label{
    font-size: 16px;
    color: #ffffff !important;
    font-weight: 600 !important;
    background-color: #3f9dfe !important;
  }
</style>

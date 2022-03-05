<template>
  <div>
    <el-row>
      <el-col :span="12">
        <div id="lineChart" style="width: 100%; height: 400px; margin: 20px 0px 0px 20px"></div>
      </el-col>
      <el-col :span="12">
        <div id="columnChart" style="width: 100%; height: 400px; margin: 20px 0px 0px 20px"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getLastTenAvgScores, getTenMaxScores } from '../../api/check'
  // import {BarChart} from 'echarts/charts'
  import * as echarts from 'echarts';
  // 引入基本模板
  // let echarts = require('echarts/lib/echarts')
  // require('echarts/lib/chart/line')
  // require('echarts/lib/component/grid')
  // require('echarts/lib/component/tooltip')
  // require('echarts/lib/component/title')
  // require('echarts/charts')
  export default {
    name: 'CheckDataPanel',
    data(){
      return{
      }
    },
    methods:{
      drawLine(){
        // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('lineChart'))
        getLastTenAvgScores().then(res => {
          console.log(res.data)
          myChart.setOption({
            title: { text: '近期检查平均分走势图' },
            xAxis: {
              type: 'category',
              data: res.data.xaxis
            },
            yAxis: {
              type: 'value'
            },
            series: [
              {
                data: res.data.yaxis,
                type: 'line',
                smooth: true,
                label: {
                  show: true,
                  position: 'bottom',
                  textStyle: {
                    fontSize: 20
                  }
                }
              },
            ]
          });
        })

      },
      drawColumn(){
        let columnChart = echarts.init(document.getElementById('columnChart'))
        getTenMaxScores().then(res => {
          columnChart.setOption({
            title: { text: '近期检查得分最高分' },
            xAxis: {
              type: 'category',
              data: res.data.xaxis
            },
            yAxis: {
              type: 'value'
            },
            series: [
              {
                data: res.data.yaxis,
                type: 'bar',
                smooth: true,
                label: {
                  show: true, //开启显示
                  position: 'top', //在上方显示
                  textStyle: { //数值样式
                    color: 'black',
                    fontSize: 16
                  }
                }
              },
            ]
          });
        })
      }
    },
    mounted() {
      this.drawLine()
      this.drawColumn()
    }
  }
</script>

<style scoped>

</style>

<template>
  <div>
    <el-row>
      <el-col :span="12">
        <div id="lineChart" style="width: 100%; height: 400px; margin: 20px 0px 0px 50px"></div>
      </el-col>
      <el-col :span="12">
        <div id="columnChart" style="width: 100%; height: 400px; margin: 20px 0px 0px 20px"></div>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="12">
        <div id="pieChart" style="width: 100%; height: 400px; margin: 20px 0px 0px 50px"></div>
      </el-col>
      <el-col :span="12">
        <div id="rankCharts" style="width: 100%; height: 400px; margin: 20px 0px 0px 50px"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getLastTenAvgScores, getTenMaxScores, getScoresAccount, getRankedScores } from '../../api/check'
  import * as echarts from 'echarts';
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
      },
      drawRankedCol(){
        var chartDom = echarts.init(document.getElementById('rankCharts'))
        getRankedScores().then(res => {
          chartDom.setOption({
            title: {
              text: '寝室平均分排名'
            },
            tooltip: {
              trigger: 'axis',
              axisPointer: {
                type: 'shadow'
              }
            },
            grid: {
              left: '3%',
              right: '4%',
              bottom: '3%',
              containLabel: true
            },
            xAxis: [
              {
                type: 'category',
                data: res.data.xaxis,
                axisTick: {
                  alignWithLabel: true
                }
              }
            ],
            yAxis: [
              {
                type: 'value'
              }
            ],
            series: [
              {
                name: 'Direct',
                type: 'bar',
                barWidth: '60%',
                data: res.data.yaxis,
                itemStyle: {
                  normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                      offset: 0,
                      color: '#ba7ef3'
                    }, {
                      offset: 1,
                      color: '#965df2'
                    }]),
                  }
                },
              }
            ],

          });
        })
      },
      drawPie(){
        let columnChart = echarts.init(document.getElementById('pieChart'))
        getScoresAccount().then(res => {
          columnChart.setOption({
            title: {
              text: '检查结果分数占比',
              subtext: '上期',
              left: 'center'
            },
            tooltip: {
              trigger: 'item'
            },
            legend: {
              orient: 'vertical',
              left: 'left'
            },
            series: [
              {
                name: '分数位段占比',
                type: 'pie',
                radius: '50%',
                data: res.data,
                emphasis: {
                  itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
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
      this.drawPie()
      this.drawRankedCol()
    }
  }
</script>

<style scoped>

</style>

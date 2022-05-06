<template>
  <div>
    <div v-loading.fullscreen.lock="fullscreenLoading">
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
  </div>
</template>

<script>
  import { getLastTenAvgScores, getTenMaxScores, getScoresAccount, getRankedScores } from '../../api/check'
  import * as echarts from 'echarts';
  export default {
    name: 'CheckDataPanel',
    data(){
      return{
        fullscreenLoading: true,

        lineData: '',
        pieData: '',
        columnData: '',
        rankData: ''
      }
    },
    methods:{
      async drawLine(){
        // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('lineChart'))
        myChart.setOption({
          title: { text: '近期检查平均分走势图' },
          xAxis: {
            type: 'category',
            data: this.lineData.xaxis
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              data: this.lineData.yaxis,
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
      },
      async drawColumn(){
        let columnChart = echarts.init(document.getElementById('columnChart'))
        columnChart.setOption({
          title: { text: '近期检查得分最高分' },
          xAxis: {
            type: 'category',
            data: this.columnData.xaxis
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              data: this.columnData.yaxis,
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
      },
      async drawRankedCol(){
        let chartDom = echarts.init(document.getElementById('rankCharts'))
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
              data: this.rankData.xaxis,
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
              data: this.rankData.yaxis,
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
      },
      async drawPie(){
        let columnChart = echarts.init(document.getElementById('pieChart'))
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
              data: this.pieData,
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

      },

      async init(){
        await getScoresAccount().then(res => {
          this.pieData = res.data
        })
        await getRankedScores().then(res => {
          this.rankData = res.data
        })
        await getTenMaxScores().then(res => {
          this.columnData = res.data
        })
        await getLastTenAvgScores().then(res => {
          this.lineData = res.data
        })

        this.drawPie()
        this.drawRankedCol()
        this.drawColumn()
        this.drawLine()
      }
    },
    mounted() {
      this.init()
      this.fullscreenLoading = false
    }
  }
</script>

<style scoped>

</style>

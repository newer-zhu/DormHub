<template>
  <div>
    <div style="width: 100%; height: 300px;margin: 0 auto;" id="transCharts">

    </div>

    <div style="width: 100%;margin: 0 auto;">
      <el-row>
        <el-col :span="7" :offset="1">
          <div>
            <el-card style="height: 200px">
              <el-row>
                <el-col :span="9"><el-tag>当前在线人数</el-tag></el-col>
                <el-col :span="12">
                  <el-avatar style="font-size: 50px; font-weight: 700;margin: 0 auto" :size="100">{{$store.state.chat.onlineUserNum}}</el-avatar>
                </el-col>
              </el-row>
            </el-card>
            <el-alert
              :closable="false"
              show-icon
              effect="dark"
              style=""
              title="此为后台管理页面，移动端请见项目代码"
              type="info">
            </el-alert>
          </div>

          <div style="width: 100px; margin: 0 auto;margin-top: 100px">
            <el-link  href="https://github.com/newer-zhu/DormHub" target="_blank">GitHub项目地址</el-link>
          </div>
        </el-col>

        <el-col :span="4" :offset="1">
          <img style="width: 100%; height: 450px" src="../../assets/img/example.png">
        </el-col>

        <el-col :span="9" :offset="1">
          <el-card class="box-card">
            <div slot="header">
              <span>近7天登录日志</span>
            </div>
            <div v-for="(log,i) in logs" :key="i" >
              <el-link  :underline="false" class="text item">
                {{log}}
              </el-link>
            </div>
          </el-card>
        </el-col>
      </el-row>



    </div>
  </div>
</template>

<script>
  import * as echarts from 'echarts';
  import { getLoginLogs } from '../../api/log'

  export default {
    name: 'Home',
    data(){
      return{
        logs: []
      }
    },
    methods:{
      draw(){
        var chartDom = document.getElementById('transCharts');
        var myChart = echarts.init(chartDom);
        var option;

        option = {
          graphic: {
            elements: [
              {
                type: 'text',
                left: 'center',
                top: 'center',
                style: {
                  text: 'Dorm Hub',
                  fontSize: 80,
                  fontWeight: 'bold',
                  lineDash: [0, 200],
                  lineDashOffset: 0,
                  fill: 'transparent',
                  stroke: '#000',
                  lineWidth: 1
                },
                keyframeAnimation: {
                  duration: 3000,
                  loop: true,
                  keyframes: [
                    {
                      percent: 0.7,
                      style: {
                        fill: 'transparent',
                        lineDashOffset: 200,
                        lineDash: [200, 0]
                      }
                    },
                    {
                      // Stop for a while.
                      percent: 0.8,
                      style: {
                        fill: 'transparent'
                      }
                    },
                    {
                      percent: 1,
                      style: {
                        fill: 'black'
                      }
                    }
                  ]
                }
              }
            ]
          }
        };

        option && myChart.setOption(option);
      },
    },
    mounted() {
      this.draw()
      getLoginLogs().then(res => {
        this.logs = res.data
      })
    }
  }
</script>

<style scoped>
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 12px;
    margin-right: 10px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 100%;
    height: 500px;
  }
</style>

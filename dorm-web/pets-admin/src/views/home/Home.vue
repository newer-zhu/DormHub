<template>
  <div>
    <div style="width: 100%; height: 300px;margin: 0 auto;" id="transCharts">

    </div>

    <div style="width: 100px; margin: 0 auto;">
      <el-link  href="https://github.com/newer-zhu/DormHub" target="_blank">GitHub项目地址</el-link>
    </div>

    <div style="width: 500px;margin: 0 auto; margin-top: 100px">
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

  </div>
</template>

<script>
  import * as echarts from 'echarts';

  export default {
    name: 'Home',
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
    }
  }
</script>

<style scoped>

</style>

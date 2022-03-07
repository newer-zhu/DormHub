<template>
  <div>
    <div style="width: 100%; height: 300px" id="transCharts">

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

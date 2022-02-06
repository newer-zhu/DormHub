<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 title="卫生检查数据分析" left-text="返回" left-arrow>
    </van-nav-bar>

    <van-skeleton title :row="5" :loading="loading">
      <div>
        <div v-if="!analysis">
          <van-image :src="require('../../../assets/img/inspection/empty.png')" />
          <div style="font-size: 24px; text-align: center; color: #9e9e9e">暂无记录</div>
        </div>

        <div v-else>
          <van-cell title="近7次检查得分" icon="chart-trending-o" :clickable="false" is-link arrow-direction="down" />
          <div class="chart-container">
            <canvas id="myChart"></canvas>
          </div>

          <van-cell title="得分数据" icon="aim" style="margin-top: 40px;" :clickable="false" is-link arrow-direction="down" />
          <div>
            <van-row type="flex" justify="space-around" style="margin-top: 10px;">
              <van-col :span="8">
                <van-circle
                  style="width: 100%"
                  v-model="analysis.maxScore"
                  :stroke-width="70"
                  :text="String(analysis.maxScore)"
                />
                <div style="text-align: center; margin-top: 10px">最高得分</div>
              </van-col>
              <van-col :span="8">
                <van-circle
                  style="width: 100%"
                  color="#07C160"
                  v-model="analysis.minScore"
                  :stroke-width="70"
                  :text="String(analysis.minScore)"
                />
                <div style="text-align: center; margin-top: 10px">最低得分</div>
              </van-col>
            </van-row>
            <van-row  type="flex" style="margin-top: 20px" justify="space-around">
              <van-col :span="8">
                <van-circle
                  style="width: 100%"
                  color="#ED6A0C"
                  v-model="analysis.average"
                  :stroke-width="70"
                  :text="String(analysis.average)"
                />
                <div style="text-align: center; margin-top: 10px">平均得分</div>
              </van-col>
              <van-col :span="8">
                <van-circle
                  style="width: 100%"
                  color="#EE0A24"
                  v-model="analysis.fail"
                  :stroke-width="70"
                  :text="String(analysis.fail)"
                />
                <div style="text-align: center; margin-top: 10px">不及格数</div>
              </van-col>

            </van-row>
          </div>
        </div>
      </div>
    </van-skeleton>

  </div>
</template>


<script>
  import Chart from '../../../plugins/chart/chart.min'
  import {getAnalysis} from "../../../api/inspection";
  export default {
    name: "ResGraph",
    data(){
      return{
        analysis: {},
        loading: true
      }
    },
    computed:{
    },
    mounted() {
      getAnalysis(this.$store.getters.user.dormId).then(res => {
        this.analysis = res.data
        // console.log(this.analysis);
        if (this.analysis){
          //绘制折线图
          this.initGraph()
        }
      })
      this.loading = false
    },
    methods:{
      initGraph(){
        const ctx = document.getElementById("myChart").getContext('2d');
        let myLineChart = new Chart(ctx, {
          type: "line",
          data: {
            datasets: [{
              label: '得分',
              data: this.analysis.points,
              borderColor: '#576B95',
              backgroundColor: '#576B95'
            }]
          },
          options: {
            title: {
              display: true,
              text: "近7次得分"
            },
            // 图表不会响应除click之外的事件
            events: ['click'],
          }
        });
      },
    }
  }
</script>

<style scoped>
  .chart-container{
    width: 100%;
  }
  /deep/ .van-circle__text{
    font-size: 24px;
  }
</style>
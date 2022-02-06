<template>
  <div :style="timeList.length!=0? 'background-color: #F2F3F6':'background-color: E8EBF1'">
    <van-nav-bar @click-left="$router.back()" right-text="选择时间" @click-right="show=true"
                 title="得分" left-text="返回" left-arrow>
    </van-nav-bar>

    <van-skeleton title :row="8" :loading="loading">
      <div>
        <div v-if="timeList.length != 0">
          <van-popup  position="top" v-model="show">
            <van-picker
              title="选择时间"
              show-toolbar
              :columns="timeList"
              @confirm="onConfirm"
              @cancel="onCancel"
            />
          </van-popup>


          <van-row type="flex" justify="center">
            <van-circle
              style="margin-top: 25px"
              v-model="result.totalScore"
              :rate="30"
              :color="gradientColor"
              :text="String(result.totalScore)"
              :stroke-width="90"
              size="120px"
            />
          </van-row>

          <van-cell-group  title="得分情况">
            <van-cell v-for="(i, index) in result.itemScores" :key="index" value-class="score"
                      :title="i.item" :value="i.score+' / '+i.itemScore" icon="label-o" />
          </van-cell-group>

          <van-cell-group style="padding-bottom: 30px" title="详细信息">
            <van-cell class="detail" title="检查人学号" :value="result.checkUsername" icon="smile" />
            <van-cell class="detail" title="检查时间" :value="result.checkTime" icon="underway" />
            <van-cell class="detail" title="本次排名" :value="result.rank+' / '+result.total" icon="ascending" />
          </van-cell-group>
        </div>

        <div v-else>
          <van-image :src="require('../../../assets/img/inspection/empty.png')" />
          <div style="font-size: 24px; text-align: center; color: #9e9e9e">暂无记录</div>
        </div>
      </div>
    </van-skeleton>

  </div>
</template>

<script>
  import {getCheckLogRes, getLogTime} from "../../../api/inspection";
  import {mapState} from "vuex";
  import user from "../../../store/modules/user";
  export default {
    name: "CheckLogRes",
    computed:{
      ...mapState('user',['userInfo'])
    },
    data(){
      return{
        loading: true,
        result: {},
        gradientColor: {
          '0%': '#3fecff',
          '100%': '#6149f6',
        },
        show: false,
        timeList: [],
        time: ''
      }
    },
    mounted() {
      const _this = this
      getLogTime(this.userInfo.dormId).then(res => {
        this.timeList = res.data
        if (this.timeList.length > 0){
          this.time = this.timeList[0]
          getCheckLogRes(this.userInfo.dormId, this.time).then(re => {
            _this.result = re.data
            console.log(_this.result);
          })
        }
      })
      this.loading = false
    },
    methods:{
      async onConfirm(value, index){
        if (value != this.time){
          this.time = value
          await getCheckLogRes(this.userInfo.dormId, this.time).then(res => {
            this.result = res.data
          })
        }
        this.show = false
      },
      onCancel(){
        this.show = false
      }
    }
  }
</script>

<style scoped>
  /deep/ .van-circle__text{
    font-size: 50px;
    color: #323233;
  }
  .score{
    font-size: 18px;
    color: #ee0a24;
  }
  .van-cell{
    font-size: 16px;
  }
  .detail{
    color: #576B95;
  }
</style>
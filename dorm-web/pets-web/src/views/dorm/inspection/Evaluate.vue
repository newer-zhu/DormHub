<template>
  <div>
    <van-nav-bar @click-left="$router.back()"
                 :title="dorm.buildingId+'-'+dorm.dormId+'宿舍评分'" left-text="返回" left-arrow>
    </van-nav-bar>

    <van-collapse v-model="activeNames">
      <van-collapse-item title-class="title" v-for="(it, i) in checkItems" :key="i" :name="it.item">
        <template #title>
          <div>{{it.item}}</div>
        </template>
        <van-cell-group>
          <van-cell v-for="(sub_it,key) in it.childrenItem"
                    :key="key" :title="'分值('+sub_it.limitScore+')'" :label="sub_it.item">
            <template #right-icon>
              <van-stepper min="0" :max="sub_it.limitScore" v-model="sub_it.score" />
            </template>
          </van-cell>
        </van-cell-group>
      </van-collapse-item>
    </van-collapse>

    <van-row style=" padding-bottom: 40px">
      <van-progress style="margin-top: 0.2rem" color="#f2826a" :percentage="scorePercent" />

      <van-field
        style="margin-top: 0.4rem"
        :clearable="true"
        v-model="checkLog.note"
        rows="2"
        autosize
        label="备注"
        type="textarea"
        maxlength="50"
        placeholder="给出过高过低评分时务必加上备注"
        show-word-limit
      />

      <van-button @click="submit" style="width: 60%;margin-left: 20%;margin-top: 30px" size="large" type="info">提交</van-button>
    </van-row>
  </div>
</template>

<script>
  import {getCheckItem, sendCheckLog} from "../../../api/inspection";
  import {Toast} from 'vant'
  export default {
    name: "Evaluate",
    data(){
      return{
        checkItems: [],
        activeNames: [],
        checkLog: {
          targetDorm: '',
          note: '',
          itemScores: [],
          totalScore: '',
          checkUser: ''
        },
        dorm: {}
      }
    },
    mounted() {
      let _this = this;
      getCheckItem().then(res => {
        this.checkItems = res.data
        this.checkItems.forEach(i => {
          _this.activeNames.push(i.item)
          //新增一个属性，为每项满分分值，而score为评分
          _this.$set(i, 'limitScore', i.score)
          i.childrenItem.forEach(sub_i =>{
            //新增一个属性，为每项满分分值，而score为评分
            _this.$set(sub_i, 'limitScore', sub_i.score)
            //默认得分为及格分
            sub_i.score = Math.ceil(sub_i.score * 0.6)
          })
        })
      })

      this.dorm = JSON.parse(this.$route.params.dorm)
    },
    computed:{
      scorePercent(){
        let count = 0
        this.checkItems.forEach(i => {
          i.childrenItem.forEach(sub_i => {
            count += sub_i.score
          })
        })
        return count
      }
    },
    methods:{
      submit(){
        this.checkLog.targetDorm = this.dorm.id
        this.checkLog.totalScore = this.scorePercent
        for (let i = 0; i < this.checkItems.length; i++) {
          for (let j = 0; j < this.checkItems[i].childrenItem.length; j++) {
            //构造子检查项
            let itemScore = {
              itemId: this.checkItems[i].childrenItem[j].id,
              score: this.checkItems[i].childrenItem[j].score,
              parentItem: this.checkItems[i].childrenItem[j].parentItem,
            }
            this.checkLog.itemScores.push(itemScore)
          }
        }
        // console.log(this.checkLog);
        sendCheckLog(this.checkLog).then(res => {
          // 成功通知
          Toast.success(res.msg)
          this.$router.back()
        })
      }
    }
  }
</script>

<style >
  .van-cell__label {
    color: #757778;
    font-size: 15px;
  }
  .title{
    color: #323233;
    font-size: 18px;
  }
</style>
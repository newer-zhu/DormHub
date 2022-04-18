<template>
  <div>
    <van-sticky>
      <van-dropdown-menu>
        <van-dropdown-item @change="getDormsDataByBuildingId" title="楼号" v-model="selectBuilding" :options="buildingID"/>
        <van-dropdown-item @change="getDormsByFloor" title="层数" v-model="selectFloor" :options="floorID"></van-dropdown-item>
      </van-dropdown-menu>
    </van-sticky>

    <van-grid clickable :gutter="20" :column-num="2" style="margin-top: 20px; padding-bottom: 80px">
      <van-grid-item v-for="dorm in displayFloor" :key="dorm.id" @click="toEvaluate(dorm)"
                     :icon="require('../../../assets/img/门牌.png')" :text="dorm.dormId" />
    </van-grid>

  </div>
</template>

<script>
  import {getDormsByBuildingId, getBuildingId} from "../../../api/dorm";

  export default {
    name: "Inspection",
    data(){
      return{
        selectBuilding: '',
        selectFloor: 1,
        //楼号下拉框
        buildingID: [],
        //层数下拉框
        floorID: [],
        //一栋楼的寝室
        displayData:[],
        //一层楼的寝室
        displayFloor: []
      }
    },
    mounted() {
      getBuildingId().then(res => {
        if (res.data){
          this.selectBuilding = res.data[0]

          res.data.forEach(data => {
            this.buildingID.push({ text: data , value: data})
          })
          this.getDormsDataByBuildingId(this.selectBuilding)
        }
      })
      this.getDormsByFloor(1)
    },
    methods:{
      async getDormsDataByBuildingId(bid){
        await getDormsByBuildingId(bid).then(res => {
          this.floorID = []
          this.displayData = res.data
          let pre = -1
          for (let i = 0; i < this.displayData.length; i++) {
            if (this.displayData[i].floor != pre){
              pre = this.displayData[i].floor
              this.floorID.push({text: pre + '层', value: pre})
            }
          }
          this.getDormsByFloor(1)
        })
      },

      async getDormsByFloor(floor){
        this.displayFloor = []
        this.displayData.forEach(data => {
          if (floor == data.floor){
            this.displayFloor.push(data)
          }
        })
      },
      toEvaluate(dorm){
        this.$router.push({
          name: 'Evaluate',
          params:{
            dorm: JSON.stringify(dorm)
          }
        })
      }
    }
  }
</script>

<style scoped>
  /deep/ .van-grid-item__text {
    font-weight: 600;
    color: #646566;
    font-size: 16px;
  }
</style>

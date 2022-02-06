<template>
  <div>
    <van-sticky>
      <van-dropdown-menu>
        <van-dropdown-item title="楼号" v-model="selectBuilding" :options="buildingID"/>
        <van-dropdown-item title="层数" v-model="selectFloor" :options="floorID"></van-dropdown-item>
      </van-dropdown-menu>
    </van-sticky>

    <van-grid clickable :gutter="20" :column-num="2" style="margin-top: 20px; padding-bottom: 80px">
      <van-grid-item v-for="dorm in displayFloor" :key="dorm.id" @click="toEvaluate(dorm)"
                     :icon="require('../../../assets/img/门牌.png')" :text="dorm.dormId" />
    </van-grid>

  </div>
</template>

<script>
  import {getAllDorms} from "../../../api/dorm";

  export default {
    name: "Inspection",
    data(){
      return{
        selectBuilding: '1',
        selectFloor: 1,
        //楼号下拉框
        buildingID: [
          { text: '1号楼' , value: '1'}
        ],
        //层数下拉框
        floorID: [],
        //一栋楼的寝室按层分类的数据
        displayData:[]
      }
    },
    mounted() {
      const _this = this;
      getAllDorms(this.selectBuilding).then(res => {
        //把返回的所有寝室按层分类
        res.data.map(mapItem => {
          if (_this.displayData.length == 0){
            _this.displayData.push({floor: mapItem.floor, List: [mapItem]})
          }else {
            //some方法，遍历数组每个元素，返回true时停止遍历
            let res = _this.displayData.some(item => {
              if (item.floor === mapItem.floor){
                item.List.push(mapItem)
                return true
              }
            })
            //如果没找到相同层数的添加一个新对象
            if (!res){
              _this.displayData.push({floor: mapItem.floor, List: [mapItem]})
            }
          }
        })
        for (let i = 1; i < this.displayData.length + 1; i++) {
          this.floorID.push({text: i + '层', value: i})
        }
        // console.log(this.floorID);
        // console.log(this.displayData);
      })
    },
    computed:{
      //按层展示的数据
      displayFloor(){
        let res = []
        this.displayData.forEach(data => {
          if (this.selectFloor === data.floor){
            res = data.List
          }
        })
        return res
      }
    },
    methods:{
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
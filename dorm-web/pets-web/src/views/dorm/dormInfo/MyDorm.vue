<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="我的宿舍"
                 left-text="返回" left-arrow>
    </van-nav-bar>

    <van-row style="padding: 10px 20px; margin-bottom: 20px">
      <div style="font-size: 24px; font-weight: 600;">{{dorm.buildingId+' '+dorm.dormId}}</div>
      <div style="font-size: 20px; margin-top: 10px">{{'容量：'+dorm.capacity+' 实住：'+dorm.occupation}}</div>
      <div style="font-size: 20px; margin-top: 10px">{{'位置：'+dorm.floor+'楼'}}</div>
    </van-row>

    <van-cell-group title="成员">
      <van-cell v-for="m in dorm.members" :key="m.id">
        <template #title>
          <van-row>
            <van-col :span="5">
              <van-image round width="70" height="70" :src="m.avatar"/>
            </van-col>
            <van-col :offset="1" :span="12">
              <div style="font-size: 16px">
                {{m.nickName}}
              </div>
              <div style="font-size: 14px; color: #969799">
                {{'学号: '+m.username}}
              </div>
              <div style="font-size: 14px; color: #969799">
                {{'床位: '+m.bedNum}}
              </div>
            </van-col>
            <van-col>
              <van-tag style="margin-top: 40%" size="large" v-show="dorm.admin == m.id" type="primary">寝室长</van-tag>
            </van-col>
          </van-row>
        </template>
      </van-cell>
    </van-cell-group>
  </div>
</template>

<script>
  import {getDormById} from "../../../api/dorm";

  export default {
    name: "MyDorm",
    data(){
      return{
        dorm: {}
      }
    },
    mounted() {
      getDormById(this.$store.getters.user.dormId).then(res => {
        this.dorm = res.data
        this.dorm.members.forEach(m => {
          this.dorm.beds.forEach(b => {
            if (b.userId == m.id){
              this.$set(m, 'bedNum', b.bedNum)
            }
          })
        })
        console.log(this.dorm);
      })
    },
    methods:{
    }
  }
</script>

<style scoped>
</style>
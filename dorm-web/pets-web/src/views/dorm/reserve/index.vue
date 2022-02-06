<template>
  <!--    床位列表-->
  <div>
    <van-sticky>
      <van-nav-bar
        title="床位预定"
        left-text="返回"
        right-text="我的预定"
        left-arrow
        @click-right="showReservation"
        @click-left="$router.back()"
      />
    </van-sticky>

    <!--    我的预定-->
    <van-action-sheet v-model="infoShow" title="预约信息">
      <div>
        <van-empty v-if="reservation == null" description="暂未预定" />

        <van-form v-else>
          <van-cell  title="人数">
            <template #right-icon>
              <van-tag size="large" type="primary">{{reservation.capacity+'人间'}}</van-tag>
            </template>
          </van-cell>

          <van-field
            readonly
            v-model="reservation.bedNum"
            name="床号"
            label="床号"
          />
          <van-field
            readonly
            v-model="reservation.dormId"
            name="门牌号"
            label="门牌号"
          />
          <van-field
            readonly
            v-model="reservation.buildingId"
            name="楼栋"
            label="楼栋"
          />
          <van-field
            readonly
            v-model="reservation.floor"
            name="楼层"
            label="楼层"
          />
          <div style="margin: 16px;">
            <van-button round block type="info" @click="dismissBed" native-type="submit">取消预约</van-button>
          </div>
        </van-form>
      </div>
    </van-action-sheet>

    <van-tabs v-model="active" color="#40356B" :animated="true" style="margin-top: 20px"
              type="card" :swipeable="true">
      <van-tab title="可选寝室">
        <!--    寝室选择列表-->
        <div>
          <van-cell-group title="可预订寝室" style="padding-bottom: 50px">
            <van-cell style="border: 1px solid #EBEDF0" @click="toDormDetail(item)" size="large" v-for="(item,i) in list" :key="i" is-link>
              <template #title>
                <span>{{item.dormId}}</span>
                <van-tag style="margin-left: 30px" type="danger">{{'余'+(item.capacity-item.occupation)+'人'}}</van-tag>
              </template>
              <template #label>
                <span style="margin-right: 20px">{{'楼号:'+item.buildingId}}</span>
                <span style="margin-right: 20px">{{'楼层:'+item.floor}}</span>
                <span>{{'容量:'+item.capacity}}</span>
              </template>
            </van-cell>
          </van-cell-group>
        </div>
      </van-tab>

      <van-tab :title="dorm!=null ? dorm.buildingId+'-'+dorm.dormId+'床位':'未选择'">
<!--        床位选择列表-->
        <div>
          <van-row type="flex" justify="space-around" style="margin-top: 40px">
            <van-col span="8" style="display: flex; flex-direction: column; justify-content: space-between;">
              <van-button :icon="require('@/assets/img/reserve/bed.png')" class="bed"
                          @click="reserveBed(beds.lu.id, beds.lu.status)"
                          v-if="beds.lu" :disabled="beds.lu.status == 1"
                          type="primary" >
                {{beds.lu.bedNum}}
              </van-button>
              <van-button :icon="require('@/assets/img/reserve/bed.png')" class="bed"
                          @click="reserveBed(beds.l.id, beds.l.status)"
                          v-if="beds.l" :disabled="beds.l.status == 1"
                          type="primary" >
                {{beds.l.bedNum}}
              </van-button>
              <van-button :icon="require('@/assets/img/reserve/bed.png')" class="bed"
                          @click="reserveBed(beds.ld.id, beds.ld.status)"
                          v-if="beds.ld" :disabled="beds.ld.status == 1"
                          type="primary" >
                {{beds.ld.bedNum}}
              </van-button>
            </van-col>

            <van-col span="6">
              <div class="passage">
                <div style="font-size: 40px;color: #2c2c2c">
                  <div style="">过</div>
                  <div style="margin-top: 80px">道</div>
                </div>
              </div>
            </van-col>

            <van-col span="8" style="display: flex; flex-direction: column;  justify-content: space-between;">
              <van-button :icon="require('@/assets/img/reserve/bed.png')" class="bed"
                          @click="reserveBed(beds.ru.id, beds.ru.status)" :disabled="beds.ru.status == 1"
                          v-if="beds.ru"  type="primary" >
                {{beds.ru.bedNum}}
              </van-button>
              <van-button :icon="require('@/assets/img/reserve/bed.png')" class="bed"
                          v-if="beds.r"  @click="reserveBed(beds.r.id, beds.r.status)" :disabled="beds.r.status == 1"
                          type="primary" >
                {{beds.r.bedNum}}
              </van-button>
              <van-button :icon="require('@/assets/img/reserve/bed.png')" class="bed"
                          v-if="beds.rd"  @click="reserveBed(beds.rd.id, beds.rd.status)" :disabled="beds.rd.status == 1"
                          type="primary" >
                {{beds.rd.bedNum}}
              </van-button>
            </van-col>
          </van-row>

          <div style="display: flex; justify-content: center"><img style="height: 180px; margin-top: 20px;" :src="require('@/assets/img/reserve/door.png')"/></div>
        </div>
      </van-tab>
    </van-tabs>
  </div>
</template>

<script>
  import {cancel, getBedsByDormId, myReservation, reserve} from "../../../api/bed";
  import {getReserveDorms} from "../../../api/dorm";
  import {mapMutations} from "vuex";
  export default {
    name: "Reserve",
    data(){
      return{
        active: 0,
        reservation: null,
        list: [],//可选寝室
        infoShow: false,
        //宿舍信息
        dorm: null,
        //床位,六个位置
        beds: {
          ld: {},//左下
          lu: {},//左上
          l: {},//左
          r: {},//右
          rd: {},//右下
          ru: {}//右上
        }
      }
    },
    mounted() {
      getReserveDorms(this.$store.getters.user.id).then(res => {
        this.list = res.data
        this.loadMyReservation()
      })
    },
    computed:{
    },
    methods:{
      ...mapMutations({setDormInfo: 'user/SET_DORM_INFO'}),

      //加载我的预定
      loadMyReservation(){
        myReservation(this.$store.getters.user.id).then(res => {
          this.reservation = res.data
          // console.log(this.reservation);
        })
      },
      //显示我的预定信息
      showReservation(){
        this.infoShow = true;
        if (this.reservation == null){
          this.loadMyReservation()
        }
      },
      //取消预约
      dismissBed(){
        const that = this
        this.$dialog.confirm({
          title: '取消预定',
          message: '确认取消选定床位吗？',
        })
          .then(() => {
            cancel(this.$store.getters.user.id, this.reservation.bid).then(res => {
              if (res.code == 200){
                if (that.dorm){
                  that.loadBedsData(that.dorm.id)
                }
                that.setDormInfo(null)
                that.$toast({type: "success", message: res.msg})
                that.reservation = null
                that.infoShow = false
              }
            })
          })
          .catch(() => {
            // on cancel
          });
      },
      onClick(name, title){

      },
      //加载寝室信息
      async loadBedsData(dormId){
        await getBedsByDormId(dormId).then(ans => {
          console.log(ans.data);
          this.beds = ans.data;
        })
      },
      //选定床位
      reserveBed(bedId, status){
        const _this = this
        if (this.reservation != null){
          _this.$toast({type: "fail", message: '您已经选定过床位', position: 'bottom'})
        }else {
          if (status == 0){
            _this.$dialog.confirm({
              title: '选定确认',
              message: '确认选择此床位吗？',
            })
              .then(() => {
                reserve(_this.$store.getters.user.id, bedId).then(res => {
                  _this.$toast({type: "success", message: res.msg})
                  _this.dorm.occupation += 1
                  _this.setDormInfo(this.dorm)
                  _this.loadBedsData(this.dorm.id)
                })
              })
              .catch(() => {
                // on cancel
              });
          }
        }
      },
      //获取寝室详细信息
      async toDormDetail(dorm){
        this.dorm = dorm
        this.loadBedsData(dorm.id)
        this.active = 1
      },
    }
  }
</script>

<style scoped>
  .van-cell__title {
    font-size: 18px;
  }
  .van-cell {
    font-size: 18px;
  }
  .van-button__icon {
    font-size: 1.8em;
  }
  .bed{
    width: 100%;
    height: 25%;
    font-size: 25px
  }
  .passage{
    height: 480px;
    border: 1px dotted #000000;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #a8a8a8
  }
</style>
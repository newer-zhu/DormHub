<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="报修单"
                 left-text="返回" left-arrow>
    </van-nav-bar>

    <van-skeleton title :row="5" :loading="loading">
      <div>
        <van-row type="flex" justify="center">
          <van-col :span="8">
            <van-image class="back-img" v-if="fix.status == 1" :src="require('../../../assets/img/fix/done.png')"></van-image>
            <van-image class="back-img" v-else  :src="require('../../../assets/img/fix/undone.png')"></van-image>
          </van-col>
        </van-row>

        <div>
          <van-form>
            <van-field
              readonly
              :value="fix.cat.category"
              label="维修分类"
            />

            <van-field v-model="fix.thing" readonly
                       label="维修主体" />

            <van-field readonly v-model="fix.num" label="维修数量"></van-field>

            <van-field
              readonly
              :value="fix.expectTime"
              label="维修时间"
            />

            <van-field v-model="emergency" label="紧急程度" readonly></van-field>

            <van-field type="textarea" readonly label="维修备注"
                       rows="4" v-model="fix.detail">
            </van-field>

            <van-field readonly label="报修人" v-model="fix.user.nickName"></van-field>
            <van-field readonly label="报修寝室" v-model="fix.dorm.buildingId+fix.dorm.dormId"></van-field>

            <van-field v-model="fix.phone" readonly label="联系电话" />

            <div v-if="fix.images.length">
              <van-cell title="图片"/>
              <van-row :gutter="20">
                <van-col :span="8" v-for="(p,i) in fix.images" :key="i">
                  <van-image @click="preview(i)" :src="p.url"></van-image>
                </van-col>
              </van-row>
            </div>


          </van-form>
        </div>
      </div>
    </van-skeleton>

  </div>
</template>

<script>
  import {getReportById} from "../../../api/fix";
  import {ImagePreview} from "vant";

  export default {
    name: "FixDetail",
    data(){
      return{
        loading: true,
        fix: {},
      }
    },
    mounted() {
      getReportById(this.$route.params.id).then(res => {
        console.log(res.data);
        this.fix = res.data
      })
      this.loading = false
    },
    computed:{
      emergency(){
        switch (this.fix.priority) {
          case 0:
            return '非常紧急'
          case 1:
            return '急迫'
          case 2:
            return '较急'
          case 3:
            return '不急'
        }
      },
      imgArr(){
        return this.fix.images.map(m => {
          m.url
        })
      }
    },
    methods:{
      preview(index){
        ImagePreview({
          images: this.imgArr,
          startPosition: index,
      });
      },
    }
  }
</script>

<style scoped>
  .back-img{
    opacity:0.6;
    width: 125px;
    height: 125px;
  }
  .background-img{
    background-image: url("../../../assets/img/fix/done.png");
    background-size: 100px 100px;
    background-repeat: no-repeat;
  }
</style>

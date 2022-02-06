<template>
  <div>
    <van-swipe-cell  style="margin-bottom: 8px" v-for="(r,i) in lists" :key="i">
      <van-card
        @click="toDetail(r.id)"
        :desc="description(r)"
        :title="titleInfo(r)"
        class="goods-card"
        :thumb="cover(r.imageList)"
      >
        <template v-if="!isAdmin" #tags>
<!--      一直未审核或一直未销假且时间已逾期-->
          <div v-if="isOverdue(r.endTime) && (r.status == 0 || r.status == 1)">
            <van-tag>已逾期</van-tag>
          </div>
          <div v-else>
            <van-tag v-show="r.status==0" type="warning">审核中</van-tag>
            <van-tag v-show="r.status==1" type="success">休假中</van-tag>
            <van-tag v-show="r.status==2" type="primary">已销假</van-tag>
            <van-tag v-show="r.status==-1" type="danger">未批准</van-tag>
          </div>
        </template>
        <template v-else #footer>
          <van-button round size="small" :disabled="r.status != 1" @click.stop="pass(i)" type="primary">通过</van-button>
          <van-button round size="small" :disabled="r.status != -1" @click.stop="fail(i)" type="danger">驳回</van-button>
        </template>
      </van-card>
      <template v-if="!isAdmin" #right>
        <van-button :disabled="!(r.status==0 || r.status==1)" class="delete-button"
                    square type="danger" @click="destroy(r, i)" text="销假" />
      </template>
    </van-swipe-cell>
  </div>
</template>

<script>
  const moment = require('moment')
  import {destroyRequest, failRequest, passRequest} from "../../api/leave";

  export default {
    name: "LeaveList",
    props:{
      lists:{
        type: Array
      },
      isAdmin:{
        type: Boolean
      }
    },
    methods:{
      //是否逾期
      isOverdue(endTime){
        return moment().isAfter(endTime)
      },
      //封面
      cover(list){
        if (list.length != 0){
          return list[0].url
        }else {
          return require('@/assets/img/leave.png')
        }
      },
      description(r){
        const date1 = moment(r.startTime)
        const date2 = moment(r.endTime)
        const date3 = date2.diff(date1,'minute') //总分钟数
        const _h = Math.floor(date3 / 60) // 整数小时数
        const d = Math.floor(_h / 24);
        const h = _h - 24*d
        const m = date3 - _h*60
        const res = '审批人:'+''+r.auditorUser.nickName + ' 请假时间:'+d+'天'+h+'小时'+m+'分钟'
        return res
      },
      titleInfo(r){
        return '创建时间:'+ r.createTime
      },
      toDetail(id){
        this.$router.push({
          name: 'leaveDetail',
          params: {
            id: id
          }
        })
      },
      /**
       * 销假
       */
      destroy(request, index){
        this.$dialog.confirm({
          message: '确认销假吗？',
        })
          .then(() => {
            destroyRequest(request).then(res => {
              if (res.code == 200){
                this.$notify({type: "success", message: res.msg})
                this.lists[index].status = 2;
              }else {
                this.$notify({type: "danger", message: res.msg})
              }
            })
          })
          .catch(() => {
            // on cancel
          });
      },
      /**
       * 通过假条
       * */
      async pass(index){
        await passRequest(this.lists[index]).then(res => {
          if (res.code === 200){
            this.lists[index].status = 1;
            this.$notify({type: 'success', message: res.msg})
          }
        })
      },
      /**
       * 驳回假条
       */
      async fail(index){
        await this.$dialog.confirm({
          title: '再次确认',
          message: '确认对此假条驳回吗？',
        })
          .then(() => {
            failRequest(this.lists[index]).then(res => {
              if (res.code === 200){
                this.lists[index].status = -1
                this.$notify({type: 'warning', message: res.msg})
              }
            })
          })
          .catch(() => {

          });
      },
    }
  }
</script>

<style scoped>
  .goods-card {
    margin: 0;
  }

  .delete-button {
    height: 100%;
  }
</style>
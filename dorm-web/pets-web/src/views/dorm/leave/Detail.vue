<template>
  <div>
    <van-nav-bar
      title="假条信息"
      left-text="返回"
      left-arrow
      @click-left="$router.back()"
    />

    <van-skeleton title :row="8" :loading="loading">
      <div>
        <van-cell-group title="假条信息">
          <!--      倒计时-->
          <div style="padding-top: 10px">
            <div style="margin-left: 35px; color: #323233; font-size: 14px">距结束</div>
            <van-count-down :time="countDown">
              <template #default="timeData">
                <van-row type="flex" justify="center">
                  <van-col :span="16">
                    <div style="margin: 15px 15px">
                      <span class="block">{{ timeData.days }}</span>
                      <span class="colon">天</span>
                      <span class="block">{{ timeData.hours }}</span>
                      <span class="colon">:</span>
                      <span class="block">{{ timeData.minutes }}</span>
                      <span class="colon">:</span>
                      <span class="block">{{ timeData.seconds }}</span>
                    </div>
                  </van-col>
                </van-row>
              </template>
            </van-count-down>
          </div>

          <van-cell icon="clock" title="请假时间">
            <template #label>
              <van-steps active-icon="arrow" inactive-icon="arrow-left"
                         inactive-color="#38f" active-color="#38f">
                <van-step>{{'【'+formatTime(request.startTime)+'】'}}</van-step>
                <van-step>{{'【'+formatTime(request.endTime)+'】'}}</van-step>
              </van-steps>
            </template>
          </van-cell>

          <van-cell icon="todo-list" title="请假原因">
            <template #label>
              <van-field
                v-model="request.reason"
                type="textarea"
                maxlength="200" autosize rows="2"
                input-align="left"
                readonly/>
            </template>
          </van-cell>

          <van-cell title="附件图片">
            <template #label>
              <!-- 每个元素的两侧间隔相等 -->
              <van-row type="flex" justify="space-around">
                <van-col v-for="(pic, i) in request.imageList" :key="pic.id" span="6">
                  <van-image
                    @click="preview(i)"
                    width="100"
                    height="100"
                    :src="pic.url"
                  />
                </van-col>
              </van-row>
            </template>
          </van-cell>

          <van-cell icon="manager" title="抄送人" :value="request.proposerUser.nickName"
                    :label="'学号： '+request.proposerUser.username"></van-cell>

          <van-cell icon="friends" title="审批人" :value="request.auditorUser.nickName"></van-cell>
        </van-cell-group>

        <!--    进度条-->
        <van-cell-group title="假条进度">
          <van-steps direction="vertical" :active="request.status == -1? 2:request.status+1">
            <!--      status == 0 请假中 / 1 已批准/ 2 已销假/ -1 未批准-->
            <van-step>
              <h3>{{'【'+request.proposerUser.nickName+'】'+'发起请假请求'}}</h3>
              <p>{{formatTime(request.createTime)}}</p>
            </van-step>
            <van-step>
              <h3>{{'【'+request.auditorUser.nickName+'】'+'正在审核中'}}</h3>
            </van-step>
            <van-step v-if="request.status >= 1">
              <h3>{{'【'+request.auditorUser.nickName+'】'+'审核通过请假请求'}}</h3>
              <p>{{formatTime(request.approveTime)}}</p>
            </van-step>
            <van-step v-if="request.status == 2">
              <h3>{{'【'+request.proposerUser.nickName+'】'+'此次假条已销假'}}</h3>
              <p>{{formatTime(request.destroyTime)}}</p>
            </van-step>
            <van-step v-if="request.status == -1">
              <h3>{{'【'+request.auditorUser.nickName+'】'+'驳回了请假请求'}}</h3>
              <p>{{formatTime(request.approveTime)}}</p>
            </van-step>
          </van-steps>
        </van-cell-group>

        <!--    审批建议-->
        <van-cell-group title="审批建议">
          <van-field  left-icon="comment" type="textarea"
                      maxlength="200" autosize rows="2"
                      show-word-limit input-align="center"
                      :readonly="!(request.auditor == $store.getters.user.id)" v-model="request.advice" label="" />
        </van-cell-group>

        <!--    审核按钮-->
        <van-row v-if="isAuditor" style="margin-top: 35px; padding-bottom: 80px">
          <van-col :span="12">
            <van-button type="primary" @click="pass" :disabled="request.status != 0"
                        style="width: 50%; margin: 0 auto" size="normal" block>通过</van-button>
          </van-col>
          <van-col :span="12">
            <van-button type="danger" @click="fail" :disabled="request.status != 0"
                        style="width: 50%; margin: 0 auto" block>不通过</van-button>
          </van-col>
        </van-row>
        <!--    销假按钮-->
        <van-row v-if="isProposer">
          <van-button v-if="request.status == 0" @click="del"  block type="primary">撤回</van-button>
          <van-button v-else-if="request.status == 1" @click="destroy" block type="warning">销假</van-button>
          <van-button v-else-if="request.status == 2" :disabled="true"  block type="info">已销假</van-button>
          <van-button v-else-if="request.status == -1" :disabled="true"  block type="danger">已驳回</van-button>
        </van-row>
      </div>
    </van-skeleton>

  </div>
</template>

<script>
  import { ImagePreview } from 'vant'
  import {getRequests, failRequest, passRequest, destroyRequest, deleteLeave } from "../../../api/leave";
  const moment = require('moment')
  export default {
    name: "leaveDetail",
    data(){
      return{
        loading: true,
        request: {},
        countDown: 0
      }
    },
    computed:{
      imgArr(){
        return this.request.imageList.map(m => {return m.url})
      },
      isAuditor(){
        return this.$store.getters.user.id == this.request.auditor
      },
      isProposer(){
        return this.$store.getters.user.id == this.request.proposer
      }
    },
    mounted() {
      const id = this.$route.params.id
      getRequests('?id='+id).then(res => {
        this.request = res.data[0]
        this.calculateTime(res.data[0].endTime)
        console.log(this.request);
      })
      this.loading = false
    },
    methods:{
      formatTime(time){
        return moment(time).format('YYYY-MM-DD HH:mm:ss')
      },
      /**
       * 删除假条
       */
      async del(){
        await this.$dialog.confirm({
          title: '再次确认',
          message: '确认撤回此假条吗？',
        })
        .then(() => {
          deleteLeave(this.request.id).then(res => {
            this.$router.replace({
              name: 'LeaveRequest'
            })
          })
        })
        .catch(() => {})
      },
      /**
       *请假通过
       **/
      async pass(){
        await passRequest(this.request).then(res => {
          if (res.code === 200){
            this.request.status = 1
            this.$toast({type: 'success', message: res.msg})
          }
        })
      },
      /**
       * 驳回假条
       */
      async fail(){
        await this.$dialog.confirm({
          title: '再次确认',
          message: '确认对此假条驳回吗？',
        })
          .then(() => {
            failRequest(this.request).then(res => {
              if (res.code === 200){
                this.request.status = -1
                this.$toast({type: 'success', message: res.msg})
              }
            })
          })
          .catch(() => {

          });
      },
      /**
       * 销假
       */
      destroy(){
        this.$dialog.confirm({
          message: '确认销假吗？',
        })
          .then(() => {
            destroyRequest(this.request).then(res => {
              if (res.code == 200){
                this.$toast({type: "success", message: res.msg})
                this.request.status = 2
              }else {
                this.$toast({type: "fail", message: res.msg})
              }
            })
          })
          .catch(() => {
            // on cancel
          });
      },
      preview(index){
        ImagePreview({
          images: this.imgArr,
          startPosition: index,
        });
      },
      /**
       * 计算倒计时时间
       */
      calculateTime(time){
        const end = moment(time)
        const sec = end.diff(new Date(), 'seconds')
        this.countDown = 1000 * sec
      }
    },
  }
</script>

<style scoped>
  .colon {
    margin: 0 4px;
    color: #363636;
    font-size: 24px;
    font-weight: 600;
  }
  .block {
    border-radius: 5px;
    padding: 5px;
    color: #fff;
    font-size: 24px;
    text-align: center;
    background-color: #ee0a24;
  }
</style>
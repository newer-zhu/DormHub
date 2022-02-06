<template>
  <div>
    <van-nav-bar
      title="请假申请"
      left-text="返回"
      right-text="我的假条"
      @click-right="$router.push({name: 'MyRequests'})"
      left-arrow
      @click-left="$router.back()"
    />

    <van-notice-bar left-icon="volume-o" :scrollable="false">
      <van-swipe
        vertical
        class="notice-swipe"
        :autoplay="3000"
        :show-indicators="false"
      >
        <van-swipe-item>别忘了销假哦</van-swipe-item>
        <van-swipe-item>请假最长只能请7天 长期请假请联系辅导员</van-swipe-item>
      </van-swipe>
    </van-notice-bar>

    <van-form @submit="submit">
      <van-cell-group title="时间选择">
        <van-cell size="large" clickable required value="年/月/日/时/分"
                  title="开始时间" @click="showTime(0)" is-link :label="formatTime(form.startTime)" />
        <van-cell size="large" clickable required value="年/月/日/时/分"
                  title="结束时间" @click="showTime(1)" is-link :label="formatTime(form.endTime)" />
      </van-cell-group>

      <van-field
        :rules="[{ required: true, message: '请填写请假原因'}]"
        class="input"
        size="large"
        v-model="form.reason"
        rows="4"
        label-class="labelClass"
        label-width="4em"
        error-message="此项必填"
        autosize
        required
        clearable
        left-icon="records"
        label="请假原因"
        type="textarea"
        maxlength="200"
        placeholder="请输入请假原因"
        show-word-limit
      />

      <van-field
        class="auditor"
        readonly
        clickable
        name="picker"
        :value="selectAuditor"
        label="审批人"
        :rules="[{required: true, message: '请选择审批人'}]"
        placeholder="点击选择审批人"
        @click="getAuditorList"
      />

      <div class="image">
        <div>
          附件上传
        </div>
        <van-uploader :max-count="3"
                      ref="avatar"
                      v-model="fileList"
                      name="reqFile"
                      upload-text="附件上传"
                      :after-read="afterRead"
                      @delete="remove"
                      :max-size="5 * 1024 * 1024" @oversize="onOversize"
                      style="margin-top: 10px"
        />
      </div>

      <van-popup position="bottom" round v-model="showAuditors">
        <van-picker @cancel="showAuditors = false" @confirm="chooseAuditor"
                    show-toolbar :columns="column" :loading="loading" />
      </van-popup>
      <van-popup position="bottom" round
                 :style="{ height: '35%' }" v-model="showSTime">
        <van-datetime-picker
          @confirm="showSTime = false"
          @cancel="showSTime = false"
          v-model="timeType"
          type="datetime"
          title="选择请假开始时间"
          :min-date="currentTime"
          :max-date="maxTime"
        />
      </van-popup>

      <van-row style="margin-top: 30px">
        <van-col :span="10" :offset="9">
          <van-button native-type="submit" type="info" :loading="buttonLoading" loading-text="提交中">请假提交</van-button>
        </van-col>
      </van-row>
    </van-form>

  </div>
</template>

<script>
  import {deletePic, uploadLeavePic} from "../../../api/file";
  import {getAuditors, requestLeave,canRequest, deleteLeave} from "../../../api/leave";
  const moment = require('moment');
  import {Toast} from "vant";

  export default {
    name: "LeaveRequest",
    data(){
      return{
        form: {
          id: null,
          startTime: new Date(),
          endTime: new Date(),
          reason: '',
          proposer: this.$store.getters.user.id,
          auditor: ''
        },
        showSTime: false ,
        //时间弹出框绑定的时间
        type: 0,
        auditors: [],
        //被选中的审核人
        selectAuditor: '',
        showAuditors: false,
        loading: false,
        buttonLoading: false,
        //附件列表
        fileList: [],
        //附件后台信息列表
        fileKeyList: []
      }
    },
    computed:{
      timeType:{
        get:function () {
          return this.type==0? this.form.startTime : this.form.endTime
        },
        set: function ( newValue ) {
          if (this.type==0){
            this.form.startTime = newValue
          }else if (this.type==1){
            this.form.endTime = newValue
          }
        }
      },
      currentTime(){
        return new Date()
      },
      maxTime(){
        return moment(this.currentTime).add(7, 'd').toDate()
      },
      column(){
        return this.auditors.map(m => {
          return m.nickName
        })
      }
    },
    mounted() {
      canRequest(this.$store.getters.user.id).then(res => {
        if (!res.data){
          this.$dialog.confirm({
            message: '还有未销假的假条，销假后才能继续请假哦',
          })
            .then(() => {
              this.$router.push({
                name: 'MyRequests'
              })
            })
            .catch(() => {
              this.$router.back()
            });
        }
      })
    },
    methods: {
      showTime(t){
        this.type = t
        this.showSTime = true
      },
      /**
       * 获取审批人列表
       */
      getAuditorList(){
        this.loading = true
        this.showAuditors = true
        getAuditors(this.$store.getters.user.id).then(res => {
          this.auditors =  res.data
          this.loading = false
        })
      },
      /**
       * 选择审批人
       */
      chooseAuditor(val, index){
        this.selectAuditor = val
        this.form.auditor = this.auditors[index].id
        this.showAuditors = false
      },
      //格式化日期
      formatTime(time){
        return moment(time).format('YYYY-MM-DD HH:mm:ss')
      },

      async submit(values){
        console.log(this.form);
        // console.log(values);
        this.buttonLoading = true
        if (this.form.endTime > this.form.startTime) {
          this.form.endTime = moment(this.form.endTime).format('yyyy-MM-DD HH:mm:ss').toString()
          this.form.startTime = moment(this.form.startTime).format('yyyy-MM-DD HH:mm:ss').toString()
          await requestLeave(this.form).then(res => {
            if (res.code === 200){
              this.$notify({type: 'primary', message: '提交成功'})
              this.$router.replace({name: 'MyRequests'})
            }else {
              this.$notify({type: 'error',message: '提交失败'})
            }
          })
        }else {
          this.$toast({type: "text", message: '注意时间范围！'})
        }
        this.buttonLoading = false
      },
      //上传附件
      async afterRead(file) {
        file.status = 'uploading'
        //图片需要关联附件Id
        if (this.form.id == null){
          this.form.endTime = moment(this.form.endTime).format('yyyy-MM-DD HH:mm:ss').toString()
          this.form.startTime = moment(this.form.startTime).format('yyyy-MM-DD HH:mm:ss').toString()
          await requestLeave(this.form).then(res => {
            this.form = res.data
          })
        }
        await uploadLeavePic(file.file, this.form.id).then((res) => {
          if (res.code == 200){//上传成功
            this.fileKeyList.push(res.data.imageId)
            file.status = 'done'
          }else {//上传失败
            file.status = 'failed'
          }
          console.log(this.fileKeyList);
        })
      },
      onOversize(file) {
        Toast('文件大小不能超过 10Mb')
      },
      //删除附件
      remove(file, detail){
        deletePic(this.fileKeyList[detail.index], this.form.id).then(res => {
          this.fileKeyList.splice(detail.index, 1)
        })
      }
    },

    beforeRouteLeave(to, from, next){
      // 请假未完成
      if (this.form.id != null && to.name != 'MyRequests'){
        deleteLeave(this.form.id).then(res => {
          console.log('删除假条草稿');
        })
      }
      next()
    }
  }
</script>

<style scoped lang="less">
  /deep/ .van-field__left-icon .van-icon{
    font-size: 25px;
  }

  .input{
    margin-top: 20px;
    border-radius: 5px;
    border: 1px solid #DCDEE0;
  }
  .auditor{
    margin-top: 20px;
  }
  .image{
    margin-top: 20px;
    padding: 0px 15px;
  }
  .notice-swipe {
    height: 40px;
    line-height: 40px;
  }
</style>

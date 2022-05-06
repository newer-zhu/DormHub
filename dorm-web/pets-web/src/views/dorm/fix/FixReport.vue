<template>
  <div>
    <van-nav-bar @click-left="$router.back()" title="宿舍报修"
                 left-text="返回" left-arrow>
    </van-nav-bar>

    <van-form>
      <van-field
        readonly
        clickable
        name="picker"
        :value="selectCat"
        label="维修分类"
        :rules="[{require: true}]"
        placeholder="点击选择所需维修物件分类"
        @click="show = true"
      />
      <van-popup style="width: 100%" v-model="show">
        <van-picker
          title="选择分类"
          show-toolbar
          :columns="columns"
          @confirm="onConfirm"
          @cancel="onCancel"
          @change="onChange"
        />
      </van-popup>

      <van-field v-model="fix.thing" maxlength="15"
                 :rules="[{require: true}]" label="维修主体" />

      <van-field name="stepper" label="维修数量">
        <template #input>
          <van-stepper v-model="fix.num" />
        </template>
      </van-field>

      <van-field
        readonly
        clickable
        name="datetimePicker"
        :value="expectTimeStr"
        label="维修时间选择"
        placeholder="点击选择时间"
        @click="showPicker = true"
      />
      <van-popup v-model="showPicker" position="bottom">
        <van-datetime-picker
          v-model="fix.expectTime"
          type="datehour"
          title="年月日小时"
          @confirm="chooseTime"
          @cancel="showPicker = false"
          :min-date="minDate"
          :max-date="maxDate"
        />
      </van-popup>


      <van-field name="radio" label="紧急程度" :rules="[{require: true}]">
        <template #input>
          <van-radio-group v-model="fix.priority">
            <van-radio  name="3">不急</van-radio>
            <van-radio style="margin-top: 10px" name="2">较急</van-radio>
            <van-radio style="margin-top: 10px" name="1">急迫</van-radio>
            <van-radio style="margin-top: 10px" shape="square" checked-color="red" name="0">非常紧急</van-radio>
          </van-radio-group>
        </template>
      </van-field>

      <van-field type="textarea" label="维修备注" maxlength="200" show-word-limit
                 rows="4"
                 placeholder="请输入维修原因及具体要求" v-model="fix.detail">
      </van-field>

      <!-- 输入手机号，调起手机号键盘 -->
      <van-field v-model="fix.phone" maxlength="11"
                 :rules="[{require: true}]" type="tel" label="联系电话" />

      <van-cell title="上传图片"/>
      <div style="margin-left: 16px">
        <van-uploader
          name="fixPic"
          :after-read="afterRead"
          @delete="remove"
          v-model="fileList" multiple
          :max-count="2"
        />
      </div>

      <div style="margin: 16px;">
        <van-button round block type="info" @click="submit">提交</van-button>
      </div>
    </van-form>

  </div>
</template>

<script>
  import {getAllCategories, hardDelFixReport, sendFixReport, softDelFixReport} from "../../../api/fix";
  import {uploadFixPic, deletePic} from "../../../api/file";
  const moment = require('moment')

  export default {
    name: "FixReport",
    data(){
      return{
        fileList: [],
        keyList: [],
        cats: [],
        selectCat: '',
        show: false,
        minDate: new Date(),
        maxDate: new moment().add(4, 'months').toDate(),
        showPicker: false,
        fix:{
          id: null,
          detail: '',
          expectTime: new Date(),
          num: 1,
          thing: '',
          dormId: this.$store.getters.user.dorm.id,
          userId: this.$store.getters.user.id,
          status: -1,
          phone: '',
          priority: '',
          catId: ''
        }
      }
    },
    mounted() {
      getAllCategories().then(res => {
        this.cats = res.data
      })
    },
    computed:{
      columns(){
        return this.cats.map(m => {return m.category})
      },
      expectTimeStr(){
        return new moment(this.fix.expectTime).format('YYYY-MM-DD h').toString()
      }
    },
    methods:{
      submit(){
        if (!this.fix.catId || !this.fix.phone || !this.fix.num || !this.fix.thing || !this.fix.expectTime){
          this.$notify({ type: 'warning', message: '请填写完整信息！', duration: 2500});
        } else {
          this.fix.expectTime = new moment(this.fix.expectTime).format('YYYY-MM-DD hh:mm:ss').toString()
          sendFixReport(this.fix).then(res => {
            if (res.code == 200){
              this.fix.status = 0
              this.$notify({ type: 'success', message: '报修成功!', duration: 2500});
              this.$router.replace({name: 'MyFixReports'})
            }else {
              this.fix.status = -1
            }
          })
        }
      },
      chooseTime(time) {
        this.fix.expectTime = time;
        this.showPicker = false;
      },
      onConfirm(value, index) {
        this.selectCat = value
        this.fix.catId = this.cats[index].id
        this.show = false
      },
      onChange(picker, value, index) {
      },
      onCancel() {
        this.show = false
      },
      //删除图片
      remove(file, detail){
        console.log(this.keyList[detail.index]);
        deletePic(this.keyList[detail.index]).then(res => {
          this.keyList.splice(detail.index, 1)
        })
      },
      //上传图片
      async afterRead(file, detail){
        file.status = 'uploading'
        if (this.fix.id == null){
          this.fix.expectTime = moment(this.fix.expectTime).format('yyyy-MM-DD HH:mm:ss').toString()
          await sendFixReport(this.fix).then(res => {
            this.fix = res.data
            this.fix.status = -1
          })
        }
        await uploadFixPic(this.fix.id, file.file).then(res => {
          if (res.code == 200){
            this.keyList.push(res.data.imageId)
            file.status = 'done'
          }else {//上传失败
            file.status = 'failed'
          }
        })
      }
    },

    beforeRouteLeave(to, from, next){
      if (this.fix.id != null && this.fix.status == -1){
        hardDelFixReport(this.fix.id).then(res => {
          console.log('删除未完成的报修信息');
        })
      }
      next();
    }
  }
</script>

<style scoped>

</style>

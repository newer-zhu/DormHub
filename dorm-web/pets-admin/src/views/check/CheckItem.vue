<template>
  <div>
    <el-alert
      title="所有设置只有在提交后才会生效"
      type="warning"
      effect="dark">
    </el-alert>
    <div style="margin-top: 25px">
      <span style="font-size: 25px; margin-left: 15px; margin-top: 30px;">检查项配置</span>
      <el-button size="mini" type="danger" style="margin-left: 40px" @click="prepareItems">撤销操作</el-button>
    </div>

    <el-row style="margin-top: 20px">
<!--      树-->
      <el-col :offset="1" :span="14">
        <el-alert
          title="新增的检查项默认启用，不会出现在下方[配置开关中]"
          type="success">
        </el-alert>
        <el-tree :data="items"
                 :props="props" @node-click="handleNodeClick">
           <span class="custom-tree-node" slot-scope="{ node, data }">
            <span :style="isDisabled(data.id)?'color: red':''">{{ node.label+'\t['+data.score+'分]' }}</span><span v-show="isDisabled(data.id)">[停用]</span>
            <span>
              <el-button
                type="text"
                size="mini"
                @click="add(data.id)"
                v-if="data.parentItem === -1"
              >
                新增
              </el-button>
            </span>
          </span>
        </el-tree>
      </el-col>
<!--      表单-->
      <el-col :span="5">
        <el-form v-if="form" ref="form" :model="form" label-width="80px">
          <el-form-item label="检查名称">
            <el-input v-model="form.item"></el-input>
          </el-form-item>
          <el-form-item label="分数配置">
            <el-input type="number" v-model.number="form.score"></el-input>
          </el-form-item>
          <el-form-item label="操作">
            <el-button @click="save" type="success">保存</el-button>
            <el-button @click="form = ''" >取消</el-button>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>

    <div style="font-size: 25px; margin-left: 15px; margin-top: 15px">配置开关</div>
    <el-row style="margin-top: 20px">
      <el-col :offset="1" :span="15">
        <el-transfer :titles="['已启用', '已停用']" style="width: 100%"
                     filterable :button-texts="['启用', '停用']"
                     v-model="disabledList" :data="data"></el-transfer>
      </el-col>
      <el-col :span="3" style="margin-left: 25px">
        <div style="font-size: 25px; margin-bottom: 15px; margin-bottom: 10px">目前总分</div>
        <el-progress type="circle" :format="formatPer" :percentage="totalScore"></el-progress>
      </el-col>
    </el-row>
    <el-row>
      <el-col :offset="5">
        <el-button @click="submit" style="margin-top: 100px; width: 20%" type="primary">提交</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getCheckItems, updateCheckItems } from '../../api/check'

  export default {
    name: 'CheckItem',
    data(){
      return{
        items: [],//原始数据
        disabledList: [],//停用Id列表
        data: [],//穿梭框数据
        props: {//树属性
          children: 'childrenItem',
          label: 'item'
        },
        form: '',
        newItems: []//新增items
      }
    },
    computed:{
      totalScore(){
        let t = 0
        this.items.forEach(f => {
          f.childrenItem.forEach(ff => {
            if (!this.isDisabled(ff.id)){
              t += ff.score
            }
          })
        })
        return t
      },
    },
    methods:{
      submit(){
        if (this.totalScore !== 100){
          this.$message({type: 'error', message: '请确保总分为100'})
        }
        let enabledList = []
        this.data.forEach(f => {
          if (!this.isDisabled(f.key)){
            enabledList.push(f.key)
          }
        })
        const updateBody = {
          disabledList: this.disabledList,
          enabledList: enabledList,
          newItems: this.newItems
        }
        updateCheckItems(updateBody).then(res => {
          this.$message({type: 'success', message: res.msg})
          this.prepareItems()
        })
      },
      formatPer(per){
        return per
      },
      isDisabled(id){
        return this.disabledList.indexOf(id) >= 0
      },
      add(parentId){
        this.form = {item: '', score: 0, enabled: 1, parentItem: parentId}
      },
      save(){
        if (!this.form.item || this.form.score === 0){
          this.$message({type: 'error', message: '请设置值！'})
        }
        this.newItems.push(this.form)
        //加到树中
        this.items.forEach(f => {
          if (f.id == this.form.parentItem){
            f.childrenItem.push(this.form)
          }
        })
        this.form = ''
      },
      prepareItems(){
        Object.assign(this.$data, this.$options.data.call(this))
        getCheckItems().then(res => {
          console.log(res.data)
          this.items = res.data
          this.items.forEach(f => {
            f.childrenItem.forEach(ff => {
              this.data.push({label: ff.item+'\t['+ff.score+'分]', key: ff.id, disabled: false})
              if (!ff.enabled){
                this.disabledList.push(ff.id)
              }
            })
          })
        })
      },
      handleNodeClick(){

      }
    },
    mounted() {
      this.prepareItems()
    }
  }
</script>

<style scoped>
  /deep/ .el-transfer-panel {
    width: 400px;
  }
  .custom-tree-node {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
  }
</style>

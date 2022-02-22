<template>
  <div>
    <el-row>
      <el-col :offset="1" :span="15">
        <el-tree :data="items"  show-checkbox
                 :props="props" @node-click="handleNodeClick"></el-tree>
      </el-col>
      <el-col>
<!--        操作-->
      </el-col>
    </el-row>
    <el-row style="margin-top: 20px">
      <el-col :offset="1" :span="20">
        <el-transfer :titles="['已启用', '已停用']" style="width: 100%"
                     filterable :button-texts="['启用', '停用']"
                     v-model="disabledList" :data="data"></el-transfer>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getCheckItems } from '../../api/check'

  export default {
    name: 'CheckItem',
    data(){
      return{
        items: [],//原始数据
        disabledList: [],//停用Id列表
        enabledList: [],//启用Id列表
        data: [],//穿梭框数据
        props: {//树属性
          children: 'childrenItem',
          label: 'item'
        }
      }
    },
    computed:{
    },
    methods:{
      prepareItems(){
        getCheckItems().then(res => {
          console.log(res.data)
          this.items = res.data
          this.items.forEach(f => {
            f.childrenItem.forEach(ff => {
              this.data.push({label: ff.item+'\t['+ff.score+'分]', key: ff.id, disabled: ff.parentItem === -1})
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
</style>

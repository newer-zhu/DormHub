<template>
  <div>
    <el-row style="margin-top: 30px">
      <el-col  :offset="1" :span="5">
        <el-input placeholder="请输入用户名" v-model="condition.nickName"></el-input>
      </el-col>
      <el-col :offset="1" :span="5">
        <el-input placeholder="请输入学工号" v-model="condition.username"></el-input>
      </el-col>
      <el-col :span="3">
        <el-button type="primary" style="margin-left: 20px" icon="el-icon-search" @click="search">搜索</el-button>
      </el-col>
    </el-row>
    <el-row type="flex" justify="flex-start" style="margin-top: 20px;flex-wrap: wrap;">
      <el-col v-for="(u,i) in list" :key="u.id" :span="5" :offset="1">
        <el-card  style="width: 320px; margin-top: 15px" class="box-card">
          <el-descriptions class="margin-top" :title="u.nickName" :column="2" direction="vertical">
            <el-descriptions-item label="学工号">{{u.username}}</el-descriptions-item>
            <el-descriptions-item label="手机号">{{u.phone}}</el-descriptions-item>
            <el-descriptions-item label="邮箱">{{u.email}}</el-descriptions-item>
            <el-descriptions-item label="创建日期">{{u.createTime}}</el-descriptions-item>
            <el-descriptions-item label="所属宿舍">{{u.dorm? u.dorm.buildingId + u.dorm.dormId : '无'}}</el-descriptions-item>
            <el-descriptions-item label="头像">
              <el-avatar shape="square" size="medium" :src="u.avatar" />
            </el-descriptions-item>
            <el-descriptions-item label="是否启用">
              <el-switch
                change="changeStatus"
                v-model="u.status"
                :disabled="true"
                active-text="正常"
                inactive-text="停用">
              </el-switch>
            </el-descriptions-item>
            <el-descriptions-item label="密码">
              <el-button size="mini" :disabled="true" type="danger">修改密码</el-button>
            </el-descriptions-item>
          </el-descriptions>
        </el-card>
      </el-col>
    </el-row>
<!--    暂未完成-->
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="30%">
      <span>确认改变状态吗？</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="confirm">确 定</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>
  import {searchUsers} from '../../api/user'

  export default {
    name: 'UserTable',
    data(){
      return{
        list: [],
        condition:{
          username: '',
          nickName: ''
        },
        dialogVisible: false
      }
    },
    watch:{
      condition(newVal, oldVal){
        if (!newVal.username && !newVal.nickName){
          searchUsers(this.condition).then(res => {
            this.list = res.data
          })
        }
      }
    },
    methods:{
      changeStatus(status){
      },
      confirm(){

      },
      search(){
        searchUsers(this.condition).then(res => {
          this.list = res.data
        })
      }
    },
    mounted() {
      searchUsers(this.condition).then(res => {
        console.log(res.data)
        this.list = res.data
      })
    }
  }
</script>

<style scoped>

</style>

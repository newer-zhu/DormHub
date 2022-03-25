<template>
  <div>
    <el-input style="width: 200px; margin-left: 5%; margin-top: 50px" v-model="filterUsername" placeholder="输入学工号查找"></el-input>
    <el-button type="primary" icon="el-icon-search" style="margin-left: 15px" @click="getUserRole" circle></el-button>
    <el-row>
      <el-col :span="12" :offset="1">
        <el-table
          style="width: 650px"
          :data="userInfo">
          <el-table-column
            prop="nickName"
            label="用户名">
          </el-table-column>
          <el-table-column
            prop="username"
            label="学工号">
          </el-table-column>
          <el-table-column label="分配角色">
            <template slot-scope="scope">
              <el-button
                size="mini" type="danger"
                @click="allocate(scope.row)">分配</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
      <el-col :span="9">
        <el-transfer :titles="['未拥有', '已拥有']" :props="{key: 'id', label: 'name'}"
          style="margin-top: 200px" v-model="roles" :data="allRoles"></el-transfer>
        <el-button style="margin-left: 35%; margin-top: 50px;" type="primary" @click="confirm">确定</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>

  import { allocateRole, getAllUserWithRole } from '../../api/user'
  import { getAllRoles } from '../../api/role'

  export default {
    name: 'UserRole',
    data(){
      return{
        allRoles: [],
        userInfo:[],
        roles: [],
        selectUser: '',
        filterUsername: ''
      }
    },
    methods:{
      allocate(user){
        this.selectUser = user
        this.roles = []
        if (this.selectUser.roles){
          this.selectUser.roles.forEach(r => {
            this.roles.push(r.id)
          })
        }
      },
      confirm(){
        allocateRole(this.selectUser.id, this.roles).then(res => {
          this.$message.success(res.msg)
        })
      },
      getUserRole(){
        getAllUserWithRole(this.filterUsername).then(res => {
          // console.log(res.data)
          this.userInfo = res.data
        })
      }
    },
    mounted() {
      getAllRoles().then(res => {
        this.allRoles = res.data
      })
      this.getUserRole()
    }
  }
</script>

<style scoped>

</style>

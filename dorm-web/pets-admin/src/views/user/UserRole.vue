<template>
  <div>
    <el-input style="width: 200px; margin-left: 5%; margin-top: 50px" v-model="filterUsername" placeholder="输入学工号查找"></el-input>
    <el-button type="primary" icon="el-icon-search" style="margin-left: 15px" @click="getUserRole" circle></el-button>
    <el-row>
      <el-col :span="8" :offset="1" style="height: 100%">
        <el-table
          style="width: 100%"
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
      <el-col :offset="1" :span="13">
        <div style="position: fixed" >
          <el-transfer :titles="['未拥有', '已拥有']" :props="{key: 'id', label: 'name'}"
                       style="margin-top: 2rem;" v-model="roles" :data="allRoles"></el-transfer>
          <el-button style="margin-left: 40%; margin-top: 2rem;width: 100px" type="primary" @click="confirm">确定</el-button>
        </div>

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

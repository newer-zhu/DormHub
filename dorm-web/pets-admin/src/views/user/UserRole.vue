<template>
  <div>
    <el-input style="width: 200px; margin-left: 10%" placeholder="输入学工号查找"></el-input>
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
        <el-transfer :titles="['已拥有', '未拥有']"
          style="margin-top: 200px" v-model="roles" :data="roleSource"></el-transfer>
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
        selectUser: ''
      }
    },
    methods:{
      allocate(user){
        this.selectUser = user
        // allocateRole(user.id, this.roles).then(res => {
        //
        // })
      }
    },
    computed:{
      roleSource(){
        if (this.selectUser.roles){
          let res = []
          this.selectUser.roles.forEach(r => {
            res.push({key:r.id, label: r.name})
          })
          return res
        }
      }
    },
    mounted() {
      getAllRoles().then(res => {
        this.allRoles = res.data
      })
      getAllUserWithRole().then(res => {
        console.log(res.data)
        this.userInfo = res.data
      })
    }
  }
</script>

<style scoped>

</style>

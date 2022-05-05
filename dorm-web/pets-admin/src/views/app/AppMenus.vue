<template>
  <div>
    <el-row>
      <el-col :span="8" >
        <el-table
          :data="roles"
          style="width: 100%;">
          <el-table-column
            prop="roleName"
            label="角色关键字">
          </el-table-column>
          <el-table-column
            prop="name"
            label="角色名称">
          </el-table-column>
          <el-table-column
            label="设置权限">
            <template  slot-scope="scope">
              <el-button v-if="chooseRole != scope.row.id" @click="allocateMenus(scope.row.id)" type="primary">分配菜单</el-button>
              <el-button type="warning" @click="setMenus" v-else>设置菜单</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
      <el-col :span="13" :offset="1">
        <el-tree
          :data="menus"
          show-checkbox
          ref="tree"
          node-key="id"
          :props="{
          children: 'children',
          label: 'name'
        }">
        </el-tree>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getAllRoles } from '../../api/role'
  import { getMenusByRoleId, setMenusWithRoleId } from '../../api/app'
  import { getAllMenus } from '../../api/menu'

  export default {
    name: 'AppMenus',
    data() {
      return {
        roles: [],
        menus: [],
        chooseRole: '',
        checkedKey: []
      }
    },
    methods: {
      allocateMenus(roleId){
        this.chooseRole = roleId
        this.checkedKey = []
        getMenusByRoleId(roleId).then(res => {
          res.data.forEach(f => {
            this.checkedKey.push(f)
            if (f.children){
              f.children.forEach(ff => {
                this.checkedKey.push(ff)
              })
            }
          })
          console.log(this.checkedKey)
          this.$refs.tree.setCheckedNodes(this.checkedKey)
        })
      },
      setMenus(){
        let param = []
        let nodes = this.$refs.tree.getCheckedNodes()
        nodes.forEach(n => {param.push(n.id)})
        setMenusWithRoleId(this.chooseRole, param).then(res => {
          this.$message.success(res.msg)
        })
      }
    },
    mounted() {
      getAllMenus().then(res => {
        this.menus = res.data
        getAllRoles().then(res => {
          this.roles = res.data
        })
      })
    }
  }
</script>

<style scoped>

</style>

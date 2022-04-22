<template>
  <div>
    <el-row style="margin-top: 1rem">
      <el-col :span="3" :offset="1">
        <el-dropdown @command="changeBuilding" split-button type="primary">
          {{selectedBuilding}}
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item :command="i" v-for="i in buildings" :key="i">{{i}}</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-col>

      <el-col :span="3" :offset="1">
        <el-dropdown @command="changeFloor" split-button type="success">
          {{selectedFloor+' 楼'}}
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item :command="i" v-for="i in floors" :key="i">{{i+' 楼'}}</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-col>
    </el-row>

    <el-row style="margin: 2rem 0px 10rem 0px" type="flex" justify="center">
      <el-col :span="22">
        <el-table
          border stripe
          :data="tableData"
          style="width: 100%">
          <el-table-column type="expand">
            <template slot-scope="props">
              <div>
                <el-descriptions :column="4" style="margin: 5px 0px 0px 20px" v-for=" m in props.row.members" :key="m.id">
                  <el-descriptions-item label="学工号">{{m.username}}</el-descriptions-item>
                  <el-descriptions-item label="用户名">{{m.nickName}}</el-descriptions-item>
                  <el-descriptions-item label="备注">
                    <el-tag v-if="props.row.admin == m.id" type="success" size="small">寝室长</el-tag>
                    <el-tag v-else size="small">成员</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item>
                    <el-button :disabled="props.row.admin == m.id" @click="setAdmin(props.row.id, m.id)" type="warning" size="small">设为寝室长</el-button>
                  </el-descriptions-item>
                </el-descriptions>
              </div>
            </template>
          </el-table-column>
          <el-table-column
            label="楼 号"
            prop="buildingId">
          </el-table-column>
          <el-table-column
            sortable
            label="门 牌 号"
            prop="dormId">
          </el-table-column>
          <el-table-column
            label="容 量"
            prop="capacity">
          </el-table-column>
          <el-table-column
            label="入住人数"
            prop="occupation">
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getBuildings, getDormsWithStu, setDormAdmin } from '../../api/dorm'

  export default {
    name: 'DormTable',
    data() {
      return {
        buildings: [],
        floors: [1,2,3,4,5,6],
        selectedBuilding: '',
        selectedFloor: 1,
        tableData: []
      }
    },
    methods:{
      setAdmin(dormId, uid){
        setDormAdmin(dormId, uid).then(res => {
          this.$message({type: 'success', message: res.msg})
          this.getDorms(this.selectedBuilding, this.selectedFloor)
        })
      },
      changeBuilding(val){
        this.selectedBuilding = val
        this.selectedFloor = 1
        this.getDorms(this.selectedBuilding, this.selectedFloor)
      },
      changeFloor(val){
        this.selectedFloor = val
        this.getDorms(this.selectedBuilding, this.selectedFloor)
      },
      getDorms(buildingId, floor){
        getDormsWithStu(buildingId, floor).then(res => {
          console.log(res.data)
          this.tableData = res.data
          this.$message({type: 'info', message: '加载成功'})
        })
      }
    },
    mounted() {
      getBuildings().then(res => {
        this.buildings = res.data
        this.selectedBuilding = this.buildings[0]
        this.getDorms(this.selectedBuilding, 1)
      })
    }
  }
</script>

<style scoped>

</style>

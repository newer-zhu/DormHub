<template>
  <div>
    <el-row type="flex" justify="center">
      <el-col :span="22">
        <el-table
          :data="tableData"
          style="margin-top: 40px"
          :default-sort = "{prop: 'datetime', order: 'descending'}"
          :row-class-name="tableRowClassName">
          <el-table-column
            prop="title"
            label="标题"
            width="250">
          </el-table-column>
          <el-table-column
            prop="user.nickName"
            label="发布人"
            width="150">
          </el-table-column>
          <el-table-column
            prop="publishTime"
            sortable
            label="发布日期"
            width="200">
          </el-table-column>
          <el-table-column
            prop="delFlag"
            label="是否撤回"
            width="100">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.delFlag === 1" type="danger">是</el-tag>
              <el-tag v-else type="success">否</el-tag>
            </template>
          </el-table-column>
          <el-table-column
            prop="confirm"
            label="收到人数"
            width="150">
          </el-table-column>
          <el-table-column
            label="操作"
            width="280">
            <template slot-scope="scope">
              <el-button type="primary" @click="ToEdit(scope.row.id)">编辑</el-button>
              <el-button @click="withdrew(scope.row.id)" v-if="scope.row.delFlag === 0" type="info">撤回</el-button>
              <el-button @click="disWithdrew(scope.row.id)" v-else type="warning">取消撤回</el-button>
              <el-button @click="del(scope.row.id)" type="danger">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
    <el-row style="margin-top: 40px" type="flex" justify="center">
      <el-pagination
        :current-page="cur"
        background
        @current-change="change"
        layout="prev, pager, next"
        :page-count="pages">
      </el-pagination>
    </el-row>
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="30%">
      <span>确认删除吗？将不可恢复</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="confirm">确 定</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>
  import { disWithdrewById, getAnnouncements, withdrewById, deleteById } from '../../api/anno'

  export default {
    name: 'AnnoTable',
    data(){
      return{
        dialogVisible: false,
        delId: '',
        tableData: [],
        cur: 1,//当前页
        pages: 1,//总页数
      }
    },
    methods:{
      getTableData(cur){
        getAnnouncements(cur).then(res => {
          console.log(res.data)
          this.tableData = res.data.records
          this.pages = res.data.pages
        })
      },
      tableRowClassName({row, rowIndex}) {
        if (row.delFlag === 1) {
          return 'warning-row';
        } else {
          return 'success-row';
        }
      },
      ToEdit(id){
        this.$router.push({
          path: '/announcement/edit/'+id
        })
      },
      withdrew(id){
        withdrewById(id).then(res => {
          this.$message(res.msg)
          this.getTableData(this.cur)
        })
      },
      disWithdrew(id){
        disWithdrewById(id).then(res => {
          this.$message(res.msg)
          this.getTableData(this.cur)
        })
      },
      del(id){
        this.delId = id
        this.dialogVisible = true
      },
      confirm(){
        deleteById(this.delId).then(res => {
          this.$message(res.msg)
        })
        this.dialogVisible = false
      },
      change(cur){
        this.getTableData(cur)
      }
    },
    mounted() {
      this.getTableData(1)
    }
  }
</script>

<style scoped>
  .el-table .warning-row {
    background: oldlace;
  }

  .el-table .success-row {
    background: #f0f9eb;
  }
</style>

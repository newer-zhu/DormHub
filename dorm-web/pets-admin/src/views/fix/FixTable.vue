<template>
  <div>
    <el-row style="margin-top: 20px" type="flex" justify="center">
      <el-col :span="22">
        <el-table
          :data="tableData"
          :default-sort = "{prop: 'date', order: 'descending'}"
        >
          <el-table-column
            prop="createTime"
            label="申请日期"
            sortable
            :formatter="formatterTime"
            width="140">
          </el-table-column>
          <el-table-column
            prop="expectTime"
            label="预约维修时间"
            sortable
            width="180">
          </el-table-column>
          <el-table-column
            prop="cat.category"
            label="分类"
            width="120">
          </el-table-column>
          <el-table-column
            prop="dorm.buildingId"
            label="寝室楼"
            width="120">
          </el-table-column>
          <el-table-column
            prop="dorm.dormId"
            label="门牌号"
            width="100">
          </el-table-column>
          <el-table-column
            prop="phone"
            label="电话"
            width="140">
          </el-table-column>
          <el-table-column
            prop="status"
            width="100"
            label="状态">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.status === 1" type="success">已维修</el-tag>
              <el-tag v-else type="danger">未处理</el-tag>
            </template>
          </el-table-column>
          <el-table-column
            prop="priority"
            sortable
            :sort-method="sortPriority"
            label="优先级"
            width="100">
            <template slot-scope="scope">
              <el-tag effect="dark" v-if="scope.row.priority === 0" type="danger">紧急</el-tag>
              <el-tag effect="dark" v-else-if="scope.row.priority === 1" type="warning">急迫</el-tag>
              <el-tag effect="dark" v-else-if="scope.row.priority === 2" >较急</el-tag>
              <el-tag effect="dark" v-else-if="scope.row.priority === 3" type="info">不急</el-tag>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            width="200">
            <template slot-scope="scope">
              <el-button size="small" @click="show(scope.row)" round>详细信息</el-button>
              <el-button type="primary" :disabled="scope.row.status === 1" size="small" @click="fixFinish(scope.row.id)" round>维修完成</el-button>
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
      title="详细信息"
      :visible.sync="showInfo"
      width="60%"
      center>
      <el-row style="font-size: 16px">
        <el-row>
          <el-col :span="4"><i class="el-icon-s-goods"></i>维修物品</el-col>
          <el-col :span="20"><span style="margin-left: 15px">{{info.thing}}</span></el-col>
        </el-row>
        <el-row style="margin-top: 15px">
          <el-col :span="4"><i class="el-icon-close"></i>数量</el-col>
          <el-col :span="20"><span style="margin-left: 15px">{{info.num}}</span></el-col>
        </el-row>
        <el-row style="margin-top: 15px">
          <el-col :span="4"><i class="el-icon-edit-outline"></i>备注</el-col>
        </el-row>
        <div style="margin-left: 15px; color: #2b2f3a;margin-top: 5px;word-wrap: normal">{{info.detail}}</div>

        <el-row style="margin-top: 10px">
          <el-col :span="4"><i class="el-icon-picture"></i>图片</el-col>
        </el-row>
        <el-row v-if="info.images">
          <el-image
            v-for="(p,i) in urls" :key="i"
            style="width: 120px; height: 120px; padding: 5px"
            :src="p"
            :preview-src-list="urls">
          </el-image>
        </el-row>

      </el-row>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="showInfo = false">确 定</el-button>
      </span>
    </el-dialog>

  </div>
</template>

<script>
  import { finish, getAllCategories, getFixReportsByCondition } from '../../api/fix'

  export default {
    name: 'FixTable',
    data() {
      return {
        catsMap: [],
        tableData: [],
        cur: 1,
        pages: 1,
        showInfo: false,
        info: {},
        urls: []
      }
    },
    methods: {
      async fixFinish(id){
        await finish(id).then(res => {
          this.$message({
            message: res.msg,
            type: 'success'
          });
          this.getTableData(this.cur)
        })
      },
      sortPriority(a, b){
        return a.priority -b.priority
      },
      change(cur){
        this.getTableData(cur)
      },
      imageUrl(data){
        return data.map(m => {return m.url})
      },
      show(item){
        this.info = item
        this.urls = item.images.map(m => {return m.url})
        this.showInfo = true
      },
      formatterTime(row, column) {
        return row.createTime.substr(0,11)
      },
      getTableData(cur){
        getFixReportsByCondition(cur).then(res => {
          // console.log(res.data)
          this.tableData = res.data.records
          this.pages = res.data.pages
        })
      }
    },
    mounted() {
      this.getTableData(1)
    }
  }
</script>

<style scoped>

</style>

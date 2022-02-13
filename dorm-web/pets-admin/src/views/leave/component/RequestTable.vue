<template>
  <div>
      <el-row style="margin-top: 20px">
          <el-col :span="9">
            <el-table
              height="550px"
              :data="tableData"
              :default-sort = "{prop: 'date', order: 'descending'}"
            >
              <el-table-column
                prop="createTime"
                label="申请时间"
                sortable
                width="170">
              </el-table-column>
              <el-table-column
                prop="auditorUser.nickName"
                label="申请人"
                width="100">
              </el-table-column>
              <el-table-column
                prop="status"
                label="状态"
                width="100">
                <template scope="scope">
                  <el-tag type="warning" v-if="scope.row.status === 0">
                    未处理
                  </el-tag>
                  <el-tag type="danger" v-else-if="scope.row.status === -1">
                    不通过
                  </el-tag>
                  <el-tag type="success" v-else-if="scope.row.status === 1">
                    已通过
                  </el-tag>
                  <el-tag type="info" v-else-if="scope.row.status === 2">
                    已销假
                  </el-tag>
                </template>
              </el-table-column>
              <el-table-column
                label="操作"
                width="95">
                <template scope="scope">
                  <el-button type="primary" size="small" @click="check(scope.row)">查看</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-col>
          <el-col :span="11">
            <el-card v-if="req" shadow="never">
              <el-descriptions border  title="假条信息" :column="2">
                <el-descriptions-item label="申请人">{{req.auditorUser.nickName}}</el-descriptions-item>
                <el-descriptions-item label="申请人学号">{{req.auditorUser.username}}</el-descriptions-item>
                <el-descriptions-item label="批准人">{{req.proposerUser.nickName}}</el-descriptions-item>
                <el-descriptions-item label="批准人工号">{{req.proposerUser.username}}</el-descriptions-item>
                <el-descriptions-item label="起始时间">{{req.startTime}}</el-descriptions-item>
                <el-descriptions-item label="结束时间">{{req.endTime}}</el-descriptions-item>
                <el-descriptions-item label="销假时间" v-if="req.status !== 0">{{req.destroyTime}}</el-descriptions-item>
                <el-descriptions-item label="批准时间" v-if="req.status !== 0">{{req.approveTime}}</el-descriptions-item>
              </el-descriptions>
              <el-descriptions :column="1" border>
                <el-descriptions-item label="请假原因">
                  {{req.reason}}
                </el-descriptions-item>
                <el-descriptions-item label="批准备注">
                  <div v-if="req.status != 0">
                    {{req.advice}}
                  </div>
                  <el-input  :autosize="{ minRows: 2, maxRows: 4}"
                             v-model="req.advice" type="textarea" v-else/>
                </el-descriptions-item>
              </el-descriptions>

              <el-row type="flex" v-if="req.status === 0" style="margin-top: 10px" justify="center">
                <el-button type="primary" @click="pass">同意</el-button>
                <el-button type="danger" @click="fail">驳回</el-button>
              </el-row>
            </el-card>
            <el-result v-else icon="info" title="信息提示" subTitle="假条信息"/>
          </el-col>
          <el-col :span="4" v-show="req">
            <el-card style="width: 130px" shadow="hover" v-for="(p,i) in urls" :key="i">
              <el-image
                :src="p"
                :preview-src-list="urls">
              </el-image>
            </el-card>
          </el-col>
        </el-row>
  </div>
</template>

<script>
  import { failRequest, passRequest } from '../../../api/leave'

  export default {
    name: 'RequestTable',
    data(){
      return{
        req: '',
        urls: []
      }
    },
    props:{
      tableData:{
        type: Array,
        default: []
      }
    },
    mounted() {
      console.log(this.tableData)
    },
    methods:{
      check(r){
        this.req = r
        this.urls = r.imageList.map(m => {return m.url})
      },
      async pass(){
        await passRequest(this.req).then(res => {
          if (res.code === 200){
            this.$message({type: 'success', message: res.msg})
            for (let i = 0; i < this.tableData.length; i++) {
              if (this.tableData[i].id === this.req.id){
                this.tableData.splice(i, 1)
              }
            }
          }
        })
        this.req = ''
      },
      async fail(){
        await failRequest(this.req).then(res => {
          if (res.code === 200){
            this.$message({type: 'success', message: res.msg})
            for (let i = 0; i < this.tableData.length; i++) {
              if (this.tableData[i].id === this.req.id){
                this.tableData.splice(i, 1)
              }
            }
          }
        })
        this.req = ''
      },
    }
  }
</script>

<style>
</style>

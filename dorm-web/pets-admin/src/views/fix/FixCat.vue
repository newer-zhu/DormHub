<template>
  <div>
    <el-row>
      <el-col :offset="1" :span="11">
        <el-table height="650" max-height="650" style="margin-top: 20px; width: 100%" :data="catsMap">
          <el-table-column label="ID" prop="id" width="50"/>
          <el-table-column width="250" label="分类名">
            <template scope="scope">
              <el-input v-show="scope.row.edit" size="small" v-model="scope.row.category"></el-input>
              <span v-show="!scope.row.edit">{{ scope.row.category }}</span>
            </template>
          </el-table-column>
          <el-table-column width="150" label="等级">
            <template scope="scope">
              <el-rate :disabled="!scope.row.edit" v-model="scope.row.priority"></el-rate>
            </template>
          </el-table-column>
          <el-table-column align="center" width="150">
            <template slot="header" slot-scope="scope">
              <el-button @click="dialogFormVisible = true" size="small">
                添加
              </el-button>
            </template>
            <template scope="scope">
              <el-button v-show='!scope.row.edit' type="primary" @click='scope.row.edit=true' size="small" icon="edit">编辑</el-button>
              <el-button v-show='scope.row.edit' type="success" @click='update(scope.row)' size="small" icon="check">完成</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>

      <el-col :span="11">
        <el-card class="box-card" style=" margin-top: 30px">
          <div id="myChart" style="width: 100%; height: 400px;"></div>
        </el-card>
      </el-col>
    </el-row>

    <el-dialog title="新增分类" :visible.sync="dialogFormVisible">
      <el-form :model="newItem">
        <el-form-item label="分类名称" label-width="100px">
          <el-input v-model="newItem.category" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="重要等级" label-width="100px">
          <el-rate v-model="newItem.priority"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { getAllCategories, getPieData, saveCategories, updateCategories } from '../../api/fix'
  // 引入基本模板
  let echarts = require('echarts/lib/echarts')
  require('echarts/lib/chart/pie')
  // 引入提示框和title组件
  require('echarts/lib/component/tooltip')
  require('echarts/lib/component/title')
  export default {
    name: 'FixCat',
    data(){
      return{
        catsMap: [],
        dialogFormVisible: false,
        newItem: {
          category: '',
          priority: 0
        },
        pie: ''
      }
    },
    methods:{
      getData(){
        getAllCategories().then(res => {
          this.catsMap = res.data
          this.catsMap.forEach(f => {
            this.$set(f, 'edit', false)
            this.$set(f, 'number', 0)
          })
          // console.log(this.catsMap)
        })
      },
      async save(){
        await saveCategories(this.newItem).then(res => {
          this.$message(res.msg)
          this.newItem = {}
          this.dialogFormVisible = false
        })
        this.getData()
      },
      update(data){
        updateCategories(data).then(res => {
          data.edit=false
        })
      },
      drawLine(){
        // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('myChart'))
        getPieData().then(res => {
          this.pie = res.data
          // 绘制图表
          myChart.setOption({
            title: { text: '维修单饼图' },
            series: [
              {
                type: 'pie',
                data: this.pie,
                radius: '50%',
                emphasis: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                },
                label:{
                  show: true,
                  formatter: '{b} : {c} ({d}%)'
                },
                labelLine :{show:true}
              }
            ]
          });
        })
      }
    },
    mounted() {
      this.drawLine();
      this.getData()
    }
  }
</script>

<style scoped>

</style>

<template>
  <div>
    <el-row style="margin-top: 20px; padding: 0px 30px" type="flex" >
      <el-col v-for="(b,i) in buildings" :span="4" :key="i">
        <el-button icon="el-icon-school" @click="getDorms(b)" class="button" :disabled="b == selectedBuilding">
          {{b}}
        </el-button>
      </el-col>
    </el-row>

    <el-row style="margin-top: 20px; padding: 0px 30px">
      <el-col :span="2" v-for="(d,i) in dorms">
        <el-button @click="open(d.id)" icon="el-icon-house" style="margin-top: 15px; width: 80%" type="warning">{{d.dormId}}</el-button>
      </el-col>
    </el-row>

    <el-drawer
      title="宿舍床位"
      :visible.sync="drawer"
      size="60%"
      direction="btt">
      <el-row>
        <el-col v-for="b in beds" :span="8">
          <el-card style="margin: 10px 10px; height: 150px">
            <el-row>
              <el-col :span="6">
                <el-avatar style="height: 100px; width: 100px;" :src="b.user? b.user.avatar : ''"/>
              </el-col>
              <el-col :span="7" :offset="1">
                <div style="font-size: 22px;">{{'床号 '+b.bedNum}}</div>
                <div style="font-size: 20px;color: #5a5e66;margin-top: 10px">{{b.user? '姓名 '+b.user.nickName:'空'}}</div>
                <div style="font-size: 20px;color: #5a5e66">{{b.user? '学号 '+b.user.username : '空'}}</div>
              </el-col>
              <el-col :span="10">
                <el-collapse-transition>
                  <div v-show="isDisplay === b.id">
                    <el-input v-model="input"  placeholder="请输入学生学号"></el-input>
                    <el-button @click="isDisplay = ''" style="margin-top: 20px; margin-left: 1rem">
                      取 消
                    </el-button>
                    <el-popconfirm
                      @confirm="allocate(b.id)"
                      :title="targetUser? '确定把此床位分配给【'+targetUser.nickName+'】吗？' : '系统中没有此用户！'">
                      <el-button type="warning" slot="reference" @click="change()" style="margin-top: 20px;margin-left: 1rem ;">
                        分 配
                      </el-button>
                    </el-popconfirm>
                  </div>
                </el-collapse-transition>

                <el-button type="primary" v-show="isDisplay === ''" @click="isDisplay = b.id" style="margin-top: 2rem; margin-left: 7rem">
                  调 整
                </el-button>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-drawer>

  </div>
</template>

<script>
  import {  getBuildings, getDormsByBuildingId } from '../../api/dorm'
  import { getBedsByDormId, setBed } from '../../api/bed'
  import CollapseTransition from 'element-ui/lib/transitions/collapse-transition';
  import { searchUsers } from '../../api/user'
  export default {
    name: 'DormBedManage',
    components:{
      CollapseTransition
    },
    data(){
      return{
        drawer: false,
        buildings: [],
        dorms: [],
        beds: [],
        input: '',
        isDisplay: '',
        targetUser: '',
        selectedBuilding: ''
      }
    },
    methods:{
      allocate(bid){
        if (this.targetUser){
          setBed(this.targetUser.id, bid).then(res => {
            this.$message({type: 'success', message: res.msg})
            if (res.code === 200){
              this.beds.forEach(f => {
                if (f.id == bid)
                  f.user = this.targetUser
              })
            }
            this.input = ''
            this.isDisplay = ''
          })
        }
      },
      getDorms(b){
        this.selectedBuilding = b
        getDormsByBuildingId(b).then(res => {
          this.dorms = res.data
          // console.log(res.data)
        })
      },
      async open(id){
        await getBedsByDormId(id).then(res => {
          this.beds = res.data
        })
        this.drawer = true
      },
      change(){
        searchUsers({username: this.input}).then(res => {
          if (this.input){
            if (res.data){
              this.targetUser = res.data[0]
            }
          }
        })
      }
    },
    mounted() {
      getBuildings().then(res => {
        this.buildings = res.data
      })
    }
  }
</script>

<style scoped>
  .button{
    width: 75%;
    height: 50px;
    font-size: 18px;
    background-color: #3f9dfe;
    color: #ffffff
  }
</style>

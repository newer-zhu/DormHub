<template>
  <div>
    <el-row type="flex" style="margin-top: 20px" justify="flex-start">
      <el-col style="margin-left: 30px" :span="4">
        <el-button v-show="!isChoose" type="primary" @click="isChoose = true">批量操作</el-button>
        <el-button v-show="isChoose" @click="isChoose = false">取消批量</el-button>
      </el-col>
      <el-col :span="6">
        <el-button type="success" @click="selectAll">全部选择</el-button>
        <el-button type="warning" @click="cancelAll">取消全选</el-button>
      </el-col>
      <el-col :span="4"><el-button type="primary" round @click="passSelected">通过审核</el-button></el-col>
    </el-row>
    <el-row type="flex" :gutter="10" justify="flex-start" style="flex-wrap: wrap; padding: 10px 30px">
      <el-col v-for="(p,i) in list" :key="p.id" :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <el-link @click="showPage(p)" style="font-size: 16px; color: #2c2c2c" :underline="true" type="primary">
              {{titleStr(p.title)}}
            </el-link>
            <el-checkbox :label="p.id" style="float: right; padding: 3px 0" v-model="select" v-if="isChoose"></el-checkbox>
            <el-button v-else style="float: right; padding: 3px 0" @click="pass(p)" type="text">通过</el-button>
          </div>
          <div class="card-text">
            {{contentStr(p.content)}}
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-empty v-show="!list.length" description="暂无待审核帖子"></el-empty>
    <PostDetail ref="dialog" @update="getData" :detail="detail"/>
  </div>
</template>

<script>
  import { getUncheckedPosts, passPost, passPosts } from '../../api/post'
  import PostDetail from './component/PostDetail'

  export default {
    name: 'PostCheck',
    components: { PostDetail },
    data(){
      return{
        list: [],
        isChoose: false,
        detail: {post: '', checkable: true},
        select: []
      }
    },
    methods:{
      titleStr(str){
        return str.length >= 18? str.substr(0,16)+'...' : str
      },
      contentStr(str){
        return str.length >= 180? str.substr(0,180)+'...' : str
      },
      showPage(page){
        this.detail.post = page
        this.$refs.dialog.open()
      },
      pass(post){
        passPost(post.id).then(res => {
          this.$notify({type: 'success', message: '['+post.title+']已通过'})
          this.getData()
        })
      },
      getData(){
        getUncheckedPosts().then(res => {
          console.log(res.data)
          this.list = res.data
        })
      },
      selectAll(){
        this.cancelAll()
        this.list.forEach(f => {
          this.select.push(f.id)
        })
      },
      cancelAll(){
        this.select = []
      },
      async passSelected(){
        if (this.select.length !== 0){
          await passPosts(this.select).then(res => {
            this.$notify({type: 'success', message: res.msg})
          })
          this.select = []
          this.getData()
        }
      }
    },
    mounted() {
      this.getData()
    }
  }
</script>

<style scoped>
  .box-card{
    margin-top: 10px;
    height: 300px;
  }
  .card-text{
    color: #5a5e66;
    font-size: 16px;
  }
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
</style>

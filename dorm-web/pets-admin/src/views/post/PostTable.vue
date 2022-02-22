<template>
  <div>
    <el-row style="margin-top: 15px;margin-left: 35px">
      <el-col :span="12">
        <el-input clearable placeholder="请输入内容" v-model="input" class="input-with-select">
          <el-select v-model="searchType" slot="prepend" placeholder="请选择">
            <el-option label="标题" value="1"></el-option>
            <el-option label="内容" value="2"></el-option>
            <el-option label="用户名" value="3"></el-option>
            <el-option label="用户学号" value="4"></el-option>
          </el-select>
        </el-input>
      </el-col>
      <el-col :span="2">
        <el-button style="margin-left: 5px" type="primary" @click="search" icon="el-icon-search">查找</el-button>
      </el-col>
    </el-row>

    <el-row type="flex" :gutter="10" justify="flex-start" style="flex-wrap: wrap; padding: 10px 30px">
      <el-col v-for="(p,i) in list" :key="p.id" :span="6">
        <el-card shadow="never" class="box-card">
          <div slot="header">
            <el-link style="font-size: 16px; color: #2c2c2c" :underline="true" type="primary">
              {{titleStr(p.title)}}
            </el-link>
            <el-checkbox :label="p.id" style="float: right; padding: 3px 0" v-model="select" v-if="isChoose"></el-checkbox>
            <el-popconfirm v-else @confirm="deleteById(p.id)"
              title="确定删除吗？" cancel-button-text="不" confirm-button-text="是的"
            >
              <el-button slot="reference" style="float: right; padding: 3px 0;" type="text">删除</el-button>
            </el-popconfirm>
          </div>

          <el-descriptions class="margin-top" title="" :column="1" direction="horizontal">
            <el-descriptions-item label="发布者名称">{{p.nickName}}</el-descriptions-item>
            <el-descriptions-item label="发布者学号">{{p.username}}</el-descriptions-item>
            <el-descriptions-item label="发布时间">{{p.time}}</el-descriptions-item>
            <el-descriptions-item label="审核">
              <el-tag size="small" v-if="p.status === 1">通过</el-tag>
              <el-tag type="danger" v-else size="small">未通过</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="点赞数">{{p.likeNum}}</el-descriptions-item>
            <el-descriptions-item label="评论数">{{p.commentNum}}</el-descriptions-item>
            <el-descriptions-item label="内容">
              <div style="display: inline">{{contentStr(p.content)}}</div>
              <el-link type="success" @click="showPanel(p)" style="margin-left: 5px">查看详情</el-link>
            </el-descriptions-item>
          </el-descriptions>
        </el-card>
      </el-col>
    </el-row>
<!--    分页-->
    <el-row style="margin-top: 40px" type="flex" justify="center">
      <el-pagination
        :current-page="cur"
        background
        @current-change="change"
        layout="prev, pager, next"
        :page-count="pages">
      </el-pagination>
    </el-row>

    <PostDetail ref="panel" :detail="this.detail" />
  </div>
</template>

<script>
  import { deletePost, getPostsByCondition } from '../../api/post'
  import PostDetail from './component/PostDetail'

  export default {
    name: 'PostTable',
    components: { PostDetail },
    data(){
      return{
        list: [],
        select: [],
        isChoose: false,
        input: '',
        searchType: '1',
        cur: 1,
        pages: 1,
        searchConfig:{
          content: '',
          title: '',
          username: '',
          nickName: '',
        },
        detail: {post: '', checkable: false}
      }
    },
    methods:{
      titleStr(str){
        return str.length >= 18? str.substr(0,16)+'...' : str
      },
      contentStr(str){
        return str.length >= 15? str.substr(0,12)+'...' : str
      },
      change(cur){
        this.getData(cur)
      },
      search(){
        this.searchConfig = {}
        switch (this.searchType) {
          case '1':
            this.searchConfig.title = this.input
            break
          case '2':
            this.searchConfig.content = this.input
            break
          case '3':
            this.searchConfig.nickName = this.input
            break
          case '4':
            this.searchConfig.username = this.input
            break
        }
        this.getData(1)
      },
      getData(cur){
        getPostsByCondition(cur, this.searchConfig).then(res => {
          console.log(res.data.records)
          this.list = res.data.records
          this.pages = res.data.pages
        })
      },
      deleteById(id){
        deletePost(id).then(res => {
          this.getData()
          this.$message({type: 'success', message: res.msg})
        })
      },
      showPanel(post){
        this.detail.post = post
        this.$refs.panel.open()
      }
    },
    mounted() {
      this.getData(1)
    }
  }
</script>

<style scoped>
  .box-card{
    margin-top: 10px;
    height: 320px;
  }
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
  .el-select .el-input {
    width: 130px;
  }
  .input-with-select .el-input-group__prepend {
    background-color: #fff;
  }
</style>

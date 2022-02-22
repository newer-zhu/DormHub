<template>
  <div>
    <el-dialog
      top="30px" style="height: 800px"
      title="内容"
      :visible.sync="show"
      width="50%"
      center>
      <el-row type="flex" justify="center">
        <el-col :span="3">
          <el-avatar :size="50" :src="post.avatar"></el-avatar>
        </el-col>
        <el-col :span="3">
          <div style="font-size: 18px; color: #2c2c2c; line-height: 25px">
            {{post.nickName}}
          </div>
          <div>
            {{post.buildingId}}
          </div>
        </el-col>
        <el-col :span="5" :offset="2">
          <span style="color: #5a5e66; font-size: 14px">{{post.time}}</span>
        </el-col>
      </el-row>
      <el-divider/>
      <el-row>
        <el-form label-width="80px">
          <el-form-item label="标题">
            <div>{{post.title}}</div>
          </el-form-item>
          <el-form-item label="内容">
            <div>{{post.content}}</div>
          </el-form-item>
          <el-form-item v-show="post.images" label="图片">
            <el-image
              v-for="(p,i) in urls" :key="i"
              style="width: 120px; height: 120px; padding: 5px"
              :src="p"
              :preview-src-list="urls">
            </el-image>
          </el-form-item>
        </el-form>
      </el-row>
      <span slot="footer" v-if="checkable" class="dialog-footer">
        <el-button @click="fail">不通过</el-button>
        <el-button type="primary" @click="pass">通 过</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  import { failPost, passPost } from '../../../api/post'

  export default {
    name: 'PostDetail',
    props:{
      detail:{
        type: Object,
        default: {}
      }
    },
    data(){
      return{
        urls: [],
        show: false,
      }
    },
    methods:{
      update(id){
        this.$emit('update', id)
      },
      pass(){
        passPost(this.post.id).then(res => {
          if (res.code === 200){
            this.update(this.post.id)
            this.$notify({type: 'success', message: '['+this.post.title+']已通过'})
            this.show = false
          }
        })
      },
      fail(){
        failPost(this.post.id).then(res => {
          if (res.code === 200){
            this.update(this.post.id)
            this.$message({type: 'warning', message: res.msg})
            this.show = false
          }
        })
      },
      open(){
        this.show = true
      }
    },
    watch:{
      detail(newVal, oldVal){
        this.post = newVal.post
        this.checkable = newVal.checkable
      },
      post(newVal, oldVal){
        if (newVal.images){
          this.urls = newVal.images.map(m => {return m.url})
        }
      }
    },
    computed:{
      post(){
        return this.detail.post
      },
      checkable(){
        return this.detail.checkable
      }
    },
    mounted() {

    }
  }
</script>

<style scoped>

</style>

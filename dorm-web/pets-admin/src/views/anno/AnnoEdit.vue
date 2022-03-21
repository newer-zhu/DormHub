<template>
  <div class="main">
    <el-row style="padding-top: 30px" type="flex" justify="center">
      <el-col :span="16" style="margin-bottom: 20px" :offset="1">
        <el-input maxlength="25" placeholder="请输入标题" v-model="announcement.title">
          <template slot="prepend">标题：</template>
        </el-input>
      </el-col>
    </el-row>

    <el-row type="flex" justify="center">
      <el-col :span="18">
        <el-input placeholder="下方编辑正文内容" disabled>
          <template slot="prepend">正文：</template>
        </el-input>
        <Editor style="background-color: #ffffff" @input="updateContent" @insertImg="imgAdd" :value="announcement.content"/>
      </el-col>
    </el-row>
    <el-row justify="center" type="flex">
      <el-col :span="4">
        <el-button v-if="!isEdit" size="large" style="margin-top: 70px" @click="submit" type="primary">发布公告</el-button>
        <el-button v-else size="large" style="margin-top: 70px" @click="update" type="primary">修改公告</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import 'quill/dist/quill.core.css'
  import 'quill/dist/quill.snow.css'
  import 'quill/dist/quill.bubble.css'
  import { quillEditor, Quill } from 'vue-quill-editor'
  import {container, ImageExtend, QuillWatch} from 'quill-image-extend-module'
  import { getById, saveAnnouncement, updateAnnouncement } from '../../api/anno'
  import Editor from './component/Editor'

  Quill.register('modules/ImageExtend', ImageExtend)
  export default {
    name: 'AnnoAdd',
    data() {
      return {
        announcement: {
          id: '',
          title: '',
          content: '',
          userId: this.$store.getters.userInfo.id,
          images: []
        }
      }
    },
    components: {
      Editor
    },
    methods: {
      updateContent(con){
        this.announcement.content = con
      },
      imgAdd(img){
        this.announcement.images.push(img)
      },
      submit(){
        if (!this.announcement.title || !this.announcement.content){
          this.$message({
            message: '请检查输入，标题和正文不能为空！',
            type: 'warning'
          });
        }else {
          this.announcement.user_id = this.$store.getters.userInfo.id
          saveAnnouncement(this.announcement).then(res => {
            if (res.code === 200){
              this.$message('发布成功');
              this.$router.replace({path: '/announcement/table'})
            }
          })
        }
      },
      update(){
        if (!this.announcement.title || !this.announcement.content){
          this.$message({
            message: '请检查输入，标题和正文不能为空！',
            type: 'warning'
          });
        }else {
          updateAnnouncement(this.announcement).then(res => {
            if (res.code === 200){
              this.$message('发布成功');
              this.$router.replace({path: '/announcement/table'})
            }else {
              this.$message.error(res.msg);
            }
          })
        }
      },
    },
    computed: {
      editor() {
        return this.$refs.myQuillEditor.quill
      },
      isEdit(){
        return this.$route.path.split('/')[2] === 'edit'
      }
    },
    mounted() {
      if (this.isEdit){
        getById(this.$route.params.id).then(res => {
          this.announcement = res.data
        })
      }
    }
  }
</script>

<style scoped>
  .line{
    text-align: center;
  }
  .main{
    background-color: #f5f6f9;
    height: 750px;
  }
</style>




<template>
  <div class="app-container">
    <el-row>
      <el-col :span="20" style="margin-bottom: 20px" :offset="1">
        <el-input maxlength="25" placeholder="请输入标题" v-model="announcement.title">
          <template slot="prepend">标题：</template>
        </el-input>
      </el-col>
    </el-row>

    <el-row type="flex" justify="center">
      <el-col :span="22">
        <el-input placeholder="下方编辑正文内容" disabled>
          <template slot="prepend">正文：</template>
        </el-input>
        <quill-editor
          class='editor'
          ref="myQuillEditor"
          v-model="announcement.content"
          :options="editorOption"
          @blur="onEditorBlur($event)"
          @focus="onEditorFocus($event)"
          @ready="onEditorReady($event)"
        />
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

  Quill.register('modules/ImageExtend', ImageExtend)
  export default {
    name: 'AnnoAdd',
    data() {
      // 工具栏配置
      const toolbarOptions = [
        ["bold", "italic", "underline", "strike"], // 加粗 斜体 下划线 删除线 -----['bold', 'italic', 'underline', 'strike']
        ["blockquote", "code-block"], // 引用  代码块-----['blockquote', 'code-block']
        [{ header: 1 }, { header: 2 }], // 1、2 级标题-----[{ header: 1 }, { header: 2 }]
        [{ list: "ordered" }, { list: "bullet" }], // 有序、无序列表-----[{ list: 'ordered' }, { list: 'bullet' }]
        [{ script: "sub" }, { script: "super" }], // 上标/下标-----[{ script: 'sub' }, { script: 'super' }]
        [{ indent: "-1" }, { indent: "+1" }], // 缩进-----[{ indent: '-1' }, { indent: '+1' }]
        [{ direction: "rtl" }], // 文本方向-----[{'direction': 'rtl'}]
        [{ size: ["small", false, "large", "huge"] }], // 字体大小-----[{ size: ['small', false, 'large', 'huge'] }]
        [{ header: [1, 2, 3, 4, 5, 6, false] }], // 标题-----[{ header: [1, 2, 3, 4, 5, 6, false] }]
        [{ color: [] }, { background: [] }], // 字体颜色、字体背景颜色-----[{ color: [] }, { background: [] }]
        [{ font: [] }], // 字体种类-----[{ font: [] }]
        [{ align: [] }], // 对齐方式-----[{ align: [] }]
        ["clean"], // 清除文本格式-----['clean']
        ["image", "video"] // 链接、图片、视频-----['link', 'image', 'video']
      ]

      return {
        editorOption: {
          //  富文本编辑器配置
          modules: {
            ImageExtend: {
              loading: true,
              name: 'img',
              size: 5,// 可选参数 图片大小，单位为M，1M = 1024kb
              headers: (xhr) => {
                xhr.setRequestHeader('Authorization', this.$store.getters.token)
              },  //设置请求头部
              action: 'http://loaclhost:8888/image/announcement',
              response: (res) => {
                return res.data.url
              },
              sizeError: () => {},  // 图片超过大小的回调
              start: () => {},  // 可选参数 自定义开始上传触发事件
              end: () => {},  // 可选参数 自定义上传结束触发的事件，无论成功或者失败
              error: () => {console.log("fail")},  // 可选参数 上传失败触发的事件
              success: () => {},  // 可选参数  上传成功触发的事件
              change: (xhr, formData) => {
                // xhr.setRequestHeader('myHeader','myValue')
                // formData.append('token', 'myToken')
              } // 可选参数 每次选择图片触发，也可用来设置头部，但比headers多了一个参数，可设置formData
            },
            //工具栏定义
            toolbar: {
              container: toolbarOptions,
              handlers: {
                'image': function() {
                  QuillWatch.emit(this.quill.id)
                }
              },
            },
          },
        },
        announcement: {
          id: '',
          title: '',
          content: '',
          userId: this.$store.getters.userInfo.id,
        }
      }
    },
    components: {
      quillEditor
    },
    methods: {
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
            }else {
              this.$message.error(res.msg);
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

      onEditorBlur(quill) {
      },
      onEditorFocus(quill) {
      },
      onEditorReady(quill) {
      },
      onEditorChange({ quill, html, text }) {
        console.log('editor change!', quill, html, text)
        this.content = html
      }
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
</style>

<style lang='scss' >
  .editor {
    line-height: normal !important;
    height: 450px;
  }
  .ql-snow .ql-tooltip[data-mode="link"]::before {
    content: "请输入链接地址:";
  }
  .ql-snow .ql-tooltip.ql-editing a.ql-action::after {
    border-right: 0px;
    content: "保存";
    padding-right: 0px;
  }

  .ql-snow .ql-tooltip[data-mode="video"]::before {
    content: "请输入视频地址:";
  }

  .ql-snow .ql-picker.ql-size .ql-picker-label::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item::before {
    content: "14px";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="small"]::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="small"]::before {
    content: "10px";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="large"]::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="large"]::before {
    content: "18px";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="huge"]::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="huge"]::before {
    content: "32px";
  }

  .ql-snow .ql-picker.ql-header .ql-picker-label::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item::before {
    content: "文本";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="1"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="1"]::before {
    content: "标题1";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="2"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="2"]::before {
    content: "标题2";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="3"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="3"]::before {
    content: "标题3";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="4"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="4"]::before {
    content: "标题4";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="5"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="5"]::before {
    content: "标题5";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="6"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="6"]::before {
    content: "标题6";
  }

  .ql-snow .ql-picker.ql-font .ql-picker-label::before,
  .ql-snow .ql-picker.ql-font .ql-picker-item::before {
    content: "标准字体";
  }
  .ql-snow .ql-picker.ql-font .ql-picker-label[data-value="serif"]::before,
  .ql-snow .ql-picker.ql-font .ql-picker-item[data-value="serif"]::before {
    content: "衬线字体";
  }
  .ql-snow .ql-picker.ql-font .ql-picker-label[data-value="monospace"]::before,
  .ql-snow .ql-picker.ql-font .ql-picker-item[data-value="monospace"]::before {
    content: "等宽字体";
  }
</style>



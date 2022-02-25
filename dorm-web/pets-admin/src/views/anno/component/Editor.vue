<template>
  <div>
    <quilleditor v-model="content"
                 class="editor"
                 ref="myTextEditor"
                 :options="editorOption"
                 @change="onChange"
    >
      <div id="toolbar" slot="toolbar">
        <select class="ql-size">
          <option value="small"></option>
          <!-- Note a missing, thus falsy value, is used to reset to default -->
          <option selected></option>
          <option value="large"></option>
          <option value="huge"></option>
        </select>
        <!-- Add subscript and superscript buttons -->
        <span class="ql-formats"><button class="ql-script" value="sub"></button></span>
        <span class="ql-formats"><button class="ql-script" value="super"></button></span>
        <span class="ql-formats"><button type="button" class="ql-bold"></button></span>
        <span class="ql-formats"><button type="button" class="ql-italic"></button></span>
        <span class="ql-formats"><button type="button" class="ql-blockquote"></button></span>
        <span class="ql-formats"><button type="button" class="ql-list" value="ordered"></button></span>
        <span class="ql-formats"><button type="button" class="ql-list" value="bullet"></button></span>
        <span class="ql-formats"><button type="button" class="ql-link"></button></span>
        <span class="ql-formats">
        <button type="button" @click="imgClick" style="outline:none">
        <svg viewBox="0 0 18 18"> <rect class="ql-stroke" height="10" width="12" x="3" y="4"></rect> <circle
          class="ql-fill" cx="6" cy="7" r="1"></circle> <polyline class="ql-even ql-fill"
                                                                  points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12"></polyline> </svg>
        </button>
      </span>
<!--        <span class="ql-formats"><button type="button" class="ql-video"></button></span>-->
      </div>
    </quilleditor>
  </div>
</template>

<script>
  import 'quill/dist/quill.core.css'
  import 'quill/dist/quill.snow.css'
  import 'quill/dist/quill.bubble.css'

  import {quillEditor} from 'vue-quill-editor'
  import { uploadImg } from '../../../api/anno'
  export default {
    name: "Editor",
    props: {
      value: {
        type: String
      },
      /*上传图片的地址*/
      // uploadUrl: {
      //   type: String,
      //   default: '/'
      // },
      /*上传图片的file控件name*/
      fileName: {
        type: String,
        default: 'img'
      },
      maxUploadSize:{
        type:Number,
        default: 1024 * 1024 * 1024
      }
    },
    data() {
      // 工具栏配置
      const toolbarOptions = [
        ["bold", "italic", "underline", "strike"], // 加粗 斜体 下划线 删除线 -----['bold', 'italic', 'underline', 'strike']
        ["blockquote"], // 引用  代码块-----['blockquote', 'code-block']
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
        ["image"] // 链接、图片、视频-----['link', 'image', 'video']
      ]
      return {
        content: '',
        editorOption: {
          modules: {
            toolbar: '#toolbar',
            // toolbar:{
            //   container: toolbarOptions,
            // }
          }
        },
      }
    },
    methods: {
      onChange() {
        this.$emit('input', this.content)
      },
      /*选择上传图片切换*/
      onFileChange(e) {
        var fileInput = e.target;
        if (fileInput.files.length === 0) {
          return
        }
        this.editor.focus();
        if (fileInput.files[0].size > this.maxUploadSize) {
          this.$alert('图片不能大于1MB', '图片尺寸过大', {
            confirmButtonText: '确定',
            type: 'warning',
          })
        }
        var data = new FormData;
        data.append(this.fileName, fileInput.files[0]);
        uploadImg(data)
          .then(res => {
            if (res.code == 200) {
              this.$emit('insertImg', res.data)
              this.editor.insertEmbed(this.editor.getSelection().index, 'image', res.data.url)
            }
          })
      },
      /*点击上传图片按钮*/
      imgClick() {
        /*内存创建input file*/
        var input = document.createElement('input');
        input.type = 'file';
        input.name = this.fileName;
        input.accept = 'image/jpeg,image/png,image/jpg,image/gif';
        input.onchange = this.onFileChange;
        input.click()
      }
    },
    computed: {
      editor() {
        return this.$refs.myTextEditor.quill
      }
    },
    components: {
      'quilleditor': quillEditor
    },
    mounted() {
      this.content = this.value
    },
    watch: {
      'value'(newVal, oldVal) {
        if (this.editor) {
          if (newVal !== this.content) {
            this.content = newVal
          }
        }
      },
    }
  }
</script>

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


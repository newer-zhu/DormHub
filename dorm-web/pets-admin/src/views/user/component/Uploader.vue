<template>
  <div>
    <el-upload
      ref="upload"
      :action="uploadUrl"
      :limit="1"
      name="excelFile"
      :file-list="fileList"
      :auto-upload="false"
      :http-request="importExcel"
      :before-upload="beforeUpload">
      <el-button :disabled="uploading" slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button :disabled="uploading" icon="el-icon-upload2" style="margin-left: 10px;" size="small" type="success" @click="submitUpload">批量导入</el-button>
      <div slot="tip" class="el-upload__tip">只能上传excel文件,不超过20M</div>
    </el-upload>
  </div>
</template>

<script>
  import { getToken } from '../../../utils/auth'
  import { uploadExcel } from '../../../api/user'

  export default {
    name: 'Uploader',
    data(){
      return{
        uploading: false,
        fileList: [],
        uploadUrl: process.env.VUE_APP_BASE_API + "/user/excel/import"
      }
    },
    computed:{
      headers(){
        const header = {
          "Authorization": getToken(),
          "Content-Type": "application/json;charset=UTF-8"
        }
        return header
      },
    },
    methods: {
      //自定义上传
      importExcel(param) {
        this.uploading = true
        const formData = new FormData()
        formData.append('excelFile', param.file)
        uploadExcel(formData).then(res => {
          if (res.code == 200) {
            this.fileList = []
            this.$message.success("导入成功,数据稍后刷新")
            this.uploading = false
            this.$emit('success')
          } else {
            this.$message.error("导入失败")
          }
        }).catch(err =>{
          console.log(err)
          this.$message.error("导入失败")
        })
      },
      // 上传前对文件的操作
      beforeUpload(file) {
        const extension = file.name.split(".")[1] === "xls";
        const extension2 = file.name.split(".")[1] === "xlsx";
        // const extension3 = file.name.split(".")[1] === "doc";
        // const extension4 = file.name.split(".")[1] === "docx";
        const isLt2M = file.size / 1024 / 1024 < 20;
        if (!extension && !extension2 ) {
          alert("上传模板只能是 xls、xlsx格式!");
        }
        if (!isLt2M) {
          console.log("上传模板大小不能超过 20MB!");
        }
        return extension || (extension2 && isLt2M);
      },
      submitUpload() {
        this.$refs.upload.submit()
      }
    }
  }
</script>

<style scoped>

</style>

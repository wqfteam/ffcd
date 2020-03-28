<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="资源名称" prop="sourceName">
      <el-input v-model="dataForm.sourceName" placeholder="资源名称"></el-input>
    </el-form-item>
    <el-form-item label="资源路径" prop="sourcePath">
      <el-input v-model="dataForm.sourcePath" placeholder="资源路径"></el-input>
    </el-form-item>
    <el-form-item label="资源上传文件名" prop="sourceNameUpload">
      <el-input v-model="dataForm.sourceNameUpload" placeholder="资源上传文件名"></el-input>
    </el-form-item>
    <el-form-item label="资源大小" prop="sourceSize">
      <el-input v-model="dataForm.sourceSize" placeholder="资源大小"></el-input>
    </el-form-item>
    <el-form-item label="资源类型" prop="sourceFileType">
      <el-input v-model="dataForm.sourceFileType" placeholder="资源类型"></el-input>
    </el-form-item>
    <el-form-item label="资源下载次数" prop="sourceDownloadCount">
      <el-input v-model="dataForm.sourceDownloadCount" placeholder="资源下载次数"></el-input>
    </el-form-item>
    <el-form-item label="资源点赞次数" prop="sourceCountLike">
      <el-input v-model="dataForm.sourceCountLike" placeholder="资源点赞次数"></el-input>
    </el-form-item>
    <el-form-item label="来源计数访问" prop="sourceCountVisit">
      <el-input v-model="dataForm.sourceCountVisit" placeholder="来源计数访问"></el-input>
    </el-form-item>
    <el-form-item label="资源排序" prop="sourceSort">
      <el-input v-model="dataForm.sourceSort" placeholder="资源排序"></el-input>
    </el-form-item>
    <el-form-item label="资源来源" prop="sourceSource">
      <el-input v-model="dataForm.sourceSource" placeholder="资源来源"></el-input>
    </el-form-item>
    <el-form-item label="资源后缀" prop="sourceSuffixt">
      <el-input v-model="dataForm.sourceSuffixt" placeholder="资源后缀"></el-input>
    </el-form-item>
    <el-form-item label="来源类类型" prop="sourceType">
      <el-input v-model="dataForm.sourceType" placeholder="来源类类型"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="sourceCreateTime">
      <el-input v-model="dataForm.sourceCreateTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="修改时间" prop="sourceModifyTime">
      <el-input v-model="dataForm.sourceModifyTime" placeholder="修改时间"></el-input>
    </el-form-item>
    <el-form-item label="扩展表类型" prop="extendTableType">
      <el-input v-model="dataForm.extendTableType" placeholder="扩展表类型"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          sourceName: '',
          sourcePath: '',
          sourceNameUpload: '',
          sourceSize: '',
          sourceFileType: '',
          sourceDownloadCount: '',
          sourceCountLike: '',
          sourceCountVisit: '',
          sourceSort: '',
          sourceSource: '',
          sourceSuffixt: '',
          sourceType: '',
          sourceCreateTime: '',
          sourceModifyTime: '',
          extendTableType: ''
        },
        dataRule: {
          sourceName: [
            { required: true, message: '资源名称不能为空', trigger: 'blur' }
          ],
          sourcePath: [
            { required: true, message: '资源路径不能为空', trigger: 'blur' }
          ],
          sourceNameUpload: [
            { required: true, message: '资源上传文件名不能为空', trigger: 'blur' }
          ],
          sourceSize: [
            { required: true, message: '资源大小不能为空', trigger: 'blur' }
          ],
          sourceFileType: [
            { required: true, message: '资源类型不能为空', trigger: 'blur' }
          ],
          sourceDownloadCount: [
            { required: true, message: '资源下载次数不能为空', trigger: 'blur' }
          ],
          sourceCountLike: [
            { required: true, message: '资源点赞次数不能为空', trigger: 'blur' }
          ],
          sourceCountVisit: [
            { required: true, message: '来源计数访问不能为空', trigger: 'blur' }
          ],
          sourceSort: [
            { required: true, message: '资源排序不能为空', trigger: 'blur' }
          ],
          sourceSource: [
            { required: true, message: '资源来源不能为空', trigger: 'blur' }
          ],
          sourceSuffixt: [
            { required: true, message: '资源后缀不能为空', trigger: 'blur' }
          ],
          sourceType: [
            { required: true, message: '来源类类型不能为空', trigger: 'blur' }
          ],
          sourceCreateTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          sourceModifyTime: [
            { required: true, message: '修改时间不能为空', trigger: 'blur' }
          ],
          extendTableType: [
            { required: true, message: '扩展表类型不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/source/source/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.sourceName = data.source.sourceName
                this.dataForm.sourcePath = data.source.sourcePath
                this.dataForm.sourceNameUpload = data.source.sourceNameUpload
                this.dataForm.sourceSize = data.source.sourceSize
                this.dataForm.sourceFileType = data.source.sourceFileType
                this.dataForm.sourceDownloadCount = data.source.sourceDownloadCount
                this.dataForm.sourceCountLike = data.source.sourceCountLike
                this.dataForm.sourceCountVisit = data.source.sourceCountVisit
                this.dataForm.sourceSort = data.source.sourceSort
                this.dataForm.sourceSource = data.source.sourceSource
                this.dataForm.sourceSuffixt = data.source.sourceSuffixt
                this.dataForm.sourceType = data.source.sourceType
                this.dataForm.sourceCreateTime = data.source.sourceCreateTime
                this.dataForm.sourceModifyTime = data.source.sourceModifyTime
                this.dataForm.extendTableType = data.source.extendTableType
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/source/source/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'sourceName': this.dataForm.sourceName,
                'sourcePath': this.dataForm.sourcePath,
                'sourceNameUpload': this.dataForm.sourceNameUpload,
                'sourceSize': this.dataForm.sourceSize,
                'sourceFileType': this.dataForm.sourceFileType,
                'sourceDownloadCount': this.dataForm.sourceDownloadCount,
                'sourceCountLike': this.dataForm.sourceCountLike,
                'sourceCountVisit': this.dataForm.sourceCountVisit,
                'sourceSort': this.dataForm.sourceSort,
                'sourceSource': this.dataForm.sourceSource,
                'sourceSuffixt': this.dataForm.sourceSuffixt,
                'sourceType': this.dataForm.sourceType,
                'sourceCreateTime': this.dataForm.sourceCreateTime,
                'sourceModifyTime': this.dataForm.sourceModifyTime,
                'extendTableType': this.dataForm.extendTableType
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>

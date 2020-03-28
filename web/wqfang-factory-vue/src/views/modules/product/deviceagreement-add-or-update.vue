<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="设备Id" prop="productDeviceBaseId">
      <el-input v-model="dataForm.productDeviceBaseId" placeholder="设备Id"></el-input>
    </el-form-item>
    <el-form-item label="ip地址" prop="ip">
      <el-input v-model="dataForm.ip" placeholder="ip地址"></el-input>
    </el-form-item>
    <el-form-item label="端口" prop="post">
      <el-input v-model="dataForm.post" placeholder="端口"></el-input>
    </el-form-item>
    <el-form-item label="串口端口名称" prop="serialPort">
      <el-input v-model="dataForm.serialPort" placeholder="串口端口名称"></el-input>
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
          productDeviceBaseId: '',
          ip: '',
          post: '',
          serialPort: ''
        },
        dataRule: {
          productDeviceBaseId: [
            { required: true, message: '设备Id不能为空', trigger: 'blur' }
          ],
          ip: [
            { required: true, message: 'ip地址不能为空', trigger: 'blur' }
          ],
          post: [
            { required: true, message: '端口不能为空', trigger: 'blur' }
          ],
          serialPort: [
            { required: true, message: '串口端口名称不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/product/deviceagreement/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.productDeviceBaseId = data.deviceagreement.productDeviceBaseId
                this.dataForm.ip = data.deviceagreement.ip
                this.dataForm.post = data.deviceagreement.post
                this.dataForm.serialPort = data.deviceagreement.serialPort
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
              url: this.$http.adornUrl(`/product/deviceagreement/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'productDeviceBaseId': this.dataForm.productDeviceBaseId,
                'ip': this.dataForm.ip,
                'post': this.dataForm.post,
                'serialPort': this.dataForm.serialPort
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

<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="名称" prop="regionName">
      <el-input v-model="dataForm.regionName" placeholder="名称"></el-input>
    </el-form-item>
    <el-form-item label="服务费用" prop="regionServiceCharge">
      <el-input v-model="dataForm.regionServiceCharge" placeholder="服务费用"></el-input>
    </el-form-item>
    <el-form-item label="最低消费" prop="regionMinCharge">
      <el-input v-model="dataForm.regionMinCharge" placeholder="最低消费"></el-input>
    </el-form-item>
    <el-form-item label="开启餐前结账" prop="regionFrontAccount">
      <el-input v-model="dataForm.regionFrontAccount" placeholder="开启餐前结账"></el-input>
    </el-form-item>
    <el-form-item label="扫码点餐验证码" prop="regionQr">
      <el-input v-model="dataForm.regionQr" placeholder="扫码点餐验证码"></el-input>
    </el-form-item>
    <el-form-item label="座位数" prop="regionSeatNum">
      <el-input v-model="dataForm.regionSeatNum" placeholder="座位数"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="修改时间" prop="modifyTime">
      <el-input v-model="dataForm.modifyTime" placeholder="修改时间"></el-input>
    </el-form-item>
    <el-form-item label="扩展表类型" prop="extendType">
      <el-input v-model="dataForm.extendType" placeholder="扩展表类型"></el-input>
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
          regionId: 0,
          regionName: '',
          regionServiceCharge: '',
          regionMinCharge: '',
          regionFrontAccount: '',
          regionQr: '',
          regionSeatNum: '',
          createTime: '',
          modifyTime: '',
          extendType: ''
        },
        dataRule: {
          regionName: [
            { required: true, message: '名称不能为空', trigger: 'blur' }
          ],
          regionServiceCharge: [
            { required: true, message: '服务费用不能为空', trigger: 'blur' }
          ],
          regionMinCharge: [
            { required: true, message: '最低消费不能为空', trigger: 'blur' }
          ],
          regionFrontAccount: [
            { required: true, message: '开启餐前结账不能为空', trigger: 'blur' }
          ],
          regionQr: [
            { required: true, message: '扫码点餐验证码不能为空', trigger: 'blur' }
          ],
          regionSeatNum: [
            { required: true, message: '座位数不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          modifyTime: [
            { required: true, message: '修改时间不能为空', trigger: 'blur' }
          ],
          extendType: [
            { required: true, message: '扩展表类型不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.regionId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.regionId) {
            this.$http({
              url: this.$http.adornUrl(`/table/region/info/${this.dataForm.regionId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.regionName = data.region.regionName
                this.dataForm.regionServiceCharge = data.region.regionServiceCharge
                this.dataForm.regionMinCharge = data.region.regionMinCharge
                this.dataForm.regionFrontAccount = data.region.regionFrontAccount
                this.dataForm.regionQr = data.region.regionQr
                this.dataForm.regionSeatNum = data.region.regionSeatNum
                this.dataForm.createTime = data.region.createTime
                this.dataForm.modifyTime = data.region.modifyTime
                this.dataForm.extendType = data.region.extendType
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
              url: this.$http.adornUrl(`/table/region/${!this.dataForm.regionId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'regionId': this.dataForm.regionId || undefined,
                'regionName': this.dataForm.regionName,
                'regionServiceCharge': this.dataForm.regionServiceCharge,
                'regionMinCharge': this.dataForm.regionMinCharge,
                'regionFrontAccount': this.dataForm.regionFrontAccount,
                'regionQr': this.dataForm.regionQr,
                'regionSeatNum': this.dataForm.regionSeatNum,
                'createTime': this.dataForm.createTime,
                'modifyTime': this.dataForm.modifyTime,
                'extendType': this.dataForm.extendType
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

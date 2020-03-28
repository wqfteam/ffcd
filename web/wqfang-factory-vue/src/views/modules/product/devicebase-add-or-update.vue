<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
      <el-form-item label="产品" prop="productBaseCode">
        <baseSelect v-model="dataForm.productBaseCode" placeholder="选择产品"></baseSelect>
      </el-form-item>
      <el-form-item label="设备名称" prop="deviceOnlineTime">
        <el-input v-model="dataForm.deviceName" placeholder="设备名称"></el-input>
      </el-form-item>
      <!--    <el-form-item label="设备上线时间" prop="deviceOnlineTime">-->
      <!--      <el-input v-model="dataForm.deviceOnlineTime" placeholder="设备上线时间"></el-input>-->
      <!--    </el-form-item>-->
          <el-form-item label="设备状态" prop="deviceStatus">
            <el-input v-model="dataForm.deviceStatus" placeholder="设备状态"></el-input>
          </el-form-item>
      <!--    <el-form-item label="创建人" prop="createUserId">-->
      <!--      <el-input v-model="dataForm.createUserId" placeholder="创建人"></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="创建时间" prop="createTime">-->
      <!--      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="修改人" prop="updateUserId">-->
      <!--      <el-input v-model="dataForm.updateUserId" placeholder="修改人"></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="修改时间" prop="updateTime">-->
      <!--      <el-input v-model="dataForm.updateTime" placeholder="修改时间"></el-input>-->
      <!--    </el-form-item>-->
      <!--    <el-form-item label="假删除0:不删除1:已删除" prop="flag">-->
      <!--      <el-input v-model="dataForm.flag" placeholder="假删除0:不删除1:已删除"></el-input>-->
      <!--    </el-form-item>-->
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
    import baseSelect from '@/components/base-select'

    export default {
        components: {baseSelect},
        data() {
            return {
                visible: false,
                dataForm: {
                    id: 0,
                    productBaseCode: '',
                    deviceOnlineTime: '',
                    deviceName: '',
                    deviceStatus: '',
                    createUserId: '',
                    createTime: '',
                    updateUserId: '',
                    updateTime: '',
                    flag: ''
                },
                dataRule: {
                    productBaseCode: [
                        {required: true, message: '请选择产品', trigger: 'blur'}
                    ],
                    deviceName: [
                        {required: true, message: '设备名称不能为空', trigger: 'change'}
                    ]
                }
            }
        },
        methods: {
            init(id) {
                this.dataForm.id = id || 0
                this.visible = true
                this.$nextTick(() => {
                    this.$refs['dataForm'].resetFields()
                    if (this.dataForm.id) {
                        this.$http({
                            url: this.$http.adornUrl(`/product/devicebase/info/${this.dataForm.id}`),
                            method: 'get',
                            params: this.$http.adornParams()
                        }).then(({data}) => {
                            if (data && data.code === 0) {
                                this.dataForm.productBaseCode = data.deviceBase.productBaseCode
                                this.dataForm.deviceName = data.deviceBase.deviceName
                            }
                        })
                    }
                })
            },
            // 表单提交
            dataFormSubmit() {
                this.$refs['dataForm'].validate((valid) => {
                    if (valid) {
                        this.$http({
                            url: this.$http.adornUrl(`/product/devicebase/${!this.dataForm.id ? 'save' : 'update'}`),
                            method: 'post',
                            data: this.$http.adornData({
                                'id': this.dataForm.id || undefined,
                                'productBaseCode': this.dataForm.productBaseCode,
                                'deviceName': this.dataForm.deviceName
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

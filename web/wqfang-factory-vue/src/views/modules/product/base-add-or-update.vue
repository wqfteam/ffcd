<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
      <el-form-item label="产品名称" prop="productName">
        <el-input v-model="dataForm.productName" placeholder="产品名称"></el-input>
      </el-form-item>
      <el-form-item label="产品状态" prop="productStatus">
        <el-input v-model="dataForm.productStatus" placeholder="产品状态"></el-input>
      </el-form-item>
      <el-form-item label="产品协议" prop="agreement.agreementTypeId">
        <sys-dict v-model="dataForm.agreement.agreementTypeId" dictType="modbus_type"></sys-dict>
      </el-form-item>
      <el-form-item label="产品描述" prop="productDesc">
        <el-input v-model="dataForm.productDesc" type="textarea" maxlength="100" show-word-limit
                  placeholder="产品描述"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
    import sysDict from '@/components/sys-dict'
    // this.component('IconSvg', sysDict)
    export default {
        data() {
            return {
                visible: false,
                dataForm: {
                    id: 0,
                    productName: '',
                    productStatus: '',
                    productDesc: '',
                    createUserId: '',
                    createTime: '',
                    updateUserId: '',
                    updateTime: '',
                    agreement: {
                        id: '',
                        productBaseCode: '',
                        agreementTypeId: ''
                    },
                    flag: ''
                },
                dataRule: {
                    productName: [
                        {required: true, message: '产品名称不能为空', trigger: 'blur'}
                    ],
                    productStatus: [
                        {required: true, message: '产品状态不能为空', trigger: 'blur'}
                    ],
                    'agreement.agreementTypeId': [
                        {required: true, message: '通信协议不能为空', trigger: 'blur'}
                    ]
                }
            }
        },
        components: {
            sysDict
        },
        watch: {
            'dataForm.agreement.agreementTypeId': {
                handler(val) {
                    // console.log(val)
                },
                immediate: true
            }
        },
        methods: {
            init(id) {
                this.dataForm.id = id || 0
                this.visible = true
                this.$nextTick(() => {
                    this.dataForm.agreement.agreementTypeId = ''
                    this.$refs['dataForm'].resetFields()
                    if (this.dataForm.id) {
                        this.$http({
                            url: this.$http.adornUrl(`/product/base/info/${this.dataForm.id}`),
                            method: 'get',
                            params: this.$http.adornParams()
                        }).then(({data}) => {
                            if (data && data.code === 0) {
                                this.dataForm.productName = data.base.productName
                                this.dataForm.productStatus = data.base.productStatus
                                this.dataForm.productDesc = data.base.productDesc
                                this.dataForm.createUserId = data.base.createUserId
                                this.dataForm.createTime = data.base.createTime
                                this.dataForm.updateUserId = data.base.updateUserId
                                this.dataForm.updateTime = data.base.updateTime
                                this.dataForm.flag = data.base.flag
                                if (data.base.agreement) {
                                    this.dataForm.agreement.agreementTypeId = data.base.agreement.agreementTypeId
                                    this.dataForm.agreement.id = data.base.agreement.id
                                    this.dataForm.agreement.productBaseCode = data.base.agreement.productBaseCode
                                } else {
                                    this.dataForm.agreement.agreementTypeId = ''
                                    this.dataForm.agreement.id = ''
                                    this.dataForm.agreement.productBaseCode = ''
                                }
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
                            url: this.$http.adornUrl(`/product/base/${!this.dataForm.id ? 'save' : 'update'}`),
                            method: 'post',
                            data: this.$http.adornData({
                                'id': this.dataForm.id || undefined,
                                'productName': this.dataForm.productName,
                                'productStatus': this.dataForm.productStatus,
                                'productDesc': this.dataForm.productDesc,
                                'createUserId': this.dataForm.createUserId,
                                'createTime': this.dataForm.createTime,
                                'updateUserId': this.dataForm.updateUserId,
                                'updateTime': this.dataForm.updateTime,
                                'agreement': this.dataForm.agreement,
                                'flag': this.dataForm.flag
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

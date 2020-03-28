<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
      <div v-show="!showFunctionExtend">
        <el-form-item label="功能名称" prop="fctName">
          <el-input v-model="dataForm.fctName" placeholder="功能名称"></el-input>
        </el-form-item>
        <el-form-item label="标识符" prop="fctTag">
          <el-input v-model="dataForm.fctTag" placeholder="功能标识符"></el-input>
        </el-form-item>
        <el-form-item label="单位" prop="fctUnit">
          <sys-dict v-model="dataForm.fctUnit" dictType="function_unit"></sys-dict>
        </el-form-item>
        <el-form-item label="描述" prop="fctDesc">
          <el-input v-model="dataForm.fctDesc" type="textarea" maxlength="100" show-word-limit
                    placeholder="功能描述"></el-input>
        </el-form-item>
        <el-form-item label="扩展描述" prop="agreement">
          <!--        <el-input v-model="dataForm.fctDesc" type="textarea" maxlength="100" show-word-limit-->
          <!--                  placeholder="功能描述"></el-input>-->
          <el-link :underline="false" type="warning" v-if="!isAddExtend" @click="addFunctionExtend">+新增扩展描述</el-link>
<!--          <el-button>按钮1</el-button>-->
<!--          <el-button>按钮1</el-button>-->
          <el-row v-if="isAddExtend">
            <el-col :span="18">
              <el-collapse>
                <el-collapse-item>
                  <template slot="title">
                    操作类型
                  </template>
                  <div>寄存器地址：{{this.dataForm.agreement.registerAddress}}</div>
                  <div>原始数据类型：{{this.dataForm.agreement.originalDataType}}</div>
                  <div>寄存器数据个数：{{this.dataForm.agreement.rangeEnd-this.dataForm.agreement.rangeStart}}</div>
                  <div>交换寄存器内高低字节：{{this.dataForm.agreement.registerAddress}}</div>
                  <div>交换寄存器顺序：{{this.dataForm.agreement.registerAddress}}</div>
                  <div>缩放因子：{{this.dataForm.agreement.registerAddress}}</div>
                  <div>采集间隔：{{this.dataForm.agreement.registerAddress}}</div>
                  <div>数据上报方式：{{this.dataForm.agreement.registerAddress}}</div>
                </el-collapse-item>
              </el-collapse>
            </el-col>
            <el-col :span="2" :offset="2">
              <el-button type="text" @click="editFunctionExtend" size="small">编辑</el-button>
            </el-col>
            <el-col :span="2">
              <el-button type="text" size="small" @click="deleteFunctionExtend">删除</el-button>
            </el-col>
          </el-row>
<!--          <el-button>按钮1</el-button>-->
<!--          <el-button>按钮1</el-button>-->
        </el-form-item>
      </div>
      <div v-show="showFunctionExtend">
        <fctextendagrement-add-or-update @success="agrementExit"
                                         ref="fctextendagrementAddOrUpdate"></fctextendagrement-add-or-update>
      </div>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="exit">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
    import sysDict from '@/components/sys-dict'
    import fctextendagrementAddOrUpdate from "./fctextendagreement-add-or-update";

    export default {
        components: {
            sysDict,
            fctextendagrementAddOrUpdate
        },
        data() {
            return {
                visible: false,
                showFunctionExtend: false,
                isAddExtend: false,
                dataForm: {
                    id: 0,
                    fctName: '',
                    fctTag: '',
                    fctUnit: '',
                    fctDesc: '',
                    createUserId: '',
                    createTime: '',
                    updateUserId: '',
                    updateTime: '',
                    flag: '',
                    agreement: {}
                },
                dataRule: {
                    productBaseCode: [
                        {required: true, message: '产品id不能为空', trigger: 'blur'}
                    ],
                    fctName: [
                        {required: true, message: '功能名称不能为空', trigger: 'blur'}
                    ],
                    fctTag: [
                        {required: true, message: '功能标识符不能为空', trigger: 'blur'}
                    ],
                    fctUnit: [
                        {required: true, message: '功能显示单位不能为空', trigger: 'blur'}
                    ],
                    agreement: [
                        {
                            required: true,
                            message: '扩展描述不能为空',
                            trigger: 'blur',
                            validator: (rule, value, callback) => {
                                if (this.dataForm.agreement.operateType == null) {
                                    callback(new Error('扩展描述不能为空'))
                                } else {
                                    callback()
                                }
                            }
                        }
                    ]
                }
            }
        },
        methods: {
            deleteFunctionExtend: function () {
                this.$confirm("是否删除扩展描述", "删除", {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.dataForm.agreement={}
                    this.isAddExtend=false;
                }).catch(() => {
                })
            },
            editFunctionExtend: function () {
                console.log("**************************分割线***************************编辑:");
                this.$refs.fctextendagrementAddOrUpdate.updateInit(this.dataForm.agreement);
                this.showFunctionExtend = true
            },
            addFunctionExtend() {
                this.$refs.fctextendagrementAddOrUpdate.init(null, this.dataForm.id);
                this.showFunctionExtend = true
            },
            exit() {
                if (this.showFunctionExtend == true) {
                    this.showFunctionExtend = false;
                    return;
                }
                this.visible = false;
            },
            agrementExit(agreementForm) {
                if (agreementForm != null) {
                    this.dataForm.agreement = agreementForm;
                    this.isAddExtend = true;
                    this.showFunctionExtend = false;
                }
            },
            init(id, productBaseCode) {
                this.dataForm.id = id || 0
                this.dataForm.productBaseCode = productBaseCode
                this.visible = true
                this.isAddExtend = false;
                this.$nextTick(() => {
                    this.$refs['dataForm'].resetFields()
                    if (this.dataForm.id) {
                        this.$http({
                            url: this.$http.adornUrl(`/product/fctbase/info/${this.dataForm.id}`),
                            method: 'get',
                            params: this.$http.adornParams()
                        }).then(({data}) => {
                            if (data && data.code === 0) {
                                this.dataForm.productBaseCode = data.fctBase.productBaseCode
                                this.dataForm.fctName = data.fctBase.fctName
                                this.dataForm.fctTag = data.fctBase.fctTag
                                this.dataForm.fctUnit = data.fctBase.fctUnit
                                this.dataForm.fctDesc = data.fctBase.fctDesc
                                this.dataForm.createUserId = data.fctBase.createUserId
                                this.dataForm.createTime = data.fctBase.createTime
                                this.dataForm.updateUserId = data.fctBase.updateUserId
                                this.dataForm.updateTime = data.fctBase.updateTime
                                this.dataForm.flag = data.fctBase.flag
                                if (data.fctBase.agreement != null) {
                                    this.dataForm.agreement = data.fctBase.agreement;
                                    this.isAddExtend = true;
                                }
                            }
                        })
                    }
                })
            },
            // 表单提交
            dataFormSubmit() {
                if (this.showFunctionExtend) {
                    this.$refs.fctextendagrementAddOrUpdate.dataFormSubmit();
                    return;
                }
                // if (!this.isAddExtend) {
                //     this.$message({
                //         message: '请添加扩展描述',
                //         type: 'error',
                //         duration: 1500,
                //         onClose: () => {
                //         }
                //     })
                //     return;
                // }
                this.$refs['dataForm'].validate((valid) => {
                    if (valid) {
                        this.$http({
                            url: this.$http.adornUrl(`/product/fctbase/${!this.dataForm.id ? 'save' : 'update'}`),
                            method: 'post',
                            data: this.$http.adornData({
                                'id': this.dataForm.id || undefined,
                                'productBaseCode': this.dataForm.productBaseCode,
                                'fctName': this.dataForm.fctName,
                                'fctTag': this.dataForm.fctTag,
                                'fctUnit': this.dataForm.fctUnit,
                                'fctDesc': this.dataForm.fctDesc,
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

<style>
  .el-icon-arrow-right:before {
    content: "\E606";
  }
</style>

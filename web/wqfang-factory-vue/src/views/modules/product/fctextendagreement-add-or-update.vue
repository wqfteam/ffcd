<template>
  <el-form :model="dataForm" :rules="dataRule" ref="dataForm" label-width="auto">
    <el-form-item label="操作类型" prop="operateType">
      <!--      <el-input v-model="dataForm.operateType" placeholder="操作类型"></el-input>-->
      <sys-dict v-model="dataForm.operateType" dictType="modbus_agreement_function"></sys-dict>
    </el-form-item>
    <el-form-item label="寄存器地址" prop="registerAddress">
      <el-input v-model="dataForm.registerAddress" placeholder="寄存器地址"></el-input>
    </el-form-item>
    <el-form-item label="原始数据类型" prop="originalDataType">
      <sys-dict v-model="dataForm.originalDataType" dictType="data_type" :disabled="!visible"></sys-dict>
<!--      <el-input v-model="dataForm.originalDataType" placeholder="原始数据类型" ></el-input>-->
    </el-form-item>
    <el-form-item label="取值范围" prop="rangeStart">
      <el-input-number v-model="dataForm.rangeStart" placeholder="数据范围开始" :controls="false" :max="dataForm.rangeEnd-1"></el-input-number>~
      <el-input-number v-model="dataForm.rangeEnd" placeholder="数据范围开始" :controls="false"></el-input-number>
    </el-form-item>
<!--    <el-form-item label="数据范围结束" prop="rangeEnd">-->
<!--      <el-input v-model="dataForm.rangeEnd" placeholder="数据范围结束"></el-input>-->
<!--    </el-form-item>-->
    <el-form-item label="交换寄存器内高低字节" prop="swapHighByte" v-if="visible">
<!--      <el-input v-model="dataForm.swapHighByte" placeholder="交换寄存器内高低字节"></el-input>-->
      <el-select v-model="dataForm.swapHighByte">
        <el-option
          v-for="item in flagOptions"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="交换寄存器顺序" prop="swapRegisterSort" v-if="visible">
<!--      <el-input v-model="dataForm.swapRegisterSort" placeholder="交换寄存器顺序"></el-input>-->
      <el-select v-model="dataForm.swapRegisterSort">
        <el-option
          v-for="item in flagOptions"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="缩放因子" prop="zoom" v-if="visible">
      <el-input v-model="dataForm.zoom" placeholder="缩放因子"></el-input>
    </el-form-item>
    <el-form-item label="数据上报方式" prop="dataGetType">
      <el-input v-model="dataForm.dataGetType" placeholder="数据上报方式"></el-input>
    </el-form-item>
  </el-form>
</template>

<script>
    import sysDict from '@/components/sys-dict'

    export default {
        components: {
            sysDict
        },
        data() {
            return {
                visible: false,
                dataForm: {
                    id: 0,
                    operateType: '0',
                    registerAddress: '',
                    originalDataType: '7',
                    rangeStart: '0',
                    rangeEnd: '1',
                    dataGetType: '',
                    swapHighByte: 'false',
                    swapRegisterSort: 'false',
                    zoom: '1'
                },
                flagOptions:[{label:'true',value:'true'},{label:'false',value:'false'}],
                dataRule: {
                    productFctBaseId: [
                        {required: true, message: '产品功能Id不能为空', trigger: 'blur'}
                    ],
                    operateType: [
                        {required: true, message: '操作类型不能为空', trigger: 'blur'}
                    ],
                    registerAddress: [
                        {required: true, message: '寄存器地址不能为空', trigger: 'blur'}
                    ],
                    originalDataType: [
                        {required: true, message: '原始数据类型不能为空', trigger: 'blur'}
                    ],
                    rangeStart: [
                        {required: true, message: '数据范围开始不能为空', trigger: 'blur'}
                    ],
                    rangeEnd: [
                        {required: true, message: '数据范围结束不能为空', trigger: 'blur'}
                    ],
                    dataGetType: [
                        {required: true, message: '数据获取类型不能为空', trigger: 'blur'}
                    ],
                    swapHighByte: [
                        {required: true, message: '交换寄存器内高低字节不能为空', trigger: 'blur'}
                    ],
                    swapRegisterSort: [
                        {required: true, message: '交换寄存器顺序不能为空', trigger: 'blur'}
                    ],
                    zoom: [
                        {required: true, message: '缩放因子不能为空', trigger: 'blur'}
                    ]
                }
            }
        },
        methods: {
            updateInit(dataForm){
                this.dataForm=dataForm;
                this.dataForm.id = this.dataForm.id || 0
            },
            init(id,productFctBaseId) {
                this.dataForm.id = id || 0
                this.dataForm.productFctBaseId = productFctBaseId
                this.visible=false;
                this.$nextTick(() => {
                    this.$refs['dataForm'].resetFields()
                    if (this.dataForm.id) {
                        this.$http({
                            url: this.$http.adornUrl(`/product/fctextendagreement/info/${this.dataForm.id}`),
                            method: 'get',
                            params: this.$http.adornParams()
                        }).then(({data}) => {
                            if (data && data.code === 0) {
                                this.getVisible(data.fctextendagreement.originalDataType);
                                this.dataForm.productFctBaseId = data.fctextendagreement.productFctBaseId
                                this.dataForm.operateType = data.fctextendagreement.operateType
                                this.dataForm.registerAddress = data.fctextendagreement.registerAddress
                                this.dataForm.originalDataType = data.fctextendagreement.originalDataType
                                this.dataForm.rangeStart = data.fctextendagreement.rangeStart
                                this.dataForm.rangeEnd = data.fctextendagreement.rangeEnd
                                this.dataForm.dataGetType = data.fctextendagreement.dataGetType
                                this.dataForm.swapHighByte = data.fctextendagreement.swapHighByte
                                this.dataForm.swapRegisterSort = data.fctextendagreement.swapRegisterSort
                                this.dataForm.zoom = data.fctextendagreement.zoom
                            }
                        })
                    }
                })
            },
            getVisible(operateType){
                switch (operateType) {
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                        this.dataForm.rangeEnd=1;
                        this.dataForm.rangeStart=0;
                        this.dataForm.originalDataType='7'
                        this.visible=false
                        break
                    default:
                        this.dataForm.rangeStart=-2147483648;
                        this.dataForm.rangeEnd=2147483647;
                        this.dataForm.originalDataType='0'
                        this.visible=true
                        break
                }
            },
            // 表单提交
            dataFormSubmit() {
                this.$refs['dataForm'].validate((valid) => {
                    if (valid) {
                        this.dataForm.id=this.dataForm.id || undefined;
                        this.$emit('success',this.dataForm)
                        // this.$http({
                        //     url: this.$http.adornUrl(`/product/fctextendagreement/${!this.dataForm.id ? 'save' : 'update'}`),
                        //     method: 'post',
                        //     data: this.$http.adornData({
                        //         'id': this.dataForm.id || undefined,
                        //         'productFctBaseId': this.dataForm.productFctBaseId,
                        //         'operateType': this.dataForm.operateType,
                        //         'registerAddress': this.dataForm.registerAddress,
                        //         'originalDataType': this.dataForm.originalDataType,
                        //         'rangeStart': this.dataForm.rangeStart,
                        //         'rangeEnd': this.dataForm.rangeEnd,
                        //         'dataGetType': this.dataForm.dataGetType,
                        //         'swapHighByte': this.dataForm.swapHighByte,
                        //         'swapRegisterSort': this.dataForm.swapRegisterSort,
                        //         'zoom': this.dataForm.zoom
                        //     })
                        // }).then(({data}) => {
                        //     if (data && data.code === 0) {
                        //         flag=true;
                        //         this.$message({
                        //             message: '操作成功',
                        //             type: 'success',
                        //             duration: 1500,
                        //             onClose: () => {
                        //                 this.visible = false
                        //                 this.$emit('refreshDataList')
                        //             }
                        //         })
                        //         this.$emit('success',true)
                        //     } else {
                        //         this.$message.error(data.msg)
                        //     }
                        // })
                    }
                })
            }
        },
        mounted(){
           this.$forceUpdate()
        },
        watch:{
            "dataForm.operateType":function (value) {
                this.getVisible(value)
            }
        }
    }
</script>

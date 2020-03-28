<template>
  <div class="mod-config">
    <el-form ref="dataForm"
             label-width="80px">
      <el-form-item label="产品" prop="productBaseCode">
<!--        <baseSelect v-model="dataForm.productBaseCode" placeholder="选择产品"></baseSelect>-->
        <el-input v-model="dataForm.baseEntity.productName" placeholder="设备名称"></el-input>
      </el-form-item>
      <el-form-item label="设备名称" prop="deviceOnlineTime">
        <el-input v-model="dataForm.deviceName" placeholder="设备名称"></el-input>
      </el-form-item>
      <el-form-item label="设备上线时间" prop="deviceOnlineTime">
        <el-input v-model="dataForm.deviceOnlineTime" placeholder="设备上线时间"></el-input>
      </el-form-item>
      <el-form-item label="设备状态" prop="deviceStatus">
        <el-input v-model="dataForm.deviceStatus" placeholder="设备状态"></el-input>
      </el-form-item>
      <el-form-item label="创建人" prop="createUserId">
        <el-input v-model="dataForm.createUserId" placeholder="创建人"></el-input>
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
      </el-form-item>
      <el-form-item label="修改人" prop="updateUserId">
        <el-input v-model="dataForm.updateUserId" placeholder="修改人"></el-input>
      </el-form-item>
      <el-form-item label="修改时间" prop="updateTime">
        <el-input v-model="dataForm.updateTime" placeholder="修改时间"></el-input>
      </el-form-item>
      <el-form-item label="假删除0:不删除1:已删除" prop="flag">
        <el-input v-model="dataForm.flag" placeholder="假删除0:不删除1:已删除"></el-input>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
    export default {
        name: "deviceInfo",
        data:function () {
            return {
                dataForm: {
                    id: 0,
                    baseEntity:{},
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
            }
        },
        methods:{
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
                                this.dataForm.productBaseCode = data.deviceBase.productBaseCode
                                this.dataForm.deviceName = data.deviceBase.deviceName
                                this.dataForm.baseEntity.productName=data.deviceBase.baseEntity.productName
                            }
                        })
                    }
                })
            },
        }
    }
</script>

<style scoped>

</style>

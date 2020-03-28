<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="字典名称" prop="name">
      <el-input v-model="dataForm.name" placeholder="字典名称"></el-input>
    </el-form-item>
    <el-form-item label="字典值" prop="value">
      <el-input v-model="dataForm.value" placeholder="字典值"></el-input>
    </el-form-item>
    <el-form-item label="字典类型" prop="type">
      <el-input v-model="dataForm.type" placeholder="字典类型"></el-input>
    </el-form-item>
    <el-form-item label="字典编码" prop="code">
      <el-input v-model="dataForm.code" placeholder="字典编码"></el-input>
    </el-form-item>
    <el-form-item label="字典描述" prop="dictDesc">
      <el-input v-model="dataForm.dictDesc" placeholder="字典描述"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()" >确定</el-button>
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
          name: '',
          value: '',
          type: '',
          code: '',
          dictDesc: '',
          desc: ''
        },
        dataRule: {
          name: [
            { required: true, message: '字典名称不能为空', trigger: 'blur' }
          ],
          value: [
            { required: true, message: '字典值不能为空', trigger: 'blur' }
          ],
          type: [
            { required: true, message: '字典类型不能为空', trigger: 'blur' }
          ]
          // code: [
          //   { required: true, message: '字典编码不能为空', trigger: 'blur' }
          // ],
          // dictDesc: [
          //   { required: true, message: '字典描述不能为空', trigger: 'blur' }
          // ]
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
              url: this.$http.adornUrl(`/sys/dict/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.name = data.dict.name
                this.dataForm.value = data.dict.value
                this.dataForm.type = data.dict.type
                this.dataForm.code = data.dict.code
                this.dataForm.dictDesc = data.dict.dictDesc
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
              url: this.$http.adornUrl(`/sys/dict/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'name': this.dataForm.name,
                'value': this.dataForm.value,
                'type': this.dataForm.type,
                'code': this.dataForm.code,
                'dictDesc': this.dataForm.dictDesc
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

<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="餐桌名称" prop="tableName">
      <el-input v-model="dataForm.tableName" placeholder="餐桌名称"></el-input>
    </el-form-item>
    <el-form-item label="餐桌编码" prop="tableNum">
      <el-input v-model="dataForm.tableNum" placeholder="餐桌编码"></el-input>
    </el-form-item>
    <el-form-item label="容纳人数" prop="tablePeopleNum">
      <el-input v-model="dataForm.tablePeopleNum" placeholder="容纳人数"></el-input>
    </el-form-item>
    <el-form-item label="是否有效" prop="tableIsFlag">
      <el-input v-model="dataForm.tableIsFlag" placeholder="是否有效"></el-input>
    </el-form-item>
    <el-form-item label="服务费" prop="tableServiceCharge">
      <el-input v-model="dataForm.tableServiceCharge" placeholder="服务费"></el-input>
    </el-form-item>
    <el-form-item label="起点彩品数量" prop="tableFoodCount">
      <el-input v-model="dataForm.tableFoodCount" placeholder="起点彩品数量"></el-input>
    </el-form-item>
    <el-form-item label="最低消费" prop="tableMinCharge">
      <el-input v-model="dataForm.tableMinCharge" placeholder="最低消费"></el-input>
    </el-form-item>
    <el-form-item label="餐桌状态" prop="tableStatus">
      <el-input v-model="dataForm.tableStatus" placeholder="餐桌状态"></el-input>
    </el-form-item>
    <el-form-item label="扩展表类型" prop="extendsTableType">
      <el-input v-model="dataForm.extendsTableType" placeholder="扩展表类型"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder="创建时间"></el-input>
    </el-form-item>
    <el-form-item label="修改时间" prop="modifyTime">
      <el-input v-model="dataForm.modifyTime" placeholder="修改时间"></el-input>
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
          tableId: 0,
          tableName: '',
          tableNum: '',
          tablePeopleNum: '',
          tableIsFlag: '',
          tableServiceCharge: '',
          tableFoodCount: '',
          tableMinCharge: '',
          tableStatus: '',
          extendsTableType: '',
          createTime: '',
          modifyTime: ''
        },
        dataRule: {
          tableName: [
            { required: true, message: '餐桌名称不能为空', trigger: 'blur' }
          ],
          tableNum: [
            { required: true, message: '餐桌编码不能为空', trigger: 'blur' }
          ],
          tablePeopleNum: [
            { required: true, message: '容纳人数不能为空', trigger: 'blur' }
          ],
          tableIsFlag: [
            { required: true, message: '是否有效不能为空', trigger: 'blur' }
          ],
          tableServiceCharge: [
            { required: true, message: '服务费不能为空', trigger: 'blur' }
          ],
          tableFoodCount: [
            { required: true, message: '起点彩品数量不能为空', trigger: 'blur' }
          ],
          tableMinCharge: [
            { required: true, message: '最低消费不能为空', trigger: 'blur' }
          ],
          tableStatus: [
            { required: true, message: '餐桌状态不能为空', trigger: 'blur' }
          ],
          extendsTableType: [
            { required: true, message: '扩展表类型不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          modifyTime: [
            { required: true, message: '修改时间不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.tableId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.tableId) {
            this.$http({
              url: this.$http.adornUrl(`/table/board/info/${this.dataForm.tableId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.tableName = data.board.tableName
                this.dataForm.tableNum = data.board.tableNum
                this.dataForm.tablePeopleNum = data.board.tablePeopleNum
                this.dataForm.tableIsFlag = data.board.tableIsFlag
                this.dataForm.tableServiceCharge = data.board.tableServiceCharge
                this.dataForm.tableFoodCount = data.board.tableFoodCount
                this.dataForm.tableMinCharge = data.board.tableMinCharge
                this.dataForm.tableStatus = data.board.tableStatus
                this.dataForm.extendsTableType = data.board.extendsTableType
                this.dataForm.createTime = data.board.createTime
                this.dataForm.modifyTime = data.board.modifyTime
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
              url: this.$http.adornUrl(`/table/board/${!this.dataForm.tableId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'tableId': this.dataForm.tableId || undefined,
                'tableName': this.dataForm.tableName,
                'tableNum': this.dataForm.tableNum,
                'tablePeopleNum': this.dataForm.tablePeopleNum,
                'tableIsFlag': this.dataForm.tableIsFlag,
                'tableServiceCharge': this.dataForm.tableServiceCharge,
                'tableFoodCount': this.dataForm.tableFoodCount,
                'tableMinCharge': this.dataForm.tableMinCharge,
                'tableStatus': this.dataForm.tableStatus,
                'extendsTableType': this.dataForm.extendsTableType,
                'createTime': this.dataForm.createTime,
                'modifyTime': this.dataForm.modifyTime
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

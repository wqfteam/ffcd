<template>
  <el-select v-model="selectVal" placeholder="请选择产品名称" :disabled="disabled"
             filterable
             reserve-keyword
             remote
             :remote-method="remoteMethod"
  >
    <el-option
      v-for="item in options"
      :key="item.id"
      :label="item.productName"
      :value="item.id">
    </el-option>
  </el-select>
</template>

<script>
    export default {
        name: 'sys-dict',
        props: ['value','disabled'],
        data () {
            return {
                options: []
            }
        },
        methods:{
            remoteMethod(val){
                this.$http({
                    url: this.$http.adornUrl('/product/base/allList?productName='+val),
                    method: 'get'
                }).then((r) => {
                    if (r && r.data.code === 0) {
                        this.options = r.data.list
                    }
                })
            }
        },
        computed: {
            selectVal: {
                get: function () {
                    return this.value
                },
                set: function (value) {
                    this.$emit('input', value)
                }
            }
        }
    }
</script>

<style scoped>

</style>

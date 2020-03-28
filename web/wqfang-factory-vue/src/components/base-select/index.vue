<template>
  <el-select
    v-model="selectVal"
    filterable
    remote
    reserve-keyword
    placeholder="请输入产品名称"
    :remote-method="remoteMethod"
    :loading="loading">
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
        name: "base-select",
        props: ['value'],
        data() {
            return {
                options: [],
                list: [],
                loading: false,
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
        },
        created() {
            var that = this;
            this.$http({
                url: this.$http.adornUrl('/product/base/productSelectlist'),
                method: 'get',
            }).then(response => {
                if (response.data.code != '0') {
                    that.$message.error(response.data.msg)
                    return;
                }
                that.options = response.data.base;
                console.log(that.options)
            })
        },
        methods: {
            remoteMethod(query) {
                var that = this;
                if (query !== '') {
                    this.$http({
                        url: this.$http.adornUrl('/product/base/productSelectlist'),
                        method: 'get',
                        params: this.$http.adornParams({productName: query})
                    }).then(response => {
                        if (response.data.code != '0') {
                            that.$message.error(response.data.msg)
                            return;
                        }
                        that.options = response.data.base;
                        console.log(that.options)
                    })

                } else {
                    this.options = [];
                }
            }
        }
    }
</script>

<style scoped>

</style>

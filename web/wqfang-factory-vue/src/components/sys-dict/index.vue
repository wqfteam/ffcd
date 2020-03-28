<template>
  <el-select v-model="selectVal" placeholder="请输入名称" :disabled="disabled"
             filterable
             reserve-keyword
             remote
             :remote-method="remoteMethod"
  >
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
</template>

<script>
  export default {
    name: 'sys-dict',
    props: ['value','dictType','disabled'],
    data () {
      return {
        options: []
      }
    },
      methods:{
          remoteMethod(val){
              console.log("**************************分割线***************************:"+val);
              this.$http({
                  url: this.$http.adornUrl('/sys/dict/allList?type='+this.dictType+"&name="+val),
                  method: 'get'
              }).then((r) => {
                  if (r && r.data.code === 0) {
                      this.options = r.data.list
                  }
              })
          }
      },
    created () {

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
      // watch:{
      //     dictType:function (val) {
      //         this.$http({
      //             url: this.$http.adornUrl('/sys/dict/allList?type='+val),
      //             method: 'get'
      //         }).then((r) => {
      //             if (r && r.data.code === 0) {
      //                 this.options = r.data.list
      //             }
      //         })
      //     }
      // }
  }
</script>

<style scoped>

</style>

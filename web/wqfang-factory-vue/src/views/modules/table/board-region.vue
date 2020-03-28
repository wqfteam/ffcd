<template>
  <el-row>
    <el-row v-show="!isShowRegion">
      <el-row style="float: right;z-index: 9999">
        <el-button icon="el-icon-arrow-left" circle></el-button>
        <el-button icon="el-icon-arrow-right" circle></el-button>
        <el-button type="primary" @click="isShowRegion=true">区域管理</el-button>
      </el-row>
      <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="餐桌管理" name="first">
          <board></board>
        </el-tab-pane>
        <el-tab-pane v-for="(item,index) in boardList" v-bind:key="item.regionId" :label="item.regionName" :name="item.regionId">
          <board></board>
        </el-tab-pane>
      </el-tabs>
    </el-row>
    <el-row v-show="isShowRegion">
      <el-page-header @back="goBack()" content="详情页面"></el-page-header>
      <region></region>
    </el-row>
  </el-row>
</template>

<script>
  import board from './board'
  import region from './region'
  import AddOrUpdate from "./board-add-or-update"
  export default {
    name: "board-region",
    data() {
      return {
        activeName: 'first',
        isShowRegion:false,
        boardList:[]
      }
    },
    components: {
      board,
      region,
      AddOrUpdate
    },
    methods: {
      goBack(){

      },
      handleClick() {

      }
    }
  }
</script>

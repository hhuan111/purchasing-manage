<template>

<el-container style="min-height: 100vh">
<el-aside :width=" sideWidth +'px'" style="background-color: rgb(238, 241, 246); box-shadow: 2px 0 6px rgb(0 21 41)">
  <Aside  :isCollapse="isCollapse" :logoTextShow="logoTextShow"/>
</el-aside>

<el-container>
  <el-header style="border:1px solid #cccccc">
    <Header :collapseBtnClass="collapseBtnClass" @asideCollapse="collapse" :user="user" />
  </el-header>

  <el-main>
    <router-view @refreshUser="getUser"/>
  </el-main>
</el-container>
</el-container>

</template>

<script>

import Aside from "@/components/Aside";
import Header from "@/components/Header";

export default {
  name: "IndexView",
  data() {
    return {
      collapseBtnClass:'el-icon-s-fold',
      isCollapse: false,
      sideWidth:200,
      logoTextShow:true,
      user:{}
    }
  },

  components:{
    Aside,
    Header
  },
  created() {
    // 从后台获取最新的User数据
    this.getUser()
  },
  methods:{
    collapse(){
      this.isCollapse=!this.isCollapse
      if(this.isCollapse){
        this.sideWidth=64
        this.collapseBtnClass='el-icon-s-unfold'
        this.logoTextShow=false
      }else {
        this.sideWidth=200
        this.collapseBtnClass='el-icon-s-fold'
        this.logoTextShow=true
      }
    },
    getUser() {
      let username = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).username : ""
      if (username) {
        // 从后台获取User数据
        this.request.get("/user/username/" + username).then(res => {
          // 重新赋值后台的最新User数据
          this.user = res.data
        })
      }
    }
  }

}
</script>


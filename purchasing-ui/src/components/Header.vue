<template>
<div style="line-height: 60px;display: flex">
  <div style="flex: 1">
    <span :class="collapseBtnClass" style="cursor: pointer; font-size: 18px" @click="collapse"></span>

      <el-breadcrumb separator-class="el-icon-arrow-right" separator="/" style="display: inline-block; margin-left: 20px">
        <el-breadcrumb-item :to="'/'">首页</el-breadcrumb-item>
        <el-breadcrumb-item>{{ currentPathName }}</el-breadcrumb-item>
      </el-breadcrumb>


  </div>
  <el-dropdown style="width: 300px; cursor: pointer; text-align:right">
    <div style="display: inline-block">
      <img :src="user.ava" alt=""
           style="width: 30px; border-radius: 50%; position: relative; top: 10px; right: 5px">
      <span>{{ user.nickname }}</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
    </div>

    <el-dropdown-menu slot="dropdown" style="width: 100px; text-align: center">
      <el-dropdown-item style="font-size: 18px; padding: 5px 0">
        <router-link to="/person">用户信息</router-link>
      </el-dropdown-item>
      <el-dropdown-item style="font-size: 18px; padding: 5px 0">
        <router-link to="/password">修改密码</router-link>
      </el-dropdown-item>
      <el-dropdown-item style="font-size: 18px; padding: 5px 0">
        <span @click="logout" style="color: black">退出</span>
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>



</div>
</template>

<script>
export default {
  name: "Header",
  props: {
    collapseBtnClass: String,
    user:Object
  },
  computed: {
    currentPathName () {
      return this.$store.state.currentPathName;　　//需要监听的数据
    }
  },
  data(){
    return{
      //user:localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")): {}
    }
  },
  watch:{
    currentPathName(newVal,oldVal){
      console.log(newVal)
    }
  },
  methods:{
    logout() {
      this.$router.push("/login")
      localStorage.removeItem("user")
      this.$message.success("退出成功")
    },
    collapse() {
      // this.$parent.$parent.$parent.$parent.collapse()  // 通过4个 $parent 找到父组件，从而调用其折叠方法
      this.$emit("asideCollapse")
    }
  }
}
</script>

<style scoped>
.router-link-active {
  text-decoration: none;
  color: black;
}
a{
  text-decoration: none;
  color: black;
}

</style>
<template>
  <div>
    <el-form :rules="rules" ref="loginForm" :model="loginForm" class="loginContainer">
      <h3 class="loginTitle">政府采购管理系统登录</h3>
      <el-form-item prop="username">
        <el-input type="text" auto-complete="false" prefix-icon="el-icon-user" v-model="loginForm.username" placeholder="请输入用户名"></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input type="password" auto-complete="false" prefix-icon="el-icon-lock"  show-password assword v-model="loginForm.password" placeholder="请输入密码"></el-input>
      </el-form-item>
<!--      <el-checkbox v-model="checked">备选项</el-checkbox>-->
        <el-form-item style="margin: 40px 40px 20px 40px">
          <el-button type="primary"  @click="submitForm('loginForm')">登录</el-button>
          <el-button type="primary"  @click="$router.push('/register')">注册</el-button>
          <el-button type="primary" @click="resetForm('loginForm')">重置</el-button>
        </el-form-item>


    </el-form>
  </div>
</template>

<script>


import {setRoutes} from "@/router";

export default {
  name: "LoginView",
  data(){
    return{
      loginForm:{},
      checked:true,
      rules:{
        username: [
            {required:true,message:'请输入用户名',trigger:'blur'}
        ],
        password: [
            {required:true,message:'请输入密码',trigger:'blur'}
        ]
      }
    }
  },
  methods:{
    submitForm(formName) {
      this.$refs['loginForm'].validate((valid) => {
        if (valid) {
          this.request.post("/user/login", this.loginForm).then(
              res => {
                if (res.code=='200') {
                  localStorage.setItem("user",JSON.stringify(res.data))
                  localStorage.setItem("menus",JSON.stringify(res.data.menus))
                  if(res.data.role==='ROLE_USER'){
                    this.$router.push("/front/home")
                  }
                    else{
                      this.$router.push("/")
                    }
                  this.$message.success("登录成功！")
                } else {
                  this.$message.error(res.msg)
                }
              })
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }

}
</script>

<style>
.loginContainer{
  border-radius: 15px;
  background-clip: padding-box;
  margin: 100px auto;
  width: 400px;
  height: 300px;
  padding: 20px 40px 20px 40px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
.loginTitle{
  margin: 0px auto 40px auto;
  text-align: center;
  font-size: 24px;
}
.loginRemember{
  text-align: left;
  margin: 10px 0px 15px 0px;
}
</style>
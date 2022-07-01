<template>
  <div class="wrapper">
    <div style="margin: 10px auto; background-color: #fff; width: 400px; height: 610px; padding: 10px; border-radius: 10px; box-shadow: 0 0 25px #cac6c6">
      <div style="margin: 5px 0; text-align: center; font-size: 24px"><b>注 册</b></div>
      <el-form :model="user" :rules="rules" ref="userForm">
        <el-form-item prop="username">
          <el-input placeholder="请输入用户名" size="medium" style="margin: 1px 0" prefix-icon="el-icon-user" v-model="user.username"></el-input>
        </el-form-item>
        <el-form-item prop="nickname">
          <el-input placeholder="请输入姓名" size="medium" style="margin: 1px 0" prefix-icon="el-icon-user-solid" v-model="user.nickname"></el-input>
        </el-form-item>
        <el-form-item prop="email">
          <el-input placeholder="请输入电子邮箱" size="medium" style="margin: 1px 0" prefix-icon="el-icon-message" v-model="user.email"></el-input>
        </el-form-item>
        <el-form-item prop="phone">
          <el-input placeholder="请输入联系方式" size="medium" style="margin: 1px 0" prefix-icon="el-icon-mobile-phone" v-model="user.phone"></el-input>
        </el-form-item>
        <el-form-item prop="department">
          <el-input placeholder="请输入所属单位" size="medium" style="margin: 1px 0" prefix-icon="el-icon-office-building" v-model="user.department"></el-input>
        </el-form-item>
        <el-form-item prop="address">
          <el-input placeholder="请输入居住地址" size="medium" style="margin: 1px 0" prefix-icon="el-icon-place" v-model="user.address"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input placeholder="请输入密码" size="medium" style="margin: 1px 0" prefix-icon="el-icon-lock" show-password v-model="user.password"></el-input>
        </el-form-item>
        <el-form-item prop="confirmPassword">
          <el-input placeholder="请确认密码" size="medium" style="margin: 1px 0" prefix-icon="el-icon-lock" show-password v-model="user.confirmPassword"></el-input>
        </el-form-item>
        <el-form-item style="margin: 5px 0; text-align: right">
          <el-button type="primary" size="small"  autocomplete="off" @click="register">注册</el-button>
          <el-button type="warning" size="small"  autocomplete="off" @click="$router.push('/login')">返回登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    return {
      user: {},
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
        nickname:[
          { required: true, message: '请输入姓名', trigger: 'blur'}
        ],
        email:[
          { required: true, message: '请输入电子邮箱', trigger: 'blur'}
        ],
        phone:[
          { required: true, message: '请输入联系方式', trigger: 'blur'}
        ],
        address:[
          { required: true, message: '请输入居住地址', trigger: 'blur'}
        ],
        department:[
          { required: true, message: '请输入所属单位', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    register() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          if (this.user.password !== this.user.confirmPassword) {
            this.$message.error("两次输入的密码不一致")
            return false
          }
          this.request.post("/user/register", this.user).then(res => {
            if(res.code === '200') {
              this.$message.success("注册成功")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      })
    }
  }
}
</script>

<style>
.wrapper {
  height: 100vh;
  /*background-image: linear-gradient(to bottom right,#FC466B, #3F5EFB);*/
  overflow: hidden;
}

</style>
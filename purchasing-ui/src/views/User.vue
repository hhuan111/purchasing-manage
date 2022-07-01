<template>
<div>
  <el-container>
      <div style="margin-bottom: 10px">
        <el-input style="width: 300px" placeholder="请输入用户名搜索" suffix-icon="el-icon-search" v-model="username"></el-input>
        <el-input style="width: 300px; margin-left: 5px" placeholder="请输入姓名搜索"   suffix-icon="el-icon-search" v-model="nickname"></el-input>
        <el-button style="margin-left: 5px"  type="primary" @click="load">搜索</el-button>
        <el-button style="margin-left: 5px"  type="primary" @click="reset">重置</el-button>
      </div>
  </el-container>

  <div style="margin-right: 10px; margin-bottom: 10px">
    <el-button type="primary" @click="handleAdd" style="margin-right: 5px">新增<i class="el-icon-circle-plus-outline"></i></el-button>
    <el-popconfirm
        style="margin-left: 5px"
        confirm-button-text='确定'
        cancel-button-text='我再想想'
        icon="el-icon-info"
        icon-color="red"
        title="您确定批量删除这些数据吗？"
        @confirm="delBatch"
    >
      <el-button type="primary" slot="reference" style="margin-right: 10px">批量删除<i class="el-icon-delete"></i></el-button>
    </el-popconfirm>
    <el-upload action="http://localhost:9090/user/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
      <el-button type="primary" >导入<i class="el-icon-bottom"></i></el-button>
    </el-upload>
    <el-button type="primary" @click="exp" style="margin-left: 10px">导出<i class="el-icon-top"></i></el-button>
  </div>

  <el-table :data="tableData" border stripe header-cell-class-name="headClass" @selection-change="handleSelectionChange" >
    <el-table-column type="selection" width="55"></el-table-column>
    <el-table-column prop="id" label="用户ID" width="90" align="center" >
    </el-table-column>
    <el-table-column prop="username" label="用户名" align="center" >
    </el-table-column>
    <el-table-column prop="nickname" label="姓名"  align="center" >
    </el-table-column>
    <el-table-column prop="email" label="电子邮箱" width="150" align="center" >
    </el-table-column>
    <el-table-column prop="phone" label="联系方式" width="120" align="center" >
    </el-table-column>
    <el-table-column prop="address" label="住址" align="center"  >
    </el-table-column>
    <el-table-column prop="department" label="所属部门" width="100" align="center" >
    </el-table-column>
    <el-table-column prop="role" label="角色" width="100" align="center" >
    </el-table-column>
    <el-table-column label="操作" align="center"  width="200" >
      <template slot-scope="scope">
        <el-button type="success" @click="handleEdit(scope.row)">编辑<i class="el-icon-edit"></i></el-button>
        <el-popconfirm
            style="margin-left: 5px"
            confirm-button-text='确定'
            cancel-button-text='我再想想'
            icon="el-icon-info"
            icon-color="red"
            title="您确定删除吗？"
            @confirm="del(scope.row.id)"
        >
          <el-button type="danger" slot="reference">删除<i class="el-icon-delete"></i></el-button>
        </el-popconfirm>
      </template>
    </el-table-column>
  </el-table>
  <div style="padding: 10px 0">
    <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[5, 10, 15, 20]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
    </el-pagination>
  </div>

  <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%" >
    <el-form label-width="80px" size="small">
      <el-form-item label="用户名">
        <el-input v-model="form.username" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="角色">
        <el-select clearable v-model="form.role" placeholder="请选择角色" style="width: 100%">
          <el-option v-for="item in roles" :key="item.name" :label="item.name" :value="item.flag"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="姓名">
        <el-input v-model="form.nickname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="电子邮箱">
        <el-input v-model="form.email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="联系方式">
        <el-input v-model="form.phone" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="地址">
        <el-input v-model="form.address" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="所属单位">
        <el-input v-model="form.department" autocomplete="off"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">取 消</el-button>
      <el-button type="primary" @click="save">确 定</el-button>
    </div>
  </el-dialog>

</div>
</template>

<script>
export default {
  name: "User",
  data(){
    return{
      tableData: [],
      total:0,
      pageNum:1,
      pageSize:5,
      username:"",
      nickname:"",
      department:"",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      roles: []
    }
  },
  created() {
    // 请求分页查询数据
    this.load()
  },
  methods:{
    load() {
      this.request.get("/user/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          nickname: this.nickname,
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.records
        this.total = res.data.total

      })
      this.request.get("/role").then(res => {
        this.roles = res.data
      })
    },
    save() {
      this.request.post("/user", this.form).then(res => {
        if (res.data) {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/user/" + id).then(res => {
        if (res.data) {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/user/del/batch", ids).then(res => {
        if (res.data) {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.username = ""
      this.nickname=""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    exp() {
      window.open("http://localhost:9090/user/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }

  }
}
</script>

<style>
.headClass{
  background: lightgreen!important;
}
</style>

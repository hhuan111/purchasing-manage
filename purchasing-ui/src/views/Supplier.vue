<template>
  <div>
    <el-container>
      <div style="margin-bottom: 10px">
        <el-input style="width: 300px" placeholder="请输入供应商名称搜索" suffix-icon="el-icon-search" v-model="name"></el-input>
        <el-button style="margin-left: 5px"  type="primary" @click="load">搜索</el-button>
        <el-button style="margin-left: 5px"  type="primary" @click="reset">重置</el-button>
      </div>
    </el-container>

    <div style="margin-right: 10px; margin-bottom: 10px">
      <el-button type="primary" @click="handleAdd" style="margin-right: 5px" >新增<i class="el-icon-circle-plus-outline"></i></el-button>
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
      <el-upload action="http://localhost:9090/supplier/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" >导入<i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" style="margin-left: 10px">导出<i class="el-icon-top"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe header-cell-class-name="headClass" @selection-change="handleSelectionChange" >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="供应商ID" width="90" align="center" >
      </el-table-column>
      <el-table-column prop="name" label="供应商名称" align="center" >
      </el-table-column>
      <el-table-column prop="address" label="供应商地址" align="center">
      </el-table-column>
      <el-table-column prop="supplier" label="对接负责人" align="center">
      </el-table-column>
      <el-table-column prop="phone" label="联系方式" align="center">
      </el-table-column>
      <el-table-column prop="email" label="供应商邮箱" align="center">
      </el-table-column>
      <el-table-column prop="account" label="银行账号" align="center">
      </el-table-column>
      <el-table-column label="操作" align="center"  width="400" >
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">修改信息<i class="el-icon-edit"></i></el-button>
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

    <el-dialog title="供应商信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="100px" size="small">
        <el-form-item label="供应商名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址">
          <el-input v-model="form.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="对接负责人">
          <el-input v-model="form.supplier" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="供应商邮箱">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="银行账号">
          <el-input v-model="form.account" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>


    <el-dialog title="商品信息" :visible.sync="vis"  width="30%">
      <el-table :data="goods" border stripe>
        <el-table-column prop="goodname" label="商品名称"></el-table-column>
        <el-table-column prop="price" label="商品价格"></el-table-column>
      </el-table>
    </el-dialog>



  </div>
</template>

<script>
export default {
  name: "Supplier",
  data(){
    return{
      tableData: [],
      total:0,
      pageNum:1,
      pageSize:5,
      name:"",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      goods:[],
      vis:false,
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    // 请求分页查询数据
    this.load()
  },
  methods:{
    load() {
      this.request.get("/supplier/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    save() {
      this.request.post("/supplier", this.form).then(res => {
        if (res.code === '200') {
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
    lookGoods(goods){
      this.goods=goods;
      this.vis=true;

    },
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/supplier/" + id).then(res => {
        if (res.code === '200') {
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
      this.request.post("/supplier/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
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
      window.open("http://localhost:9090/supplier/export")
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
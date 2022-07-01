<template>
  <div>
    <el-container>
      <div style="margin-bottom: 10px">
        <el-input style="width: 300px" placeholder="请输入采购信息名称搜索" suffix-icon="el-icon-search" v-model="name"></el-input>
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

    </div>

    <el-table :data="tableData" border stripe header-cell-class-name="headClass" @selection-change="handleSelectionChange" >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="采购编号" width="100" align="center" >
      </el-table-column>
      <el-table-column prop="department" label="采购单位" align="center"  >
      </el-table-column>
      <el-table-column prop="name" label="采购商品名称" align="center" >
      </el-table-column>
      <el-table-column prop="price" label="商品单价" align="center" >
      </el-table-column>
      <el-table-column prop="price" label="商品数量" align="center" >
      </el-table-column>
      <el-table-column prop="total" label="采购总额(元）" align="center" width="150" >
      </el-table-column>
      <el-table-column prop="date" label="采购时间"  align="center" >
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

    <el-dialog title="采购信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="100px" size="small">
        <el-form-item label="采购单位">
          <el-select clearable v-model="form.departmentId" placeholder="请选择采购单位" style="width: 100%">
            <el-option v-for="item in departments" :key="item.id" :label="item.name" :value="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="采购商品名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="商品单价">
        <el-input v-model="form.price" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="商品数量">
          <el-input v-model="form.amount" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="采购总额">
          <el-input v-model="form.total" autocomplete="off"></el-input>
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
  name: "Order",
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
      departments:[],
      department: localStorage.getItem("department")?JSON.parse(localStorage.getItem("department")):{}
    }
  },
  created() {
    // 请求分页查询数据
    this.load()
  },
  methods:{
    load() {
      this.request.get("/purchase/page", {
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

      this.request.get("/dept").then(res => {
        this.departments = res.data
      })
    },
    save() {
      this.request.post("/purchase", this.form).then(res => {
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
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/purchase/" + id).then(res => {
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
      this.request.post("/purchase/del/batch", ids).then(res => {
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
    }

  }
}
</script>

<style>
.headClass{
  background: lightgreen!important;
}
</style>
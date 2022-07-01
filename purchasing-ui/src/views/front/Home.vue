<template>
  <div>
    <div style="margin: 10px 0">
      <el-carousel height="450px" :interval="10000">
        <el-carousel-item v-for="item in imgs" :key="item">
          <img :src="item" alt="" style="width: 100%">
        </el-carousel-item>
      </el-carousel>
    </div>

    <div style="margin: 10px 0">
      <el-row :gutter="10">
        <el-col :span="6" v-for="item in files" :key="item.id" style="margin-bottom: 10px">

          <div style="border: 1px solid #ccc; padding-bottom: 10px">
            <img :src="item.url" alt="" style="width: 100%">
            <div style="color: #666; padding: 10px">{{ item.name }}</div>
            <div style="padding: 10px"><el-button type="primary">购买</el-button></div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "FrontHome",
  data(){
    return{
      imgs: [
        'https://wx-lego-doc.oss-cn-hangzhou.aliyuncs.com/file/jpg/b9bd121e-4aaa-41cb-811b-ab63f519498a.jpg?x-oss-process=image/quality,Q_80',
        'https://wx-lego-doc.oss-cn-hangzhou.aliyuncs.com/file/png/e901d956-29fc-4ab5-9ad5-a45175b9cb2c.png?x-oss-process=image/quality,Q_80',
        'https://wx-lego-doc.oss-cn-hangzhou.aliyuncs.com/file/jpg/1eae83ad-b7f2-44d7-9b30-8e5fb50211e1.jpg?x-oss-process=image/quality,Q_80',
        'https://wx-lego-doc.oss-cn-hangzhou.aliyuncs.com/file/jpg/37a23619-a870-4f3f-834c-c4caccbb4c67.jpg?x-oss-process=image/quality,Q_80',
        'https://wx-lego-doc.oss-cn-hangzhou.aliyuncs.com/file/jpg/0879ec15-03a4-462d-bf60-2a94de9a17fa.jpg?x-oss-process=image/quality,Q_80'
      ],
      files:[]
    }
  },
  created() {
    this.request.get("/echarts/file/front/all").then(res => {
      console.log(res.data)
      this.files = res.data.filter(v => v.type === 'png' || v.type === 'jpg' || v.type === 'webp')
    })
  },
  methods:{

  }
}
</script>

<style scoped>

</style>
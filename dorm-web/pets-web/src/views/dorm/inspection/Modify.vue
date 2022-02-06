<template>
  <div>
    <van-tree-select height="200vw" :items="items" :main-active-index.sync="active">
      <template #content>
        <div v-for="li in listItems" :key="li.itemIndex">
          <div v-if="li.itemIndex === active">
            <li v-for="lii in li.items" :key="lii.id">{{lii.item}}</li>
          </div>
        </div>
      </template>
    </van-tree-select>
  </div>
</template>

<script>
  import {getCheckItem} from "../../../api/inspection";
  export default {
    name: "Modify",
    data(){
      return {
        active: 0,
        //左侧栏 {text: 展示文本}
        items: [],
        //右侧栏 {itemIndex: 所属左侧栏的下标， items：展示的数据}
        listItems: [],
        checkItems: []
      }
    },
    mounted() {
      const _this = this;
      getCheckItem().then(res => {
        this.checkItems = res.data
        for (let i = 0; i < this.checkItems.length; i++) {
          _this.items.push({text: this.checkItems[i].item})
          _this.listItems.push({itemIndex: i, items: this.checkItems[i].childrenItem})
        }
      })
    }
  }
</script>

<style scoped>

</style>
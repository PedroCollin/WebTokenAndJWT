<template>
  <div class="hiddenfield content">
    <div class="title check">
      <input type="checkbox" v-model="vReff" v-if="hiddenContent" />
      <h3 :class="{ 'title-no-hidden': !hiddenContent }">{{ title }}</h3>
    </div>

    <div class="content" v-if="vReff || !hiddenContent">
      <div class="box" v-if="type == 'checks'">
        <div class="check-item" v-for="item in items" :key="item">
          <input type="checkbox" v-model="innerRefs[0][Object.keys(innerRefs[0])[items.indexOf(item)]]" />
          <span>{{ item }}</span>
        </div>
      </div>

      <div v-else-if="type == 'rows'">
        <div
          :class="'row r-' + item.length"
          v-for="item in items"
          :key="item[0]"
        >
        <!-- @input="handleInput" -->
          <input  v-for="i in item" v-if="!(i === 'Aluno:')"  type="text"  :placeholder="i"  :key="i" v-model="innerRefs[items.indexOf(item)][Object.keys(innerRefs[items.indexOf(item)])[[item.indexOf(i)]]]"/>
          <SearchFilter :idUser="idUser"  v-else />
        <!-- innerRefs[items.indexOf(item)][Object.keys(innerRefs[items.indexOf(item)])[[item.indexOf(i)]]]-->
        </div>
      </div>
      <div v-else>
        <div
          :class="'row r-' + item.length"
          v-for="item in items"
          :key="item[0]"
        >
        <!-- @input="handleInput" -->
          <textarea   v-for="i in item"  type="text" class="large-input" rows="7" :placeholder="i"  :key="i" v-model="innerRefs[items.indexOf(item)][Object.keys(innerRefs[items.indexOf(item)])[[item.indexOf(i)]]]"/>

        <!-- innerRefs[items.indexOf(item)][Object.keys(innerRefs[items.indexOf(item)])[[item.indexOf(i)]]]-->
        </div>
      </div>

    </div>
  </div>
</template>

<style lang="scss" scoped>
@import "../static/assets/scss/mixins";

.hiddenfield.content {
  .title {
    margin-bottom: 20px;
    margin-top: 35px;

    h3 {
      font-size: 1.75rem;
      font-weight: 400;
      color: var(--text-form);
    }

    .title-no-hidden {
      font-size: 2rem;
      font-weight: 400;
      color: var(--text-form);
    }

    &.check {
      @include d-flex(center, flex-start, row);
      input[type="checkbox"] {
        width: 20px;
        height: 20px;
        background-color: #fff;
        margin-right: 1rem;
      }
    }
  }

  .content {
    .box {
      @include d-flex(flex-start, flex-start, column);
      padding: 2rem 4rem;
      border: solid 1px #757575;
      border-radius: 0.25rem;

      .check-item {
        @include d-flex(center, flex-start, row);
        font-size: 1.2rem;
        margin-bottom: 10px;

        input {
          min-width: 18px;
          min-height: 18px;
          margin-right: 1rem;
        }
      }
    }
  }

  .row {
    margin-bottom: 10px;
    @include d-flex(flex-start, center, row);
    width: 100%;

    input,
    textarea,
    label,
    .dropdown-wrapper {
      background: #e2e2e2;
      border: solid 1.25px #808080c0;
      font-size: 1.25rem;
      padding: 0.6rem 1rem;
      border-radius: 0.1rem;
    }
    textarea{
     //resize: none 
    }

    &.r-1 {
      input,
      textarea,
      label,
      .dropdown-wrapper {
        flex: 1 0 100%;
      }
    }
    &.r-3 {
      input,
      textarea,
      label,
      .dropdown-wrapper {
        flex: 1 0 33.33333%;
      }
    }
    &.r-2 {
      input,
      textarea,
      label {
        flex: 1 0 50%;
      }
    }
  }
}

@media (max-width: 720px) {

  .dropdown-wrapper {
    margin-bottom: 10px;
    width: 100%;
  }

  .hiddenfield.content .content .box {
    padding: 1.5rem 1.5rem;
  }

  .sheet .content .row {
    margin-bottom: 0;
    flex-direction: column;
    input, textarea {
      margin-bottom: 10px;
      width: 100%;
    }
  }

}
</style>

<script>
// import { mapMutations } from "vuex";

export default {
  props: ["title", "items", "type", "hiddenContent", "vReff", "innerRefs","idUser"],
  data: function () {

    return {


    };
  },
  methods: {
    // ...mapMutations(["changeCheck"]),
    updateVal: function (e) {

    }
  },
  computed: {

  },
  created(){
    
    // v-model for select -> innerRefs[0][Object.keys(innerRefs[0])[items.indexOf(item)]]
    //this.$props.innerRefs[this.$props.items.indexOf(item)][Object.keys(innerRefs[item.indexOf(i)])]
    // v-model for input -> innerRefs[items.indexOf(item)][Object.keys(innerRefs[items.indexOf(item)])[[item.indexOf(i)]]]
    //Object.keys(innerRefs[items.indexOf(item)])[[item.indexOf(i)]]
    //innerRefs[items.indexOf(item)][item.indexOf(i)]
  }


};
</script>

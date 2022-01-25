<template  >
  <div>
    <h3 class="titles-fiap" id="teeste">
      {{ title }}
    </h3>

    <div :class="classRow + 'label-title'">
      <label v-for="title in topTitle" :key="title">{{ title }}</label>
    </div>

    <div
      v-for="title in leftTitle"
      :class="classRow + 'inp-white'"
      :key="title"
    >
      <label>{{ title }}:</label>
      <input  type="text" :id="Object.keys(innerRefs[0])[leftTitle.indexOf(title)]+'Date'" v-model="innerRefs[0][Object.keys(innerRefs[0])[leftTitle.indexOf(title)]].date" disabled />
      <input
      
      readonly="readonly"
      type="text" 
      class="signature" 
      @click="showModal=!showModal; signVal = Object.keys(innerRefs[0])[leftTitle.indexOf(title)]" 
      :id="Object.keys(innerRefs[0])[leftTitle.indexOf(title)]" 
      v-model="innerRefs[0][Object.keys(innerRefs[0])[leftTitle.indexOf(title)]].sign" 
     />

     
      
    </div>

    <PopUp  :signValues='signVal' :type="'sign'" :show="showModal" v-if="showModal" />

  </div>
</template>

<style lang="scss" scoped>
  @import "../static/assets/scss/mixins";

  .titles-fiap {
    margin-bottom: 20px;
    margin-top: 35px;
  }

  h3 {
    font-size: 2rem;
    font-weight: 400;
    color: var(--text-form);
  }
  .row {
    margin-bottom: 10px;
    @include d-flex(flex-start, center, row);
    width: 100%;

    input,
    label {
      background: #e2e2e2;
      border: solid 1.25px #808080c0;
      font-size: 1.25rem;
      padding: 0.6rem 1rem;
      border-radius: 0.1rem;
    }

    &.r-1 {
      input,
      label {
        flex: 1 0 100%;
      }
    }
    &.r-3 {
      input,
      label {
        flex: 1 0 33.33333%;
      }
    }
    &.r-2 {
      input,
      label {
        flex: 1 0 50%;
      }
    }

    &:last-child {
      margin-bottom: 0;
    }

    &.inp-white {
      input {
        background: #fff;
      }
    }

    label {
      text-align: center;
      color: var(--text-form);
    }

    &.label-title {
      label {
        font-size: 1.5rem;
      }
    }
  }

  .signature {
    cursor: pointer;
  }

  @media (max-width: 720px) {
    .row {
      margin-bottom: 0;
      input {
        margin-bottom: 10px;
        width: 100%;
      }
    }

    .label-title {
      margin-bottom: 10px;
    }
  }
</style>

<script>
  export default {
    data: function() {
      return {
        signVal: '',
        showModal: false,
        ver: null,
      }
    },
    props: ["topTitle", "leftTitle", "title","innerRefs"],
    computed: {
      totalTitles: function () {
        return this.topTitle.length.toString(); 
      },
      classRow: function () {
        return "row r-" + this.totalTitles + " ";
      },
    },
    methods:{
      maskData: function(){
        
        this.$props.innerRefs.forEach((line) =>{
          for (const [key, value] of Object.entries(line)) {

            if(document.getElementById(key) !== null ){
              if(document.getElementById(key).value === "Não Assinado"){

                //console.log(value.sign)
                //document.getElementById(key).value = "Não Assinado";
                
                //if(!this.ver && this.ver !== null){
                  document.getElementById(key).style.color = "#FF7F7F";  
                //}
                
              }else{
                this.ver = true;
                document.getElementById(key).value = "Assinado";
                document.getElementById(key).style.color = "#038c25";  
              }
            }
          }
        })
      },
      temporizer: function(initiate){
        this.maskData()
        setTimeout(this.temporizer, 1000);
      },
      changeDate: function(e){
        this.$props.innerRefs[0][e.target.id].date = new Date();
      }
    },  
    created: function(){
      
      // ref for input v-models -> innerRefs[0])[leftTitle.indexOf(title)]" v-model="innerRefs[0][Object.keys(innerRefs[0])[leftTitle.indexOf(title)]]
    }, 
    mounted(){
      //setTimeout(this.maskData(), 1000);
      this.temporizer(true)
    },

  };
</script>   
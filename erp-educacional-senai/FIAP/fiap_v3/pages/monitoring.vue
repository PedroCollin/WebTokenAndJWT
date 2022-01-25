<template>
  <div id="monitoring" :class="darkMode ? 'dark' : 'light'">
    <div class="content-fiap">
      
      <div class="content" >
        <Card v-for="fiap in fiaps" :key="fiap._id" :data="fiap" />
      </div>

      <pagination
          v-if="fiaps.length"
          :offset="offset"
          :total="total"
          :limit="limit"
          :last_page="last_page"
          @change-page="changePage"
    />
    </div>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import moment from "moment";
  import DateFilter from "../static/date";
  import Vue from "vue";
  Vue.filter("date", DateFilter);
  import Pagination from '@/components/Pagination.vue';
  const axios = require('axios');
  export default {
    computed: {
      ...mapGetters(["darkMode"]),
    },
   
    data() {
      return {
        fiap: {
          id: 1,
          nomeAluno: 'Bram Stok',
          nomeTurma: '1DES',
          nomeUsuario: 'André Savedra',
        },
        fiaps: [],
        offset: 1,
        limit: 4,
        total: 1,
        last_page: 0,
        BASE_URL:"http://localhost:8000/",
      };
    },
    mounted() {
      this.getFiaps();
    },
    methods: {
      getFiaps() {
        const BASE_URL = 'http://127.0.0.1:8000';
        const url = `${BASE_URL}/fiaps?page=${this.offset}&size=${this.limit}`;
        axios.get(url).then(({ data }) => {
          this.fiaps = data.data;
          this.total = data.total;
          this.last_page = data.last_page;
        });
      },
      changePage(value) {
        this.offset = value;
        this.getFiaps();
      },
      getFiap: async function(fiapID){
        const FiapResponse = await axios.get(this.BASE_URL + "fiap/" + fiapID +"/"); 
        this.getAluno(FiapResponse.data.aluno)
        this.getTurma(FiapResponse.data.turma)
        //this.getFrequency(fiapID)
        //this.getApprennticeship(fiapID)
      },
    },
    created(){
      this.getFiap(1);
    },
  };
</script>

<style lang="scss">
  @import "../static/assets/scss/dark";
  .content-fiap {
    display: flex;
    flex-direction: column;
    gap: 6rem;
  }
  #monitoring {
    justify-content: center;
    flex-direction: column;
    width: 100%;
    padding: 6rem 8% 2rem 8%;
    border-top: 2px solid var(--border-nav);
    background: var(--back-second);
    min-height: calc(100% - (143px));
  
    .content-fiap > .content {
      position: relative;
      display: flex;
      flex-direction: column;
      gap: 2rem;
      align-items: center;
      min-height: 572px;
    }
  }
  @media (max-width: 1116px) {
    #monitoring > .content-fiap > .content {
      min-height: 692px;
      gap: 6rem;
    }
  }
  @import "../static/assets/scss/queries";
</style>
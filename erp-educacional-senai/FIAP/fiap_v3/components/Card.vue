<template>
  <div class="card">
    <div class="front-card">
        <i :class="{'fas fa-angle-down right': active, 'fas fa-angle-right right': !active }" @click="active=!active"></i>
        <div class="content">
          <div class="row number-fiap">
            <p class="basic-text"># {{ data.id }}</p>
          </div>
          <div class="row student">
            <div class="name">
              <p class="basic-text">Aluno:</p>
              <p class="name-student">{{ nomeAluno }}</p>
            </div>
            <div class="functions-icon">
              <div class="row-icon">
                <i @click="editFiap(data.id)" class="fas fa-edit icon edit"></i>
                <i class="fas fa-print icon print"></i>
              </div>
              <div class="row-icon">
                <i class="fas fa-trash-alt icon trash"></i>
                <i class="fas fa-arrow-circle-right icon arrow"></i>
              </div>
            </div>
          </div>
          <div class="row">
            <p class="basic-text">{{ data.dataInicio | date }}</p>
            <p class="basic-text">{{ nomeTurma }}</p>
          </div>
        </div>
      </div>
    <div class="back-card" :class="{ 'active': active }">
        <div class="content">
          <div class="teacher">
            <p class="basic-text">Professor:</p>
            <p class="name-teacher">{{ nomeUsuario }}</p>
          </div>
          <div class="reason">
            <p class="basic-text">Motivo:</p>
            <p class="basic-text text reason" style="font-size: 14px;">
              {{observacao}}
            </p>
          </div>
        </div>
      </div>
  </div>
</template>

<script>
  const axios = require('axios');
  export default {
    props: ['data'],
    data: function() {
      return {
        active: false,
        nomeAluno: '',
        nomeUsuario: '',
        nomeTurma: '',
        idFiap: '',
        BASE_URL:"http://localhost:8000/",
        observacao: '',
      }
    },
    methods: {
      fetchIdAluno: async function(){
        const alunoResponse = await axios.get(this.BASE_URL + "aluno/" + this.$props.data.aluno +"/")
        this.nomeAluno = alunoResponse.data.nome;
      },
      fetchIdUsuario: async function(){
        const usuarioResponse = await axios.get(this.BASE_URL + "usuario/" + this.$props.data.usuario +"/")
        this.nomeUsuario = usuarioResponse.data.nome;
      },
      fetchIdTurma: async function(){
        const turmaResponse = await axios.get(this.BASE_URL + "turma/" + this.$props.data.turma +"/")
        this.nomeTurma = turmaResponse.data.cod_turma;
      },
      editFiap: function(idFiap){
        this.$router.push({ name: 'index', params:{token: '_aSa12c@#DA',fiapID: idFiap, mthd: 'PUT', idAluno: this.$props.data.aluno } })
      },
      fiapObs: async function(){
        const obsResponse = await axios.get(this.BASE_URL + "observacao/" +  this.$props.data.id +"/");
        this.observacao = obsResponse.data.observacao;
      },
    },
    mounted() {
      this.fetchIdAluno(),
      this.fetchIdUsuario(),
      this.fetchIdTurma(),
      this.fiapObs()
    }
  }
</script>

<style lang="scss" scoped>
  @mixin d-flex($align, $just, $dir) {
      display: flex;
      flex-direction: $dir;
      align-items: $align;
      justify-content: $just;
  }
  $color-basic: #727272;
  .basic-text {
    color: $color-basic;
    font-size: 1.25rem;
  }
  .name-student, .name-teacher {
    font-size: 2.2rem;
    color: #545454;
    margin-left: .5rem;
  }
  .front-card,
  .back-card{
    background: #fff;
    width: 100%;
    padding: 2rem 4rem;
    border-radius: .5rem;
    min-height: 128px;
  }
  .card {
    min-width: 55vw;
    position: relative;
    max-width: 1200px;
    width: 100%;
    
    .front-card {
      position: absolute;
      z-index: 999;
      box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
      @include d-flex(center, center, row);
      .right {
        font-size: 3.5rem;
        margin-right: 6rem;
        color: #182766;
        cursor: pointer;
        width: 24px;
      }
      .content {
        @include d-flex(initial, initial, column);
        width: 100%;
        gap: 1.5rem;
      }
      .row {
        @include d-flex(center, space-between, row);
        .name {
          @include d-flex(baseline, initial, row);
        }
      }
      .number-fiap {
        justify-content: flex-end;
      }
      .functions-icon {
        @include d-flex(baseline, initial, row);
        gap: .5rem;
        .row-icon {
          @include d-flex(baseline, space-between, row);
          gap: .5rem;
        }
        .icon {
          font-size: 1.6rem;
          @include d-flex(center, center, row);
          border-radius: .3rem;
          color: #fff;
          cursor: pointer;
          height: 28px;
          width: 28px;
          &.edit { background: #FF8A00; }
          &.print { background: #005CB0; }
          &.trash { background: #E30613; }
          &.arrow { background: #02A909; }
        }
      }
    }
    .back-card {
      box-shadow: rgb(0 0 0 / 10%) 0px 3px 6px, rgb(0 0 0 / 17%) 0px 3px 6px;
      display: flex;
      align-items: center;
      .content {
        display: flex;
        justify-content: space-between;
        flex-direction: row;
        width: inherit;

        .reason {
          overflow: hidden;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
        }

      }
      .teacher {
        margin-left: 81.875px;
        @include d-flex(baseline, initial, row);
      }
      &.active {
        padding-top: 150px;
      }
      .reason .text{
          max-width: 360px;
      }
    }
  }
  @media (max-width: 1116px) {
    .card {
      .front-card {
        .functions-icon {
          flex-direction: column;
        }
        .right {
          margin-right: 3rem;
        }
      }

      .back-card {
        &.active {
          padding-top: 180px;
        }
      }
    }
  }

  @media (max-width: 720px) {
    .card {
      .back-card {

        .content {
          gap: 6rem;  
        }
        
        .teacher {
          margin-left: 0;
          display: block;

          .name-teacher {
            margin-left: 0;
          }
        }
      }
    }
  }
</style>
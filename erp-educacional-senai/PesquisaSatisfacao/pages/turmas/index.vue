<template>
  <div class="body">
    <div class="head">
      <div class="box">
        <i class="pi pi-search" aria-hidden="true"></i>
        <input type="text" name="" />
      </div>

      <h1 class="title">Turmas</h1>
    </div>
    <div class="content">
      <div class="cards" v-for="(turma, index) in this.turmas" :key="index">
        <div class="card-body" id="card">
          <h1 class="card-title">
            Turma: <b>{{ turma["name"] }}</b>
          </h1>
          <p class="card-text">
            Total de alunos: <b>{{ turma["alunos"] }}</b>
          </p>
          <div class="btn-feedbacks">
            <router-link
              :to="{ name: 'feedbacks', params: { idTurma: turma['id'] } }"
              class="btn"
              >Feedbacks</router-link
            >
          </div>

          <div class="btn-dashboards">
            <router-link
              :to="{ name: 'dashboards', params: { idTurma: turma['id'] } }"
              class="btn"
              >Dashboard</router-link
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      turmas: [],
    };
  },
  methods: {
    getTurmas: async function () {
      await this.$axios
        .get("http://127.0.0.1:8001/api/v1/Turma/")
        .then((dados) => {
          dados.data.forEach(async (element) => {
            await this.turmas.push({
              id: element.id,
              name: element.nome,
              alunos: element.totalAlunos,
            });
          });
        });
    },
  },
  created() {
    this.getTurmas();
  },
};
</script>
<style lang="scss">
.body {
  padding: 60px 80px;
  display: flex;
  flex-direction: column;
  justify-content: center;

  .head {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;

    h1 {
      text-align: right;
    }

    .box {
      position: relative;
      width: 50%;
    }

    .box > i {
      font-size: 20px;
      font-weight: bold;
      color: #000;
      position: absolute;
      right: 15px;
      top: 10px;
      text-align: end;
      width: auto;
    }

    .box > input {
      height: 40px;
      width: 100%;
      border: 2px solid #000;
      border-radius: 25px;
      outline: none;
      font-size: 18px;
      padding-left: 10px;
    }
  }

  .content {
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center;
  }
  .cards {
    padding: 20px;
    width: auto;

    #card {
      height: 250px;
      width: 250px;
      border: 1px solid;
      border-radius: 25px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .card-body {
      margin-top: 20px;
      text-align: center;
    }

    .btn-feedbacks {
      height: 35px;
      width: 200px;
      position: relative;
      margin-left: auto;
      margin-right: auto;
      margin-top: 20px;
      background-color: #c22a1f;
      border-radius: 25px;
    }

    .btn-dashboards {
      height: 35px;
      width: 200px;
      position: relative;
      margin-left: auto;
      margin-right: auto;
      margin-top: 15px;
      background-color: #c22a1f;
      border-radius: 25px;
    }

    .btn {
      background-color: #c22a1f;
      color: #fff;
      font-size: 25px;
      text-decoration: none;
    }
  }
}

@media (max-width: 900px) {
  .box {
    width: 100% !important;
  }
}
@media (max-width: 600px) {
  .body {
    padding: 30px 20px;
    .box {
      width: 100% !important;
    }
    .cards {
      padding: 20px 10px;
    }
  }
}
</style>
<template>
  <main class="pageBody">
    <div class="view">
      <div class="head"><h4>Feedbacks - 2 DES</h4></div>
      <div class="body">
        <div
          class="content"
          v-for="(feedback, index) in this.feedbacks"
          :key="index"
        >
          <Accordion class="accordion">
            <AccordionTab :header="feedback.aluno">{{
              feedback.text
            }}</AccordionTab>
          </Accordion>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  name: "Feedbacks",

  data() {
    return {
      feedbacks: [],
      alunos: [],
      turmaId: 1,
      active: 0,
      tabs: [
        { title: "Title 1", content: "Content 1" },
        { title: "Title 3", content: "Content 2" },
        { title: "Title 3", content: "Content 3" },
      ],
    };
  },
  methods: {
    getFeedbacks: async function () {
      await this.$axios
        .get("http://127.0.0.1:8001/api/v1/Forms/?id_turma=" + this.turmaId)
        .then((dados) => {
          dados.data.forEach(async (element, i) => {
            let nome_aluno = "";
            if (element.feedback != "") {
              await this.$axios
                .get("http://127.0.0.1:8001/api/v1/Aluno/" + element.id_aluno)
                .then((dados) => {
                  nome_aluno = dados.data.nome;
                });

              await this.feedbacks.push({
                text: element.feedback,
                aluno: nome_aluno,
              });
            }
          });
          console.log(this.feedbacks);
        });
    },
  },
  async created() {
    this.turmaId = this.$route.params.idTurma;
    this.getFeedbacks();
  },
};
</script>

<style lang="scss">
@mixin flexLayout($direction, $justify, $align) {
  display: flex;
  flex-direction: $direction;
  justify-content: $justify;
  align-items: $align;
}

p,
span,
a {
  overflow-y: hidden;
}

.p-accordion
  .p-accordion-header
  .p-accordion-header-link
  .p-accordion-toggle-icon {
  width: auto !important;
}

.pageBody {
  background-image: url("../../assets/media/classroom_bg.png");
  position: relative;
  background-size: cover;
  background-repeat: no-repeat;
  height: 100vh;
  width: 100vw;
  @include flexLayout(row, center, center);

  .view {
    position: absolute;
    top: 30px;
    width: 70%;
    height: auto;
    background-color: #fff;
    @include flexLayout(column, unset, flex-start);
    border-radius: 0.95rem;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;

    .body {
      padding: 20px;
    }

    .head {
      background-color: #c22a1f;
      width: 100%;
      padding: 10px;
      h4 {
        color: #fff;
        font-size: 16px;
        padding: 10px 30px;
      }
    }
    .content {
      background-color: white;
    }
  }
}
</style>

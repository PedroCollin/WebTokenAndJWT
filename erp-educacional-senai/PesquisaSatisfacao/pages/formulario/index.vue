<template>
  <div class="all p-d-flex p-flex-column p-jc-center p-ai-center">
    <div class="container p-d-flex p-flex-column p-jc-top p-ai-center">
      <div class="titulo p-d-flex p-flex-column p-jc-center p-ai-left">
        <h1>Itens de Avaliação</h1>
      </div>

      <div
        class="form"
        :v-if="questions"
        v-for="(question, index) in this.questions"
        :key="index"
      >
        <div class="titulo1">
          <h1>{{ index + 1 }}. {{ question.pergunta }}</h1>
        </div>
        <main class="pergunta1 p-d-flex p-jc-left p-ai-center">
          <section class="right-1">
            <div class="pg1">
              <h6 id="txUm">Nível de importância:</h6>
              <div
                class="
                  rbt_importancia
                  p-d-flex p-flex-column p-jc-center p-ai-center
                "
                id="v-model-radiobutton"
              >
                <div
                  class="
                    container-item
                    p-d-flex p-flex-row p-jc-left p-ai-center
                  "
                >
                  <div class="p-field-radiobutton">
                    <RadioButton
                      :id="'import-one-' + index"
                      :name="'import-' + index"
                      value="1"
                      :v-if="responses"
                      v-model="responses[index].id_importancia"
                      style="color: #ff0000;"
                    />
                    <label :for="'import-one-' + index">Alta</label>
                  </div>
                </div>
                <div
                  class="
                    container-item
                    p-d-flex p-flex-row p-jc-left p-ai-center
                  "
                >
                  <div class="p-field-radiobutton">
                    <RadioButton
                      :id="'import-two-' + index"
                      :name="'import-' + index"
                      value="2"
                      :v-if="responses"
                      v-model="responses[index].id_importancia"
                    />
                    <label :for="'import-two-' + index">Media</label>
                  </div>
                </div>
                <div
                  class="
                    container-item
                    p-d-flex p-flex-row p-jc-left p-ai-center
                  "
                >
                  <div class="p-field-radiobutton">
                    <RadioButton
                      :id="'import-three-' + index"
                      :name="'import-' + index"
                      value="3"
                      :v-if="responses"
                      v-model="responses[index].id_importancia"
                    />
                    <label :for="'import-three-' + index">Baixa</label>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="left-1">
            <div class="pg1">
              <h6 id="txdois">Nível de satisfação:</h6>
              <div
                class="rbt_satis p-d-flex p-flex-row p-jc-left p-ai-top"
                id="v-model-radiobutton"
              >
                <div class="ruim p-d-flex p-flex-column p-jc-start p-ai-start">
                  <div
                    class="
                      container-item
                      p-d-flex p-flex-row p-jc-left p-ai-center
                    "
                  >
                    <div class="p-field-radiobutton">
                      <RadioButton
                        :id="'satisf-one-' + index"
                        :name="'satisf-' + index"
                        value="1"
                        :v-if="responses"
                        v-model="responses[index].id_satisfacao"
                      />
                      <label :for="'satisf-one-' + index">Otimo</label>
                    </div>
                  </div>

                  <div
                    class="
                      container-item
                      p-d-flex p-flex-row p-jc-left p-ai-center
                    "
                  >
                    <div class="p-field-radiobutton">
                      <RadioButton
                        :id="'satisf-two-' + index"
                        :name="'satisf-' + index"
                        value="2"
                        :v-if="responses"
                        v-model="responses[index].id_satisfacao"
                      />
                      <label :for="'satisf-two-' + index">Bom</label>
                    </div>
                  </div>

                  <div
                    class="
                      container-item
                      p-d-flex p-flex-row p-jc-left p-ai-center
                    "
                  >
                    <div class="p-field-radiobutton">
                      <RadioButton
                        :id="'satisf-three-' + index"
                        :name="'satisf-' + index"
                        value="5"
                        :v-if="responses"
                        v-model="responses[index].id_satisfacao"
                      />
                      <label :for="'satisf-three-' + index"
                        >Não se aplica</label
                      >
                    </div>
                  </div>
                </div>

                <div class="ruim">
                  <div
                    class="
                      container-item
                      p-d-flex p-flex-row p-jc-left p-ai-center
                    "
                  >
                    <div class="p-field-radiobutton">
                      <RadioButton
                        :id="'satisf-four-' + index"
                        :name="'satisf-' + index"
                        value="3"
                        :v-if="responses"
                        v-model="responses[index].id_satisfacao"
                      />
                      <label :for="'satisf-four-' + index">Regular</label>
                    </div>
                  </div>

                  <div
                    class="
                      container-item
                      p-d-flex p-flex-row p-jc-left p-ai-center
                    "
                  >
                    <div class="p-field-radiobutton">
                      <RadioButton
                        :id="'satisf-five-' + index"
                        :name="'satisf-' + index"
                        value="4"
                        :v-if="responses"
                        v-model="responses[index].id_satisfacao"
                      />
                      <label :for="'satisf-five-' + index">Ruim</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </main>
        <div
          class="feedback"
          v-if="
            responses[index].id_satisfacao == 3 ||
            responses[index].id_satisfacao == 4
          "
        >
          <h2>Envie um comentário sobre sua opinião:</h2>
          <textarea
            class="textInput"
            type="text"
            placeholder="Insira aqui seu feedback sobre este tópico..."
            :id="'feedback-' + index"
            :name="'feedback-' + index"
            value="feedback"
            :v-if="responses"
            v-model="responses[index].feedback"
          ></textarea>
        </div>
        <div class="divisor"></div>
      </div>
    </div>
    <div class="buttons p-d-flex p-flex-row p-jc-evenly p-ai-center">
      <Button class="btn-send" label="Enviar" @click="sendForm()" />
      <Button class="btn-clean" label="Limpar" @click="cleanForm()" />
    </div>
  </div>
</template>

<script>
export default {
  name: "formulario",
  layout: "default",
  data() {
    return {
      messages: {},
      questions: null,
      responses: [],
      form: {
        feedback: "",
        id_aluno: 13,
        id_turma: 2,
        id_pergunta: 0,
        id_satisfacao: 0,
        id_importancia: 0,
        semestre: 1,
      },
    };
  },
  methods: {
    addMessage() {
      this.messages =
        //[
        // {severity: 'info', content: 'Dynamic Info Message'},
        { severity: "success", content: "Dynamic Success Message" };
      // {severity: 'warn', content: 'Dynamic Warning Message'}
      // ]
    },
    printer(element) {
      console.log(element);
    },
    cleanResponses() {
      for (let i = 0; i < this.questions.length; i++) {
        this.responses.push(JSON.parse(JSON.stringify(this.form)));
        this.responses[i].id_pergunta = i + 1;
      }
    },
    sendPost: async function (body) {
      console.log("strinfy", JSON.stringify(body));
      this.$axios
        .$post(
          "http://localhost:8001/api/v1/Formulario/",
          JSON.stringify(body),
          {
            headers: {
              "Content-Type": "application/json",
            },
          }
        )
        .then((response) => {
          console.log(response);
          if (response != null) return true;
          else return false;
        });
    },
    sendForm: async function () {
      console.log("FOMRULARIO:", this.responses);
      let status = false;

      for await (let response of this.responses) {
        console.log(response);
        let result = await this.sendPost(response);
      }

      // for (let i = 0; i < this.responses.length; i++) {
      //   let result = await this.sendPost(this.responses[i]);
      //   // if (!result) {
      //   //   status = true;
      //   //   console.log("ERROO AO CADASTRAR");
      //   // }
      // }

      if (status) {
      } else {
        this.$router.push("respondido");
      }

      this.cleanForm();
    },
    cleanForm() {
      this.responses.forEach((response) => {
        response.feedback = "";
        response.id_turma = 0;
        response.id_satisfacao = 0;
        response.id_importancia = 0;
      });
    },
  },
  mounted() {
    this.$axios
      .$get("http://localhost:8001/api/v1/Pergunta")
      .then((response) => {
        this.questions = response;
        this.cleanResponses();
        console.log("questions:", this.questions);
        console.log("responses:", this.responses);
      });
  },
};
</script>

<style lang="scss" scoped>
.all {
  * {
    overflow: hidden;
  }
  height: auto;
  width: 100vw;
  max-width: 100vw;
  padding: 70px 90px;

  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-image: url("@/static/classroom_bg.png");

  $size-title: 18px;
  $size-topic: 16px;
  $size-question: 15px;

  .titulo,
  .titulo1 {
    font-size: $size-title;
  }

  #txUm,
  #txdois {
    font-size: $size-topic;
  }

  .rbt_importancia,
  .rbt_satis {
    font-size: $size-question;
    input {
      background-color: #c22a1f;
    }
  }

  .container {
    width: 100%;
    background-color: #fff;
    border-radius: 15px;

    .titulo {
      width: 100%;
      height: 80px;
      font-weight: bold;
      background-color: #c22a1f;
      padding-left: 40px;
      color: #fff;
    }

    .form {
      background-color: white;
      width: 100%;
      height: auto;
      padding: 20px;
      border-radius: 15px;

      .pergunta1 {
        height: auto;
        width: 100%;
        padding: 20px 0;

        .right-1 {
          height: 170px;
          width: auto;
          background-color: white;

          .pg1 {
            width: 100%;
            margin-top: 15px;

            #txUm {
              margin-left: 10px;
            }

            .rbt_importancia {
              margin-top: 12px;
              margin-left: 10px;

              .container-item {
                label {
                  margin-top: 10px;
                  width: auto;
                  height: 20px;
                }
              }
            }
          }
        }

        .left-1 {
          height: 170px;
          width: auto;

          .pg1 {
            width: 100%;
            margin-top: 15px;
            margin-left: 15px;

            #txdois {
              margin-left: 10px;
            }

            .rbt_satis {
              margin-top: 12px;
              margin-left: 10px;

              .ruim {
                width: 150px;

                .container-item {
                  label {
                  margin-top: 10px;
                  width: auto;
                  height: 20px;
                }
                  input {
                    margin-top: 10px;
                    width: 25px;
                  }
                }
              }
            }
          }
        }
      }
      .feedback {
        padding: 0 4% 25px 0;
        .textInput {
          height: 120px;
          border-radius: 15px;
          border: 1px solid #c22a1f;
          padding: 10px;
          outline: none;
          word-break: break-all;
          resize: none;
        }
      }
    }
    .divisor {
      background-color: red;
      width: 96%;
      height: 2px;
      z-index: 100;
    }
  }

  .buttons {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    padding: 12px;

    .btn-send,
    .btn-clean {
      width: 45%;
      border-radius: 10px;
      padding: 30px;
      font-size: 1.8rem;
      font-weight: bold;
      margin: 40px 0;
      transition: all 0.3s;

      &:hover {
        transform: scale(1.03);
        cursor: pointer;
        transition: all 0.3s;
      }
    }

    .btn-send {
      background-color: #c22a1f;
      border: none;
      color: #fff;
    }

    .btn-clean {
      background-color: #fff;
      border: 2px solid #c22a1f;
      color: #c22a1f;
    }
  }
}

@media screen and (max-width: 800px) {
  .all {
    $size-title: 12px !important;
    $size-topic: 13px !important;
    $size-question: 12px !important;

    .titulo,
    .titulo1 {
      font-size: $size-title;
    }

    #txUm,
    #txdois {
      font-size: $size-topic;
    }

    .rbt_importancia,
    .rbt_satis {
      font-size: $size-question;
    }

    .container,
    .buttons {
      // height: 90%;
      width: 85vw;
    }

    .pergunta1 {
      display: flex;
      flex-direction: column;
      align-items: flex-start;

      section {
        height: auto !important;
        padding: 20px 0;
      }

      .pg1 {
        margin: 0 !important;
      }
    }
  }
}

@media screen and (max-width: 615px) {
  .all {
    padding: 40px 0;

    .ruim {
      width: 120px !important;
    }

    #txUm {
      margin-left: 0px !important;
    }

    .rbt_importancia {
      margin-left: 0px !important;
    }

    #txdois {
      margin-left: 0px !important;
    }

    .rbt_satis {
      margin-left: 0px !important;
    }

    .btn-send,
    .btn-clean {
      padding: 15px !important;
      font-size: 20px !important;
    }
  }
}

@media screen and (max-width: 501px) {
  .rbt_satis {
    margin-top: 27px !important;
  }
}
</style>

<template>
  <main class="Cadastro p-d-flex p-flex-row p-jc-center p-ai-center">
    <section
      class="
        logo_panel
        p-d-flex p-flex-column p-jc-center p-ai-center p-text-center
      "
    >
      <img src="../assets/media/suga.png" />
      <h1>Sistema Único de Gestão De Aluno</h1>
    </section>
    <section class="Cadastro_panel">
      <div class="formulario_cadastro">
        <h1 id="titulo">LOGIN</h1>
        <form action="" class="loginForm" v-on:submit.prevent="sendlogin()">
          <div class="inputcontainer">
            <div class="inputCombo">
              <label id="lblcpf" for="name">LOGIN</label>
              <input type="cpf" v-model="login" id="name" required />
            </div>
            <div class="inputCombo combo2">
              <label id="lblsenha" for="senha">SENHA</label>
              <!-- <Password id="senha" v-model="pass" toggleMask></Password> -->
              <input type="password" v-model="pass" id="senha" required />
            </div>

            <button type="submit" class="btn_enviar">ENTRAR</button>
          </div>
        </form>
      </div>
    </section>
  </main>
</template>

<script>
export default {
  layout: "login",
  data() {
    return {
      // login: [],
      pass: null,
      login: null,
    };
  },
  methods: {
    sendlogin() {
      console.log(this.login);
      console.log(this.pass);

      this.$store
        .dispatch("user/getUser", this.login, this.pass)
        .then((response) => {

          switch(response)
          {
            case "authorized":

              break;

            case "unauthorized":

              break;

            case "invalid":

              break;

            case "exception":

              break;
          }


          if (response.id > 0) {
            if (
              response.identificador === this.login &&
              response.senha === this.pass
            ) {
              this.$router.push("/pshome");
            } else {
            }
          }

          console.log("terminou");
          //   this.actualUser = response[0];
          //   this.actual_admin = this.actualUser.admin;
          //   this.$store.dispatch("user/setAdmin", this.actual_admin);

          //   this.reloadButtons();
          //   this.profileLoaded = true;
        });
      // this.$store.dispatch("user/getDjangoUser");
    },
  },
};
</script>
<style lang="scss">
.loginForm {
  width: 55%;
  height: auto;
}

.formulario_cadastro {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.inputcontainer {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

#titulo {
  display: flex;
  align-items: center;
  width: 120px;
  padding-top: 10px;
  font-size: 36px;
  padding-bottom: 50px;
}

.Cadastro {
  height: auto;
  width: 100%;
}

.Cadastro_panel {
  height: 100vh;
  width: 50%;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  background-color: white;
}

.logo_panel {
  height: 100vh;
  width: 50%;
  background-color: #313131;
  color: white;
}

img {
  margin-top: 0px;
  align-items: center;
  display: flex;
  width: 70%;
  height: 45%;
  // min-width: 150px;
  // min-height: 150px;
}

.formulario_cadastro .btn_enviar {
  background-color: #dc3d3d;
  color: white;
  border: none;
  justify-content: center;
  align-self: center;
  text-align: center;
  align-items: center;
  display: flex;
  height: 50px;
  width: 600px;
  margin-top: 75px;
  cursor: pointer;

  &:hover {
    background-color: #e05e5e;
  }
}

.inputcontainer {
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
  width: 100%;
  line-height: 44px;
}
.combo2 {
  margin-top: 60px;
}
#lblcpf #lblsenha {
  width: 100%;
  color: #d3d3d3;
}

#name,
#senha {
  width: 100%;
  padding: 10px;
  border: 0;
  border-bottom: 2px solid black;
  font-size: 20px;
}

#name:focus,
#name:valid {
  outline: 0;
  border-color: crimson;
}

#senha:focus,
#senha:valid {
  outline: 0;
  border-color: crimson;
}

@media screen and (max-width: 510px) {
  img {
    display: none;
  }

  h5 {
    display: none;
  }

  .logo_panel {
    display: none;
    width: 0%;
  }

  .Cadastro_panel {
    width: 500px;
  }
}
@media screen and (max-width: 510px) {
  img {
    display: none;
  }

  h5 {
    display: none;
  }

  .logo_panel {
    display: none;
    width: 0%;
  }

  .Cadastro_panel {
    width: 500px;
  }
}
</style>
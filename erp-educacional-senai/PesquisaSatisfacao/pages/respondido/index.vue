<template>
  <div class="p-d-flex p-flex-column p-jc-center p-ai-center p-text-center obg">
    <h1 id="title">Obrigado!</h1>

    <div class="areaSub">
      <h1 id="subT">
        Seu formulário foi enviado. Agora, vamos analisar com carinho suas
        escolhas.
      </h1>
    </div>

    <router-link
      to="/"
      class="
        p-d-flex p-flex-column p-jc-center p-ai-center
        btn btn-white btn-animate
      "
    >Concluir</router-link>
  </div>
</template>

<script>
export default {
  name: "respondido",
  layout: "default",
};
</script>

<style lang="scss" scoped>
.obg {
  height: calc(100vh - var(--height-default-header));
  width: 100vw;

  #title {
    font-size: 90px;
    color: var(--dark-background-color);
  }
  .areaSub {
    width: 50%;
    #subT {
      font-size: 2.5rem;
      font-weight: 300;
      color: var(--grey-text-color);
    }
  }
  .btn {
    width: 25%;
    max-width: 380px;
    height: 15%;
    max-height: 90px;
    background-color: var(--red-background-color);
    font-size: 40px;
    color: var(--dark-text-color);
    border: 0px;
    border-radius: 20px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    margin-top: 90px;
    transition: all 0.3s;

    &:hover {
      transform: translateY(-3px);
      transition: all 0.3s;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
  }
}

@media screen and (max-width: 900px) {
  .obg {
    #title {
      font-size: 70px;
    }

    .areaSub {
      width: 65%;
      #subT {
        font-size: 2rem;
      }
    }

    .btn {
      width: 35%;
      font-size: 35px;
      margin-top: 65px;
    }
  }
}
@media screen and (max-width: 510px) {
  .obg {
    #title {
      font-size: 45px;
    }

    .areaSub {
      width: 75%;
      #subT {
        font-size: 1.5rem;
      }
    }

    .btn {
      width: 35%;
      height: 10%;
      font-size: 22px;
      margin-top: 50px;
    }
  }
}
</style>

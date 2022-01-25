<template>
  <div class="home">
    <link
      rel="styleshet"
      href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
    />
    <link
      rel="styleshet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"
    />
    <div class="container">
      <section class="main-section">
        <div class="content">
          <p class="titulo">Bem vindo a Pesquisa</p>
          <p class="titulo">de Satisfação</p>
          <p class="legenda">Dê seu feedback sobre a escola</p>
          <button class="btnred" @click="goToForm()">Acessar Formulário</button>
        </div>

        <img class="img" src="@/static/modelo.png" alt="" />
        <div class="inner"></div>
      </section>

      <section class="slides">
        <div class="slide1">
          <p class="perg">Como é feito o formulário?</p>
          <p class="info">
            Acessando o formulário, você irá se deparar com uma
          </p>
          <p class="info">lista de itens relacionados à escola, onde poderá</p>
          <p class="info">
            opinar sua satisfação sobre um determinado tópico e
          </p>
          <p class="info">se ele é relevante para a instituição.</p>
        </div>
        <div class="slide2">
          <p class="perg">Para que ele serve?</p>
          <p class="info">
            A Pesquisa de Satisfação é utilizada pela instituição
          </p>
          <p class="info">para se obter uma análise facilitada de como a</p>
          <p class="info">qualidade de ensino e a organização estrutural da</p>
          <p class="info">escola é vista pelos alunos.</p>
        </div>
        <div class="slide3">
          <p class="perg">Alguma dúvida?</p>
          <p class="info">
            Contate seu professor para mais informações sobre a plataforma!
          </p>
        </div>
      </section>
    </div>
    <div class="footer p-d-flex p-flex-row p-jc-between p-ai-center">
      <section
        class="
          footer-left
          p-d-flex p-flex-column p-jc-start p-ai-center p-text-center
        "
      >
        <img class="img-logo" src="@/static/senai-logo.png" alt="logo senai" />
        <div class="socials p-d-flex p-flex-row p-jc-center p-ai-center">
          <a
            target="_blank"
            href="https://pt-br.facebook.com/senairobertomange/"
            ><img class="icons" src="@/static/face.svg" alt="logo facebook"
          /></a>
          <a target="_blank" href="https://www.instagram.com/senaimange/"
            ><img class="icons" src="@/static/insta.svg" alt="logo instagram"
          /></a>
          <a
            target="_blank"
            href="https://br.linkedin.com/school/escola-senai-roberto-mange/"
            ><img class="icons" src="@/static/link.svg" alt="logo linkedin"
          /></a>
          <a target="_blank" href="https://twitter.com/SENAInacional"
            ><img class="icons" src="@/static/twit.svg" alt="logo twitter"
          /></a>
        </div>
        <p id="text_socials">Nos siga nas redes sociais e fique por</p>
        <p id="text_socials">dentro das novidades.</p>
      </section>
      <section class="footer-right p-d-flex p-flex-row p-jc-start p-ai-center">
        <section class="right-left p-d-flex p-flex-column p-jc-start p-ai-end">
          <li
            class="
              paginas
              p-d-flex p-flex-column p-jc-center p-ai-center p-text-center
            "
          >
            <h6 class="titulo">Menu:</h6>

            <ul class="box">
              <li><a href="#">Início</a></li>
              <li><a href="#">Tutorial</a></li>
              <li><a href="#">Contato</a></li>
            </ul>
            <p>&reg;RobertoMange</p>
          </li>
        </section>
        <section
          class="
            right-right
            p-d-flex p-flex-column p-jc-start p-ai-center p-text-center
          "
        >
          <li class="contato">
            <h6 class="titulo">E-mail:</h6>
            <a class="dados" href="mailto:senaicampinas@sp.senai.br"
              >senaicampinas@sp.senai.br</a
            >
            <h6 class="titulo">Fone:</h6>
            <a class="dados" href="tel:+551937721840">(19) 3772-1840</a>
          </li>
        </section>
      </section>
    </div>
  </div>
</template>
<script>
// @ is an alias to /src

export default {
  name: "Home",
  layout: "default",

  mounted() {
    function imgResizer() {
      let el = document.querySelector(".inner");
      // let position = el.getBoundingClientRect();
      let img = document.querySelector(".img");

      console.log("dimensions", el.clientWidth);

      if (el.clientWidth > 1000) {
        img.style.top = 657 - img.height + "px";
      } else if (el.clientWidth > 670) {
        img.style.top = 680 - img.height + "px";
      } else if (el.clientWidth > 400) {
        img.style.top = 580 - img.height + "px";
      } else {
        img.style.top = 555 - img.height + "px";
      }
    }

    window.onresize = imgResizer;

    imgResizer();
  },
  methods: {
    goToForm(){
      this.$router.push('formulario');
    }
  },
};
</script>


<style lang="scss" scoped>
.home {
  height: auto;
  width: 100vw;
  max-width: 100vw;

  .container {
    height: auto;
    width: 100vw;

    .main-section {
      height: calc(100vh - var(--height-default-header));
      max-height: 600px;
      width: 100%;
      max-width: 100%;
      overflow-y: hidden;

      .content {
        position: absolute;
        margin-top: 10vh;
        padding: 5vh 5vw;

        .titulo {
          font-size: 75px;
        }

        .legenda {
          font-size: 30px;
          margin-top: 10px;
        }

        .btnred {
          background-color: var(--red-background-color);
          height: 60px;
          width: 30vw;
          max-width: 400px;
          border-radius: 6px;
          color: var(--dark-text-color);
          font-size: 30px;
          margin-top: 30px;
          cursor: pointer;

          &:hover {
            transform: scale(1.04);
            transition: 1s;
          }
        }
      }
      .img {
        position: absolute;
        z-index: 100;
        height: 500px;
        max-height: 500px;
        width: 350px;
        max-width: 350px;
        right: 5%;
      }
      .inner {
        height: 100vh;
        background: var(--red-background-color);
        width: 100%;
        clip-path: polygon(15% 100%, 100% 50%, 100% 100%);
      }
    }

    .slides {
      color: white;
      background-size: auto;

      .perg {
        font-size: 75px;
        margin-bottom: 60px;
      }

      .info {
        font-size: 30px;
      }

      .slide1 {
        background-image: url("@/static/1.jpeg");
        height: 380px;
        padding: 70px;
        overflow-y: hidden;
      }

      .slide2 {
        background-image: url("@/static/2.jpeg");
        height: 380px;
        text-align: right;
        padding: 70px;
        overflow-y: hidden;
        color: black;
      }

      .slide3 {
        background-image: url("@/static/3.jpeg");
        height: 380px;
        padding: 70px;
        color: black;
      }
    }
  }

  .footer {
    color: white;
    height: 220px;
    width: 100%;
    background-color: #0e0e0f;

    .footer-left {
      width: 35%;
      height: 100%;
      overflow-y: hidden;

      .socials {
        width: 50%;
        max-width: 350px;
        .icons {
          height: 40px;
          margin-right: 10px;
          filter: invert(100%) sepia(0%) saturate(7440%) hue-rotate(336deg)
            brightness(108%) contrast(102%);

          &:hover {
            transform: scale(1.08);
          }
        }
      }

      .img-logo {
        --alturaImg: 50px;
        height: var(--alturaImg);
        width: calc(var(--alturaImg) * 3.92) px;
        margin-top: 25px;
        margin-bottom: 35px;
      }
    }

    .footer-right {
      width: 65%;
      height: 100%;
      overflow-y: hidden;

      li {
        list-style-type: none;
      }

      a {
        text-decoration: none;
        color: grey;

        &:hover {
          color: white;
        }
      }

      .right-left {
        width: 50%;
        height: 100%;
        // background-color: red;

        .paginas {
          padding: 20px 0px 0px 0px;
          // background-color: yellow;
          width: auto;
          .titulo {
            font-size: 28px;
            margin: 8px 0;
            // background-color: blue;
          }

          .box {
            // background-color: blueviolet;
            font-size: 18px;
            color: grey;
          }

          p {
            margin-top: 55px;
          }
        }
      }

      .right-right {
        width: 50%;
        height: 100%;
        // float: right;
        // background-color: #f33ff3;

        .contato {
          padding: 20px 0px 0px 0px;

          .titulo {
            font-size: 28px;
            margin: 8px 0;
            // background-color: blue;
          }
          .dados {
            font-size: 20px;
            color: grey;

            &:hover {
              color: white;
            }
          }
        }
      }
    }
  }
}

@media screen and (max-width: 1210px) {
  .home {
    .container {
      .main-section {
        .content {
          .titulo {
            font-size: 60px;
          }
          .legenda {
            font-size: 22px;
            margin-top: 7px;
          }

          .btnred {
            font-size: 23px;
          }
        }
        .img {
          height: 450px;
          width: 310px;
        }
      }
      .slides {
        .perg {
          font-size: 64px;
          margin-bottom: 50px;
        }

        .info {
          font-size: 25px;
        }
      }
    }
  }
}

@media screen and (max-width: 950px) {
  .home {
    .container {
      .main-section {
        .content {
          .titulo {
            font-size: 55px;
          }
          .btnred {
            font-size: 21px;
          }
        }
        .img {
          height: 400px;
          width: 270px;
        }
      }
      .slides {
        .perg {
          font-size: 52px;
          margin-bottom: 44px;
        }

        .info {
          font-size: 22px;
        }
      }
    }

    .footer {
      height: 207px;
      .footer-left {
        #text_socials {
          font-size: 15px;
        }
        .socials {
          width: 58%;
          .icons {
            height: 35px;
          }
        }

        .img-logo {
          --alturaImg: 45px;
          margin-bottom: 28px;
        }
      }

      .footer-right {
        .right-left {
          width: 45%;
          .paginas {
            .titulo {
              font-size: 25px;
            }

            .box {
              font-size: 16px;
            }
          }
        }

        .right-right {
          width: 55%;
          .contato {
            .titulo {
              font-size: 25px;
            }
            .dados {
              font-size: 16px;
            }
          }
        }
      }
    }
  }
}

@media screen and (max-width: 705px) {
  .home {
    .container {
      .slides {
        .slide1,
        .slide2,
        .slide3 {
          padding: 50px;
        }
        .perg {
          font-size: 43px;
          margin-bottom: 34px;
        }

        .info {
          font-size: 22px;
        }
      }
    }

    .footer {
      .footer-left {
        #text_socials {
          font-size: 13px;
        }
        .socials {
          width: 70%;
          .icons {
            height: 33px;
          }
        }

        .img-logo {
          --alturaImg: 40px;
        }
      }

      .footer-right {
        .right-left {
          .paginas {
            .titulo {
              font-size: 22px;
            }

            .box {
              font-size: 15px;
            }
            p {
              font-size: 14px;
            }
          }
        }

        .right-right {
          .contato {
            .titulo {
              font-size: 22px;
            }
            .dados {
              font-size: 15px;
            }
          }
        }
      }
    }
  }
}

@media screen and (max-width: 670px) {
  .home {
    .container {
      .main-section {
        max-height: 500px;
        .content {
          margin-top: 5vh;

          .titulo {
            font-size: 40px;
          }
          .legenda {
            font-size: 17px;
          }

          .btnred {
            font-size: 17px;
          }
        }

        .img {
          height: 350px;
          width: 250px;
        }
        .inner {
          clip-path: polygon(5% 100%, 100% 20%, 100% 100%);
        }
      }
    }

    .footer {
      height: 170px;
      .footer-left {
        #text_socials {
          font-size: 9px;
        }
        .socials {
          width: 70%;
          .icons {
            height: 26px;
          }
        }
        .img-logo {
          --alturaImg: 35px;
          margin-bottom: 14px;
        }
      }

      .footer-right {
        .right-left {
          .paginas {
            .titulo {
              font-size: 15px;
            }

            .box {
              font-size: 12px;

              li {
                margin-bottom: 5px;
              }
            }
            p {
              margin-top: 40px;
              font-size: 12px;
            }
          }
        }

        .right-right {
          .contato {
            .titulo {
              font-size: 15px;
            }
            .dados {
              font-size: 12px;
            }
          }
        }
      }
    }
  }
}

@media screen and (max-width: 530px) {
  .home {
    .footer {
      height: 150px;

      .footer-left {
        #text_socials {
          font-size: 8px;
        }
        .socials {
          width: 70%;
          .icons {
            height: 19px;
          }
        }

        .img-logo {
          --alturaImg: 25px;
          margin-bottom: 14px;
        }
      }

      .footer-right {
        .right-left {
          width: 30%;

          .paginas {
            .titulo {
              font-size: 12px;
            }
            p {
              font-size: 8px;
            }
            .box {
              font-size: 9px;
            }
          }
        }

        .right-right {
          width: 70%;
          .contato {
            .titulo {
              font-size: 12px;
            }
            .dados {
              font-size: 9px;
            }
          }
        }
      }
    }
  }
}

@media screen and (max-width: 530px) {
  .home {
    .container {
      .main-section {
        .content {
          margin-top: 3vh;

          .titulo {
            font-size: 37px;
          }
          .legenda {
            font-size: 16px;
          }
        }
        .img {
          height: 270px;
          width: 185px;
        }
      }

      .slides {
        .perg {
          font-size: 38px;
          margin-bottom: 32px;
        }

        .info {
          font-size: 18px;
        }
      }
    }
  }
}
</style>

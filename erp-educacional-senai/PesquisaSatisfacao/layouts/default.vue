<template>
  <div class="p-d-flex p-flex-column default-main">
    <div class="default-header p-d-flex p-flex-row p-jc-between p-ai-center">
      <div
        class="default-header-left p-d-flex p-flex-row p-jc-between p-ai-center"
      >
        <button
          class="pi pi-bars p-mr-2 p-ml-3 btn-leftbar normal-dark-btn"
          v-on:click="checkSideBarVisibility"
        ></button>

        <img
          class="p-mr-3"
          id="default-senai-logo"
          src="senai-logo.png"
          alt="Logo Senai"
        />
      </div>

      <div
        class="default-header-right p-d-flex p-flex-row p-jc-end p-ai-center"
      >
        <Profile
          v-if="profileLoaded"
          :user="actualUser"
          text_color="white"
          back_color="#313131"
        />
      </div>

      <Sidebar
        :visible.sync="visibleLeft"
        :dismissable="false"
        :baseZIndex="1000"
        :showCloseIcon="false"
        class="default-sidebar p-sidebar-md"
      >
        <div
          class="
            p-d-flex p-flex-column p-jc-center p-ai-center
            btnsidecontainer
          "
        >
          <div
            v-for="(btn, index) in sidebarMenuButtons"
            :key="index"
            class="p-d-flex p-flex-column p-jc-center p-ai-center"
          >
            <!-- btn.showButton -->
            <p v-if="btn.showButton" class="p-text-center default-sidebar-text">
              {{ btn.textLabel }}
            </p>
            <Button
              v-if="btn.showButton"
              :el="index"
              :icon="btn.iconBtn"
              iconPos="right"
              class="default-sidebar-btn p-mb-2 p-button-danger p-button-text"
              @click="checkSecondSideBarVisibility"
            />
          </div>
        </div>
      </Sidebar>

      <Sidebar
        v-for="(second_sidebar, index) in sidebarMenuButtons"
        :key="index"
        :visible.sync="sidebarMenuButtons[index].showSidebar"
        :dismissable="false"
        :baseZIndex="900"
        :showCloseIcon="false"
        :class="'default-second-sidebar-' + index + ' p-sidebar-md'"
      >
      </Sidebar>
    </div>
    <Nuxt />
  </div>
</template>

<script>
export default {
  name: "Default",
  data() {
    return {
      visibleLeft: false,
      sidebarMenuButtons: [
        {
          textLabel: "Recuar",
          iconBtn: "pi pi-arrow-circle-left",
          showButton: true,
          adminButton: false,
          showSidebar: false,
          hasSidebar: false,
          // sideButtons: [],
        },
        {
          textLabel: "Home",
          iconBtn: "pi pi-home",
          showButton: true,
          adminButton: false,
          showSidebar: false,
          hasSidebar: false,
          // sideButtons: [],
        },
        {
          textLabel: "Formulário",
          iconBtn: "pi pi-book",
          showButton: true,
          adminButton: false,
          showSidebar: false,
          hasSidebar: true,
          // sideButtons: [
          //   {
          //     textLabel: "Início",
          //     method: this.formButton_Start()
          //   },
          //   {
          //     textLabel: "Responder",
          //     method: this.formButton_Answer()
          //   },
          //   {
          //     textLabel: "Enviado",
          //     method: this.formButton_Sent()
          //   }
          // ]
        },
        {
          textLabel: "Painel",
          iconBtn: "pi pi-chart-line",
          showButton: this.$store.state.user.admin,
          adminButton: true,
          showSidebar: false,
          hasSidebar: false,
          //   sideButtons: [
          //     {
          //       textLabel: "Início",
          //       method: this.formButton_Start()
          //     },
          //     {
          //       textLabel: "Responder",
          //       method: this.formButton_Answer()
          //     },
          //     {
          //       textLabel: "Enviado",
          //       method: this.formButton_Sent()
          //     }
          //   ]
        },
        {
          textLabel: "Logout",
          iconBtn: "pi pi-sign-out",
          showButton: true,
          adminButton: false,
          showSidebar: false,
          hasSidebar: false,
        },
      ],
      actualUser: null,
      profileLoaded: false,
      actual_admin: false,
    };
  },
  mounted() {
    this.$store.dispatch("user/getUser").then((response) => {
      this.actualUser = response[0];
      this.actual_admin = this.actualUser.admin;
      this.$store.dispatch("user/setAdmin", this.actual_admin);

      this.reloadButtons();
      // console.log("vuex", this.$store.state.user.admin);
      // console.log("actual_admin",this.actual_admin);
      this.profileLoaded = true;
    });
    this.$store.dispatch("user/getDjangoUser");
  },
  methods: {
    reloadButtons() {
      console.log("reloading buttons....");
      for (let i = 0; i < this.sidebarMenuButtons.length; i++) {
        if (this.sidebarMenuButtons[i].adminButton == true) {
          this.sidebarMenuButtons[i].showButton = this.$store.state.user.admin;
        }
      }
    },
    resetSidebarMenu() {
      for (let i = 0; i < this.sidebarMenuButtons.length; i++) {
        this.sidebarMenuButtons[i].showSidebar = false;
      }
    },
    checkSideBarVisibility() {
      // console.log("s");
      // console.log(this.$store.state.user.admin);
      this.visibleLeft = !this.visibleLeft;

      if (this.visibleLeft === false) {
        this.resetSidebarMenu();
      }
    },
    checkSecondSideBarVisibility(element) {
      const el = element.target;
      let buttonNumber = parseInt(el.parentElement.getAttribute("el"));

      if (isNaN(buttonNumber)) buttonNumber = parseInt(el.getAttribute("el"));

      if (this.sidebarMenuButtons[buttonNumber].hasSidebar == true) {
        if (this.sidebarMenuButtons[buttonNumber].showSidebar == false) {
          this.resetSidebarMenu();
          this.sidebarMenuButtons[buttonNumber].showSidebar = true;
        } else {
          this.resetSidebarMenu();
        }
      }

      //logicall to each button
      switch (buttonNumber) {
        //button 0
        case 0:
          this.checkSideBarVisibility();
          break;
        //button 1
        case 1:
          // alert("Home...");
          this.$router.push("/");
          this.checkSideBarVisibility();
          break;

        case 3:
          this.$router.push("turmas");
          break;

        //button 4
        case 4:
          alert("Logout...");
          this.resetSidebarMenu();
          break;
      }
    },
  },
};
</script>

<style lang="scss">
@import "@/layouts/scss/reset.scss";

$sidebar_second_positions: 150px, 220px, 220px, 300px;

.default-main {
  width: 100vw;
  height: auto;
  min-height: 100vh;

  .default-header {
    height: var(--height-default-header);
    width: 100vw;
    background-color: var(--dark-background-color);

    .default-header-left {
      width: 20vw;
      min-width: 150px;
      max-width: 250px;
      height: 100%;

      .btn-leftbar {
        font-size: 25px;
        height: 100%;
        width: auto;
        padding: 10px;
      }

      #default-senai-logo {
        width: 60%;
        max-width: 150px;
        min-width: 110px;
        height: 60%;
        max-height: 38px;
        min-height: 28px;
        border-radius: 2px;
      }
    } //default-header-left

    .default-header-right {
      width: 15vw;
      min-width: 200px;
      max-width: 250px;
      height: 100%;
    } //default-header-right

    .default-sidebar {
      width: 8vw;
      min-width: 55px;
      max-width: 110px;
      height: calc(100% - var(--height-default-header));
      top: var(--height-default-header);
      color: white;
      background-color: var(--red-background-color);
      border-radius: 0px 10px 10px 0px;
      .p-sidebar-content {
        padding: 0;
      }

      .default-sidebar-btn {
        .p-button-icon {
          color: white;
          font-size: 25px;

          &:hover {
            color: var(--dark-text-color-hover);
            transform: scale(1.15);
          }
        }
        &:focus {
          .p-button-icon {
            // color: var(--red-background-color-hover);
            color: var(--dark-background-color);
            transform: scale(1.15);
          }
        }
      }
    } //default-sidebar

    $i: 0;

    @each $position in $sidebar_second_positions {
      .default-second-sidebar-#{$i} {
        border-radius: 15px;
        width: 15vw;
        min-width: 55px;
        max-width: 210px;
        // height: calc(100% - var(--height-default-header));
        height: 150px;
        top: $position;
        // top: var(--height-default-header);
        color: white;
        background-color: var(--dark-background-color);
      } //default-sidebar

      $i: $i + 1;
    }
  } //.default-header
}

.p-component-overlay {
  background-color: rgba(0, 0, 0, 0) !important;
}

@media screen and (max-width: 1290px) {
  .default-sidebar {
    .default-sidebar-text {
      font-size: 12px;
    }
  }
}

@media screen and (max-width: 1060px) {
  .default-sidebar {
    .default-sidebar-text {
      font-size: 10px;
    }
  }
}

@media screen and (max-width: 905px) {
  .default-sidebar {
    .default-sidebar-text {
      display: none;
    }
  }
}

@media screen and (max-width: 400px) {
  #default-senai-logo {
    display: none;
  }

  .default-main {
    .default-header {
      height: var(--height-default-header-mobile);
      .default-header-right {
        min-width: 100px;        
      } //default-header-right

      .default-sidebar {
        height: calc(100% - var(--height-default-header-mobile));
        top: var(--height-default-header-mobile);

        .default-sidebar-text {
          font-size: 15px;
        }
      }
    }
  }
}
</style>
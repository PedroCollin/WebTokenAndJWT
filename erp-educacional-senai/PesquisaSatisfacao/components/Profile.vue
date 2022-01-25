<template>
  <div
    class="profile-main p-d-flex p-flex-row p-jc-start p-ai-center p-pl-2"
    :style="cssCustom"
  >
    <div class="profile-btn flex-row">
      <Avatar :image="componentUser.img" size="xlarge" shape="circle" />
    </div>

    <p id="profile-name">
      <strong class="p-ml-2">{{ componentUser.firstname }}</strong>
    </p>

    <button
      class="normal-dark-btn pi pi-angle-down arrow-btn p-mr-2 p-ml-3"
    ></button>
  </div>
</template>

<script>
export default {
  name: "Profile",
  props: ["user", "text_color", "back_color"],
  data() {
    return {
      componentUser: this.user,
    };
  },
  computed: {
    cssCustom() {
      return {
        "--mycolor": this.text_color,
        "--myback": this.back_color,
      };
    },
  },
  methods: {
    
  },
};
</script>

<style lang="scss" scoped>
.profile-main {
  width: 95vw;
  height: 100%;
  background-color: var(--myback);
  

  .profile-btn {
    width: auto;
    height: 100%;
    padding: 0;
    cursor: pointer;
  }

  .arrow-btn {
    width: auto;
    height: 100%;
    padding: 5px;
  }

  p {
    width: auto;
    color: var(--mycolor);
  }
}

@media screen and (max-width: 400px) {
  .p-avatar-circle{
    width: 45px;
    height: 45px;
  }

  #profile-name{
    display: none;
  }
}
</style>
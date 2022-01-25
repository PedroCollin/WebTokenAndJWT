<template>
  <div class="p-d-flex p-flex-column default-main">
    <Nuxt/>
  </div>
</template>

<script>
export default {
  name: "layout_login",
};
</script>

<style lang="scss">
@import "@/layouts/scss/reset.scss";


.default-main {
  width: 100vw;
  height: auto;
  min-height: 100vh;
};
</style>
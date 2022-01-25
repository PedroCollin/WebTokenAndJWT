<template>
  <div class="popup">

    <transition name="fade" appear>
      <div class="modal-overlay" v-if="show"></div>
    </transition>

    <transition name="slide" appear>
      <div class="modal" v-if="show">

        <div :style="{ background: color }" v-if="!isLoading" class="header">
          <div class="content">
            <h4 v-if="!isSignature">Notificação</h4>
            <h4 v-else>Assinatura</h4>
            <i class="fas fa-times" @click="show=false"></i>
          </div>
        </div>

        <div class="content" :class="{'sign': isSignature}">
          <div v-if="isSignature">
            <SignatureField
              
              :signValues="signValues"
              myback="black"
              myBtnColor="red"
            />
          </div>
          <div v-else-if="!isLoading" class="text">
            <p v-if="!isError">Enviado com sucesso</p>
            <p v-else>Problema ao enviar</p>
          </div>
          
          <i v-else class="fas fa-circle-notch fa-spin"></i>
        </div>

      </div>
    </transition>

    <!-- <SignatureField
    myback="black"
    myBtnColor="red"
    /> -->

  </div>
</template>

<script>
export default {
  props: ['show', 'type', 'signValues'],
  data: function() {
    return {

    }
  },
  computed: {
    color: function() {
      if (this.type == 'success') {
        return '#65bb65'
      } else if (this.type == 'error') {
        return 'red'
      } else if (this.type == 'sign') {
        return 'darkgrey'
      } else { return 'black' }
    },
    isLoading: function() {
      return this.type === 'load'
    },
    isError: function() {
      return this.type === 'error'
    },
    isSignature: function() {
      return this.type === 'sign'
    },
  },
  created(){
    
  }
}
</script>

<style lang="scss" scoped>

.modal-overlay {
  position: fixed;
  top: 0; bottom: 0;
  left: 0; right: 0;

  z-index: 98;
  background: rgba(0, 0, 0, 0.3);
}

.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 99;


  background: #eee;
  min-width: 240px;
  border-radius: .3rem;

  .header {

    .content {
      display: flex;
      justify-content: space-between;
      flex-direction: row;
      font-size: 1.5rem;
      padding: 0.8rem .8em;
      font-weight: 200;
      border-top: 0.05rem solid rgb(0 0 0);
      border-left: 0.05rem solid rgba(0,0,0,0.52941);
      border-right: 0.05rem solid rgba(0,0,0,0.52941);

      i { cursor: pointer; }
    }
  }

  .content {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 3rem 0;
    font-size: 1.5rem;
    border: 0.05rem solid rgba(0,0,0,0.52941);
    &.sign {
      padding: 0;
    }
  }

  .fa-spin {
    font-size: 4rem;
  }

}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.slide-enter-active,
.slide-leave-active {
  transition: transform 0.5s;
}

.slide-enter,
.slide-leave-to {
  transform: translateY(-50%) translateX(100vw);
}
</style>

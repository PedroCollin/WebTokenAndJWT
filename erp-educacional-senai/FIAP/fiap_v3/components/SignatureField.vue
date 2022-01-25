<template>
  <div class="signBack" id="signBack">
    
    <div id="topo" :style="cssCustom">
      <div id="campo-canvas" v-if="newSign">
      
      <div class="btnsCanvas">
        <p class="btnLimpar" @click="limpa()">Limpar</p>
        <p class="btnSave" @click="putImage()">Concluir</p>
        
      </div>
      
    </div>
    <div v-else>
      <img :src="signImg" alt="assinatura">
    </div>

    </div>
  </div>
</template>

<script>
  export default {
    name: "Signature",
    props: ["myback", "myBtnColor","signValues"],
    computed: {
      cssCustom() {
        return {
          "--mycolor": this.mycolor,
          "--myBtnColor": this.myBtnColor,
        };
      },
    },
    data: function () {
        return {
            customPointer : "/assets/media/Hand1.png",
            newSign: true,
            signImg: '',
        }
    },
    methods: {
      limpa: function () {
        var d = document.getElementById("campo-canvas");
        var d_interno = document.getElementById("quadro");
        var noRemovido = d.removeChild(d_interno);
        this.plotCanvas("quadro");
      },
      plotCanvas: function (el) {
        var quadro = document.createElement("canvas");
        let item = document.getElementById("campo-canvas");
        let item2 = document.getElementById("signBack");
        const width = 460
        const height = 240
        quadro.id = el;
        quadro.style.backgroundColor = "beige";
        quadro.style.width = (width + 'px');
        quadro.style.height = (height + 'px');
        item.appendChild(quadro);

        var largura = (width + 'px');
        var altura = (height + 'px');

        var quadro = document.getElementById(el);

        quadro.setAttribute("width", largura);
        quadro.setAttribute("height", altura);
        
        var ctx = quadro.getContext("2d");
        
        var left = quadro.offsetLeft;
        var top = quadro.offsetTop;
        
        ctx.fillStyle = "black";

        var desenhando = false;

        ctx.lineWidth = width/900;
        ctx.lineTo((width/2)-140, height/2);
        ctx.lineTo((width/2)+140, height/2);
        ctx.stroke();

        ctx.font = '15px serif';
        ctx.fillText('Assinatura', 100, height/2 + 20);
        
        let positionCanvas = quadro.getBoundingClientRect();


        const cPointer = document.getElementById("customPointer");
        
        quadro.onmousedown = function (evt) {
          
          ctx.moveTo(evt.clientX + left*8 - ((window.innerWidth-width)/2), evt.clientY - top/2 + 32 -  ((window.innerHeight-height)/2));

          desenhando = true;
        };
        quadro.onmouseup = function () {
          desenhando = false;
        };
        // <div id="follow">
        //   <img :src="customPointer" alt="" class="customPointer" id="customPointer">
        // </div>
        // item.onmousemove = function(evt){
          
     
        //   cPointer.style.marginTop = evt.clientY - top/2 - ((window.innerHeight-height)/2) + "px" 
        //   cPointer.style.marginLeft = evt.clientX + left*8 - ((window.innerWidth-width)/2) + "px" 
        // }
        quadro.onmousemove = function (evt) {
          
          if (desenhando) {
         
            ctx.lineTo(evt.clientX + left*8 - ((window.innerWidth-width)/2), evt.clientY - top/2 + 32  -  ((window.innerHeight-height)/2));
            ctx.stroke();
          }
        };
      },
      putImage: function () {
        const width = 460
        const height = 240
        var canvas = document.getElementById("quadro");
        let item = document.getElementById("campo-canvas");
        var ctx = canvas.getContext("2d");
        let date = new Date();
        let CutDate = date.toString().substr(0,25);
        ctx.fillText(CutDate, width/2 - 30, height/2 + 20);
        //canvas.setAttribute("download", "ass.png");
        canvas.click();
        //"image/png"
        var image = canvas.toDataURL();
        const link = document.createElement("a");
    
    
        let el = document.getElementById(this.$props.signValues);
        el.value = image;
        el.dispatchEvent(new Event('input'));
        setTimeout(function() {
          el.value = "Assinado";
        }, 200)
        
        //link.href = image;
        //link.download = "assinatura";

        //document.body.appendChild(link);
        //link.click();
        //document.body.removeChild(link);
      },
    },
    mounted() {
      
      if(this.newSign){
        this.plotCanvas("quadro");
      }
      
    },
    
    created(){
      if(document.getElementById(this.$props.signValues).value === "Não Assinado"){
        this.newSign = true;
      }else{
        this.signImg = document.getElementById(this.$props.signValues).value;
        this.newSign = false;
      }
  
    }
  };
  
</script>

<style lang="scss" scoped>
  #follow{
  position:absolute;
  margin-left: 0;
  margin-right: 0;
  }
  .customPointer{
    width: 35px;
    
  }
  #topo {
    .line{
      position: absolute;
      width: 50%;
      height: .5%;
      color: white;
      transform: translate(50%, -50%);
      background-color: black;
    }
    #campo-canvas {
      pointer: none;
      width: 100%;
      height: 100%;
      justify-content: center;
      align-items: center;
      cursor: url('../static/assets/media/hand.png'), pointer;	
      #quadro {
        width: 100%;
        height: 100%;
        
      }

      .btnsCanvas {
        display: flex;
        flex-direction: row;

        .btnSave, .btnLimpar {
          cursor: pointer;
          display: flex;
          justify-content: center;
          align-items: center;
          width: 50%;
          border-bottom: 1px solid;
          height: 35px;
        }

        .btnLimpar {
          border-right: 1px solid;
        }
      }
    }
  }
</style>
<template>
  <div class="dropdown-wrapper">
    <div @click="changeVisible" class="selected-item">
      <input v-model="studentID" id="alunoIDver" type="text" placeholder="Aluno" style="display:none" disabled>
      <span v-if="selectedItem">{{ selectedItem.nome }}</span>
      <span v-else style="color: #757575;">Selecione o Aluno</span>
      <i v-if="isVisible" class="fas fa-angle-up"></i>
      <i v-if="!isVisible" class="fas fa-angle-down"></i>
    </div>
    <div v-if="isVisible" class="dropdown-popover">
      <input v-model="searchQuery" type="text" placeholder="Aluno">
      <span v-if="filteredUser.length === 0" class="not-found">Nenhum aluno encontrado</span>
      <div class="options">
        <ul>
          <li @click="selectItem(user)" v-for="(user, index) in filteredUser" :key="`user-${index}`">
            {{ user.nome }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props:['idUser'],
  data: function() {
    return {
      searchQuery: '',
      selectedItem: null,
      studentID: null,
      isVisible: false,
      users: []
    }
  },
  methods: {
    changeVisible: function() {
      this.isVisible = !this.isVisible
    },
    selectItem: function(user) {
      this.selectedItem = user;
      this.studentID = user.id;
      this.isVisible = false;
    }
  },
  computed: {
    filteredUser: function() {
      const query = this.searchQuery.toLowerCase()

      if ( this.searchQuery == "" ) {
        return this.users
      }

      return this.users.filter( ( user ) => {
          return Object.values(user).some( (word) => {
            return String(word).toLowerCase().includes(query)
          })
      })
    }
  }
  ,
  mounted: function() {
    fetch("http://localhost:8000/aluno/")
      .then( res => res.json() )
      .then( json => {
          this.users = json
      })

    
    if(this.$props.idUser !== undefined){
     
      fetch("http://localhost:8000/aluno/"+ this.$props.idUser + "/")
      .then( res => res.json() )
      .then( json => {
          
          this.selectItem(json) 
      })

    }
    
    

  },
  watch:{
    
  }
}
</script>

<style lang="scss" scoped>

  $border: 2px solid lightgray;

  .not-found {
    text-align: center;
    width: 100%;
    display: block;
    margin: 15px 0 3px 0;
  }

  .dropdown-wrapper {
    position: relative;

    .selected-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 1.2rem;
      cursor: pointer;
    }

    .dropdown-popover {
      position: absolute;
      border: $border;
      top: 28px;
      left: 0;
      right: 0;
      background: #fff;
      width: 100%;
      padding: 10px;
      z-index: 99;

      input {
        width: 100%;
        height: 30px;
        border: $border;
        font-size: 1rem;
        padding-left: 5px;
      }

      .options {
        width: 100%;

        ul {
          list-style: none;
          text-align: left;
          max-height: 180px;
          overflow-y: scroll;
          overflow-x: hidden;

          li {
            width: 100%;
            border-bottom: 1px solid lightgray;
            padding: 10px;
            background: #f1f1f1;
            cursor: pointer;
            font-size: 1rem;
            &:hover {
              background: #cc2929;
              color: #fff;
              font-weight: bold;
            }
          }
        }
      }
    }

}

</style>

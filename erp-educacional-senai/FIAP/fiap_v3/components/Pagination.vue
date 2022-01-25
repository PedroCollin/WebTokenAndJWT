<template>
  <div class="pagination">
    <div class="content-pag">
      <button
        class="item prev"
        @click="changePage(current - 2)"
      >
        &laquo;
      </button>
      <button
        v-for="(page, index) in pages"
        :key="page"
        class="item"
        :class="{ current: page === current }"
        @click="changePage(index + 1)"
      >
        {{ page-1 }}
      </button>
      <button class="item next" @click="changePage(current)">
        &raquo;
      </button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Pagination',
    props: {
      offset: {
        type: [String, Number],
        default: 0,
      },
      total: {
        type: [String, Number],
        required: true,
      },
      limit: {
        type: [String, Number],
        default: 4,
      },
      last_page: {
        type: [String, Number],
        default: 0,
      },
    },
    computed: {
      current() {
        return this.offset ? this.offset + 1 : 1;
      },
      totalPages: function() {
        return Math.ceil(this.total / this.limit)
      },
      pages() {
        const qty = this.totalPages;
        if (qty <= 1) return [1];
        return Array.from(Array(qty).keys(), (i) => i+2 );
      },
    },
    methods: {
      changePage(offset) {
        if (offset > this.totalPages) {
          offset = 1
        } else if ( offset < 1) {
          offset = this.totalPages
        }
        this.$emit('change-page', offset);
        
      },
    },
  };
</script>

<style lang="scss" scoped>
  .pagination {
    display: flex;
    justify-content: center;
  }

  .content-pag {
    display: flex;
    flex-direction: row;
    gap: 1rem;
  }

  .item {
    padding: .8rem 1.3rem;
    border-radius: .3rem;
    cursor: pointer;
  
    &.current {
      background: #E30613;
      color: #eee;
    }
  }


</style>
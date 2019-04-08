<template>
<div>
  <ul class="list-unstyled">
    <li v-for="comment in comments">
      <h2>
         content:{{comment.content}}
         status:{{comment.status}}
         author_id:{{comment.author_id}}
         post_id:{{comment.post_id}}
      </h2>
    </li>
  </ul>

</div>
</template>

<script charset="utf-8">
export default {
  data() {
    return {
      comments: {}
    };
  },

  created() {
    this.fetchData();
  },

  watch: {
    $route: "fetchData"
  },

  methods: {
    fetchData: function() {
      let id = this.$route.params.id;

      let req = $.getJSON(`/comments/`);
      req.done(data => {
        this.comments = data;
      });
    }
  }
};
</script>

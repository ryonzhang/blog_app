<template>
<div>
  <ul class="list-unstyled">
    <li v-for="post in posts">
      <h2>
        {{post.content}}
      </h2>
    </li>
  </ul>

</div>
</template>

<script charset="utf-8">
export default {
  data() {
    return {
      posts: {}
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

      let req = $.getJSON(`/posts/`);
      req.done(data => {
        this.posts = data;
      });
    }
  }
};
</script>

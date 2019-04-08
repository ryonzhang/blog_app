<template>
<div>
  <ul class="list-unstyled">
    <li v-for="user in users">
      <h2>
        {{user.username}} - {{user.password}}
      </h2>
    </li>
  </ul>

</div>
</template>

<script charset="utf-8">
export default {
  data() {
    return {
      users: {}
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

      let req = $.getJSON(`/users/`);
      req.done(data => {
        this.users = data;
      });
    }
  }
};
</script>

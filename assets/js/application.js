require("expose-loader?$!expose-loader?jQuery!jquery");
require("bootstrap-sass/assets/javascripts/bootstrap.js");

import Vue from "vue";
import VueRouter from "router";
Vue.use(VueRouter);

import UsersComponent from "./components/users.vue";
import PostsComponent from "./components/posts.vue";
import CommentsComponent from "./components/comments.vue";

const routes = [
  {path: "/posts/", component: PostsComponent, name: "showPosts"},
  {path: "/users/", component: UsersComponent, name: "showUser"},
  {path: "/comments/", component: CommentsComponent, name: "showComment"},
];


const router = new VueRouter({
  mode: "history",
  routes
});

const app = new Vue({
  router
}).$mount("#app");

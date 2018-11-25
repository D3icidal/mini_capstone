import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home.vue";
import ProductsShow from "./views/ProductsShow.vue";
import Contact from "./views/ContactUs.vue";
import Signup from "./views/Signup.vue";
import Login from "./views/Login.vue";
import Logout from "./views/Logout.vue";
import ProductsEdit from "./views/ProductsEdit.vue";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "home",
      component: Home
    },
    {
      path: "/contact",
      name: "contact",
      component: Contact
    },
    {
      path: "/products/:id",
      name: "productShow",
      component: ProductsShow
    },
    {
      path: "/products/:id/edit",
      name: "productEdit",
      component: ProductsEdit
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "about" */ "./views/About.vue")
    },
    {
      path: "/signup",
      name: "signup",
      component: Signup
    },
    { path: "/login", name: "login", component: Login },
    { path: "/logout", name: "logout", component: Logout }
  ]
});

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p v-for="product in products">{{ product.title }} {{ product.price }}</p>
  </div>
</template>

<style></style>

<script>
var axios = require("axios");
// import axios from 'axios'
export default {
  data: function() {
    return {
      message: "Welcome tasdgao Vue.js!",
      products: [],
      newProduct: {}
    };
  },
  created: function() {
    axios.get("http://localhost:3000/api/products").then(
      function(response) {
        console.log(response.data);
        this.products = response.data;
      }.bind(this)
    );
  },
  methods: {
    getProducts() {
      axios.post("http://localhost:3000/api/products").then(
        function(response) {
          console.log(response.data);
          this.product.push(response.data);
        }.bind(this)
      );
    }
  },
  computed: {}
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <!--
      <p v-for="product in products">{{ product.title }} {{ product.price }}</p>
    -->
    <div class="container">
      <br />
      <div class="row">
        <div class="col-sm-4" v-for="product in products">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">{{ product.name }}</h5>
              <p class="card-text">${{ product.price }}</p>
              <p class="card-text">DB ID: {{ product.id }}</p>
              <img v-bind:src="product.image_url" width="100px" />
              <p class="card-text">description: {{ product.description }}</p>
              <a
                v-bind:href="'/#/products/' + product.id"
                class="btn btn-primary"
                >See Item</a
              >
            </div>
          </div>
          <br />
        </div>
      </div>
    </div>
  </div>
</template>

<style></style>

<script>
var axios = require("axios");
// import axios from 'axios'
export default {
  data: function() {
    return {
      message: "Welcffome tasdgao Vue.js!",
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
    },
    submit: function() {
      var params = {
        title: this.name,
        price: this.price,
        description: this.description
      };
      axios
        .post("http://localhost:3000/api/products/", params)
        .then(response => {
          this.$router.push("/login");
        })
        .catch(error => {
          this.errors = error.response.data.errors;
        });
    }
  },
  computed: {}
};
</script>

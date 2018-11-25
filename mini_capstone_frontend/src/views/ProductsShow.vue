<template>
  <div class="home">
    <div class="col-sm-4">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Title: {{ product.title }}</h5>
          <p class="card-text">price: {{ product.total }}</p>
          <img v-bind:src="product.image_url" width="100px" />
          <p class="card-text">description: {{ product.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style></style>

<script>
var axios = require("axios");
export default {
  data: function() {
    return {
      message: "Welcome to Vue.js from the show componenentt",
      product: {}
    };
  },
  created: function() {
    console.log(this);
    axios
      .get("http://localhost:3000/api/products/" + this.$route.params.id)
      .then(response => {
        console.log(response.data);
        this.product = response.data;
      });
  },
  methods: {},
  computed: {}
};
</script>

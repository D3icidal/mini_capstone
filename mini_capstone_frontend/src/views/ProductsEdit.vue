<template>
  <div class="home">
    <div class="col-sm-4">
      <div class="card">
        <div class="card-body">
          <form v-on:submit.prevent="submit();">
            <h1>Edit product</h1>
            <div class="form-group">
              <label>name: {{ product.name }}</label>
              <input type="text" class="form-control" v-model="name" />
            </div>
            <div class="form-group">
              <label>price:</label>
              <input type="text" class="form-control" v-model="price" />
            </div>
            <div class="form-group">
              <label>description:</label>
              <input type="text" class="form-control" v-model="description" />
            </div>
            <input type="submit" class="btn btn-primary" value="Submit" />
          </form>
          <!--
            <h5 class="card-name">Title: {{ product.name }}</h5>
            <p class="card-text">price: {{ product.total }}</p>
            <img v-bind:src="product.image_url" width="100px" />
            <p class="card-text">desc: {{ product.desc }}</p>
          -->
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
      product: {},
      id: "",
      name: "",
      price: "",
      description: ""
    };
  },
  created: function() {
    axios
      .get("http://localhost:3000/api/products/" + this.$route.params.id)
      .then(response => {
        console.log(response.data);
        this.product = response.data;
        this.id = response.data.id;
        this.name = response.data.name;
        this.price = response.data.total;
        this.description = response.data.description;
      });
  },
  methods: {
    submit: function() {
      var params = {
        id: this.id,
        name: this.name,
        price: this.price,
        description: this.description
      };
      console.log("Trying to submit. . . Product:");
      console.log(this.id);
      console.log(this.name);
      console.log(this.description);
      axios
        .patch(
          "http://localhost:3000/api/products/" + this.$route.params.id,
          params
        )
        .then(response => {
          console.log(response.data);
          this.$router.push("/");
          // redirect to show
        });
    }
  },
  computed: {}
};
</script>

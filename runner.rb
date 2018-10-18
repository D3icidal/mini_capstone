require 'unirest'
# need to run 'gem install awesome_print' first
require 'awesome_print'
 # # index
# response = Unirest.get("http://localhost:3000/api/products/2")
#  ap response.body
 # # show
# response = Unirest.get("http://localhost:3000/api/recipes/2")
 # ap response.body

#  response = Unirest.post("http://localhost:3000/api/products",
#     parameters: {
#       name: "testposttv",
#       price: "$500"
#     }
# )
# ap response.body

 response_bad = Unirest.patch("http://localhost:3000/api/products/2",
    parameters: {
      name: "testposttv2",
      price: "$500",
      #description: "test description"
    }
)
ap response_bad.body

 response = Unirest.patch("http://localhost:3000/api/products/14",
    parameters: {
      name: "testposttv2",
      price: "$500",
      #description: "test description"
    }
)
ap response.body
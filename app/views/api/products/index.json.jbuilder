# json.title "index.json.jbuilder"
# json.message @products
# json.array! @products do |product|
#   json.id product.id
#   json.tax product.tax
#   json.total product.total
#   json.supplier product.supplier
# end

json.array! @products do |product|
  json.partial! "product.json.jbuilder" , product: product
end

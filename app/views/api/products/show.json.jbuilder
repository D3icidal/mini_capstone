  # json.id @product.id
  # json.name @product.name
  # json.price @product.price
  # json.tax @product.tax
  # json.total @product.total
  # json.supplier @product.supplier
json.partial! "product.json.jbuilder", product: @product
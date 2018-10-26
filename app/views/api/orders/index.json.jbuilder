json.array! @orders do |order|
  json.id order.id
  json.product order.product.name
  json.tax order.tax
  json.total order.total
end
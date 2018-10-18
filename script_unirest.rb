require 'unirest'
require 'tty-table'
response = Unirest.get("localhost:3000/api/all")
# p response_definitions.body[0]['text']
products = response.body
# p products

# table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]

table = TTY::Table.new ['Product','Price'], [[products[0].id, 'a2'], ['b1', 'b2']]

puts table.render(:ascii)
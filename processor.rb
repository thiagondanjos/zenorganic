# frozen_string_literal: true

require 'pry'
require 'pry-byebug'
require 'caxlsx'
require "csv"

price_list = CSV.open("lista_precos.csv", headers: :first_row).map(&:to_h)
file = File.open('pedidos.txt')
order_list = file.readlines.map(&:chomp)
headers = ['Nome do Cliente','Produto', 'Quantidade','Valor Unitário','Valor Total', 'Código']
rows = []
client = ''

order_list.each_with_index do |order, index|
  if  order == order_list[0] || order_list[index - 1 ] == ''
    client = order
  elsif !order.empty?
    order_data = order.split(" ",3)

    amount = order_data[0].to_i
    code = order_data[1].strip
    product = order_data[2]
    unit_value = 0
    total_value = 0

    price_list.each do |item|
      price_list_code = item["Código"].strip

      if code == price_list_code
        unit_value = item["Preço"].tr(',', '.').to_f
        total_value = unit_value * amount
      end
    end
  end

  if amount && product
    rows << [client, product,amount, unit_value, total_value, code ]
  end

  package = Axlsx::Package.new
  workbook = package.workbook

  workbook.add_worksheet(name: 'Pedidos') do |sheet|
    sheet.add_row headers
    rows.each do |row|
      sheet.add_row row
    end
  end

  package.serialize('pedidos.xlsx')
end



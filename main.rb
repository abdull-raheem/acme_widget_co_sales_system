require_relative './lib/product'
require_relative './lib/delivery_rules'
require_relative './lib/offer_rules'
require_relative './lib/basket'

# Define products
products = {
  'R01' => Product.new('R01', 'Red Widget', 32.95),
  'G01' => Product.new('G01', 'Green Widget', 24.95),
  'B01' => Product.new('B01', 'Blue Widget', 7.95)
}

# Define delivery rules
delivery_rules = DeliveryRules.new
delivery_rules.add_rule(0, 49.99, 4.95)
delivery_rules.add_rule(50, 89.99, 2.95)
delivery_rules.add_rule(90, Float::INFINITY, 0.0)

# Define offer rules
offer_rules = OfferRules.new
offer_rules.add_offer('R01') do |quantity, price|
  pairs = quantity / 2
  singles = quantity % 2
  (pairs * (price * 1.5)) + (singles * price)
end

# Initialize basket
basket = Basket.new(products, delivery_rules, offer_rules)

# Test cases
test_cases = [
  %w[B01 G01],
  %w[R01 R01],
  %w[R01 G01],
  %w[B01 B01 R01 R01 R01]
]

test_cases.each do |test|
  basket = Basket.new(products, delivery_rules, offer_rules)
  test.each { |product_code| basket.add(product_code) }
  puts "Basket Total: $#{'%.2f' % basket.total}"
end

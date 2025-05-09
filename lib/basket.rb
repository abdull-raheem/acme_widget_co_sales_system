class Basket
  attr_reader :items

  def initialize(products, delivery_rules, offer_rules)
    @products = products
    @delivery_rules = delivery_rules
    @offer_rules = offer_rules
    @items = Hash.new(0)
  end

  def add(product_code)
    raise ArgumentError, "Invalid product code: #{product_code}" unless @products.key?(product_code)

    @items[product_code] += 1
  end

  def total
    total_items_price = calculate_discounted_price
    delivery_cost = @delivery_rules.calculate(total_items_price)
    (total_items_price + delivery_cost).round(2)
  end

  private

  def calculate_discounted_price
    @offer_rules.apply(@items, @products).values.sum
  end
end

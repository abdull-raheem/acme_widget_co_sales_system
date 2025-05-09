class OfferRules
  def initialize
    @offers = {}
  end

  def add_offer(product_code, &block)
    @offers[product_code] = block
  end

  def apply(items, products)
    adjusted_prices = {}

    items.each do |product_code, quantity|
      if @offers.key?(product_code)
        adjusted_prices[product_code] = @offers[product_code].call(quantity, products[product_code].price)
      else
        adjusted_prices[product_code] = quantity * products[product_code].price
      end
    end

    adjusted_prices
  end
end

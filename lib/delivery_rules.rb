class DeliveryRules
  def initialize
    @rules = []
  end

  def add_rule(min_price, max_price, cost)
    @rules << { range: (min_price..max_price), cost: cost }
  end

  def calculate(total_price)
    @rules.find { |rule| rule[:range].include?(total_price) }&.dig(:cost) || 0.0
  end
end

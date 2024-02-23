#typed: false

def stock_picker(stock_prices)
  # Define variables
  max_profit = 0
  profit = 0
  best_buy = 0
  best_sell = 0

  stock_prices.each_with_index do |buy_price, buy_day|
    # We need a nested loop inside of here to compare each possible
    # pair of buy and sell days.
    ((buy_day + 1)...stock_prices.length).each do |sell_day|
      sell_price = stock_prices[sell_day]
      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit
        best_buy = buy_day
        best_sell = sell_day
      end
    end
  end
  return [best_buy, best_sell]
end

puts stock_picker([24,12,7,87,14,90,12]).inspect
puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
puts stock_picker([10,20,30,40,50]).inspect

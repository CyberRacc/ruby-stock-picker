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

    # Start nested loop at the buy_day + 1 so we can only sell after
    # we buy. A range between that and the total length of the array
    # using an inclusive range.
    ((buy_day + 1)...stock_prices.length).each do |sell_day|
      sell_price = stock_prices[sell_day]
      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit # Update the max profit to the new highest
        best_buy = buy_day # this will repeat until the loop ends
        best_sell = sell_day # by then it will have found the best days with highest profit.
      end
    end
  end
  return [best_buy, best_sell]
end

puts stock_picker([24,12,7,87,14,90,12]).inspect
puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
puts stock_picker([10,20,30,40,50]).inspect

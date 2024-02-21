# typed: false

def stock_picker(stock_prices)
    # Initialize variables to track the maximum profit and the best days to buy and sell.
    max_profit = 0
    buy_day = 0
    sell_day = 0

    # Iterate through each day's price to consider it as a potential buy day.
    stock_prices.each_with_index do |buy_price, buy_index|
      # Start a nested loop from the day after the current buy day to the end of the array.
      # This ensures we only consider selling after we've bought.
      ((buy_index + 1)...stock_prices.length).each do |sell_index|
        sell_price = stock_prices[sell_index]  # Get the selling price for the current sell day.

        # Calculate the profit for this buy-sell pair.
        profit = sell_price - buy_price

        # If this profit is greater than the max profit found so far, update max_profit
        # and the best days to buy and sell.
        if profit > max_profit
          max_profit = profit  # Update the maximum profit.
          buy_day = buy_index  # Update the best day to buy.
          sell_day = sell_index  # Update the best day to sell.
        end
      end
    end

    # Return the best buy and sell days after examining all possibilities.
    return [buy_day, sell_day]
  end

  # Test the method with provided examples.
  # The result should be [1, 4] for a profit of $15 - $3 == $12.
  # The result should be [0, 5] for a profit of $90 - $7 == $83.
  # We're using inspect to display the array as a string for better readability.
  puts stock_picker([24,12,7,87,14,90,12]).inspect
  puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect

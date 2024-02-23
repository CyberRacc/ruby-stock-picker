# typed: true

# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell.
# Days start at 0.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12

# Quick Tips:

#     You need to buy before you can sell
#     Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.


def stock_picker(stock_prices)
    # stock_prices is an array of stock prices
    # Create a buy-sell pair, returned as an array
    # Left side of the final array is the best day to buy, the right side is the best day to sell,
    # Each index in the stock_prices array will represent the days as they start at 0. We're ignoring weeks for now.

    #

    stock_prices.each_with_index do |stock_price, index|
        # Best stock price to buy on is the earliest low value, we can maybe use the .all? predicate method here.
        # Check the current stock_price against the future stock prices.
        # Use the current index to define when to start looking from, (the index represents the day)

        highest_stock_price = stock_prices[index]
    end
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12

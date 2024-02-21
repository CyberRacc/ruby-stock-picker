# Notes & Difficulties

## Understanding the Task

I need to create a `stock_picker` method that will return an array with two values. The first value being the best day to by and the second being the best day to sell.

```rb
def stock_picker(stock_prices)
	# From the stock_prices array.
	# Work out the best day to buy and the best day to
	# sell, then push them to a new array.
end

puts stock_picker([24,12,7,87,14,90,12])

```

In this line `puts stock_picker([24,12,7,87,14,90,12])` we can see the stock prices that may get passed into the method. Each index in the array represents a day, the first day is `0` which has a stock price of `24`. The third day is at index `2` with a value of `7`.

Just from looking at the stock prices from the above example, we can tell that the best time to buy is on day 2 (**index `2`**) for 7, and the best day to sell would be day 5 (**index `5`**) for 90. So the answer should be `#=> [2,5]`.

So we need to figure this out within the method and return the same thing.

This is where the complication lies, because *we cannot simply check for the highest value, then check for the lowest value, as it may return the best day to sell as a day before the best day to buy*, which won't work because then you're trying to buy stock, then time travel some number of days into the past, to sell, which is not what we want here.

In vague steps:
- Iterate over the `stock_prices` array.
- Determine the best day to buy.
- Once you have the best day to buy you could have a condition to check that the best day to sell can only be an index higher than the best buy day.
	- For this we may be able to set a variable of `best_buy_day = stock_prices[2]`
	- Then have a check when determining the best day to sell like: *if the value of the current best sell date is equal to or less than `best_buy_day`, don't set this to the `best_sell_date`, the next lowest value will be the `best_sell_date`*.

Let's break down the logic and purpose behind using nested loops in the `stock_picker` method, step by step. 
### The Problem to Solve

You need to find the best days to buy and sell stock to maximize profit, given a series of daily prices. The key constraints are:
- You must buy before you sell.
- You want to maximize the difference (profit) between the buying and selling prices.

### Why Nested Loops?

The reason for using nested loops is to compare every possible pair of buy and sell days. This is necessary because:
- The best day to buy is not necessarily the day with the lowest price, nor is the best day to sell necessarily the day with the highest price. It's the combination of buy and sell days that gives you the highest profit.
- You need to examine every possible combination of days to ensure you find the one that offers the maximum profit.

### Breaking Down the Logic

1. **Outer Loop - Choosing a Buy Day:**
   - The outer loop iterates through each day in the `stock_prices` array, considering each day as a potential day to buy stock.
   - For each potential buy day, you need to compare it with every possible sell day that comes after it.

2. **Inner Loop - Choosing a Sell Day:**
   - The inner loop starts from the day after the current buy day (`buy_index + 1`) and goes to the end of the array.
   - This loop considers each of these days as a potential sell day for the stock bought on the current buy day.
   - By starting the inner loop at `buy_index + 1`, you enforce the rule that you can only sell after you've bought.

3. **Profit Calculation and Comparison:**
   - Within the inner loop, for each buy-sell pair, you calculate the profit (`sell_price - buy_price`).
   - If this profit is greater than any previously recorded `max_profit`, you update `max_profit` along with the corresponding `buy_day` and `sell_day`. This ensures that by the end of the loops, you've found the buy-sell pair that offers the maximum profit.

### The Purpose of Nested Loops

- The nested loops allow you to systematically explore every "buy day" and "sell day" pair. This brute-force approach ensures you don't miss any combination that could potentially yield the highest profit.
- While this might not be the most efficient method for very large arrays (due to its O(n^2) time complexity), it's a straightforward and reliable way to find the correct answer for the problem at hand.

### Understanding Through a Simplified Example

Imagine you have stock prices over four days: `[10, 7, 5, 8]`. The best day to buy is Day 2 (price = 5), and the best day to sell is Day 3 (price = 8), for a profit of 3.

- **Day 1 (buy)**: You compare selling on Days 2, 3, and 4.
- **Day 2 (buy)**: You compare selling on Days 3 and 4.
- **Day 3 (buy)**: You compare selling on Day 4.

Without checking every possible buy-sell combination, you might incorrectly assume buying on Day 1 and selling on Day 4 is best, missing out on the optimal buy on Day 2 and sell on Day 3 scenario.

### Conclusion

The nested loop structure is essential for exhaustively comparing all possible buy and sell day combinations to find the one that maximizes profit, adhering to the constraint that selling must occur after buying.
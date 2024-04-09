def stock_picker(arr)

  profit_hash = Hash.new

  arr.each_with_index do |buying_price, buying_day|
    arr.each_with_index do |selling_price, selling_day|
      if selling_price > buying_price && selling_day > buying_day
        profit_hash[selling_price - buying_price] = [buying_day, selling_day]
      end
    end
  end
  
  most_profit = profit_hash.keys.sort.last
  p profit_hash[most_profit]
end

stock_picker([17,3,6,9,15,8,6,1,10])
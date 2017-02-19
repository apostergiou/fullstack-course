The overall goal of this assignment is to manipulate collections to derive a result.

```ruby
# Grab 23 random elements between 0 and 10000
arr = (1..10000).to_a.sample(23)
p arr

#=> [61, 6969, 9885, 4722, 158, 9979, 4568, 3079, 2590, 2345, 9086, 9611, 1384, 8444, 7815, 5444, 4852, 1317, 1565, 8466, 7220, 5146, 4558]

# This selects only elements that when divided by 3 have a remainder of 0 
# using the % (modulus) operator
p arr.select { |element| element % 3 == 0 }

#=> [6969, 9885, 4722, 7815, 1317, 8466]
```

Write a single chain of commands to find all numbers that

* are from an array of numbers 1..10000 inclusive
* are divisible by 3 (i.e., element % 3 == 0)
* are not less than 5000
* sorted in reverse order

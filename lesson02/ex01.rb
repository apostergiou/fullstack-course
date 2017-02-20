data = (1..10_000)

p data.select { |n| (n % 3).zero? }.reject { |n| n < 5000 }.sort.reverse

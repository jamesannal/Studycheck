require_relative( '../models/animal')
require_relative( '../models/study')
require('pry')

animal1 = Animal.new({
  'age' => 12,
  'breed' => "cat",
  'date_arrived' => "2016/12/10"
})

animal1.save

animal2 = Animal.new({
  'age' => 4,
  'breed' => "monkey",
  'date_arrived' => "2016/12/11"
})
animal2.save

binding.pry
nil
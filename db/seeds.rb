require_relative( '../models/animal')
require_relative( '../models/study')
require('pry')

animal1 = Animal.new({
  'age' => 12,
  'species' => "cat",
  'date_arrived' => "2016/12/10",
  'health_status' => "okay"
})

animal1.save

animal2 = Animal.new({
  'age' => 4,
  'species' => "monkey",
  'date_arrived' => "2016/12/11",
  'health_status' => "good"
})
animal2.save

animal3 = Animal.new({
  'age' => 20,
  'species' => "cat",
  'date_arrived' => "2016/9/10",
  'health_status' => "poor"
})

animal3.save

binding.pry
nil
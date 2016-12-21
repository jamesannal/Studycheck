require_relative( '../models/animal')
require_relative( '../models/study')
require_relative( '../models/assign')
require('pry')

animal1 = Animal.new({
  'age' => 12,
  'species' => "cat",
  'date_arrived' => "2016/12/10",
  'study_availability' => "unhealthy"
})

animal1.save

animal2 = Animal.new({
  'age' => 4,
  'species' => "monkey",
  'date_arrived' => "2016/12/11",
  'study_availability' => "healthy"
})
animal2.save

animal3 = Animal.new({
  'age' => 20,
  'species' => "cat",
  'date_arrived' => "2016/9/10",
  'study_availability' => "healthy"
})
animal3.save

animal4 = Animal.new({
  'age' => 1,
  'species' => "mouse",
  'date_arrived' => "2016/3/23",
  'study_availability' => "healthy"
})
animal4.save

animal5 = Animal.new({
  'age' => 4,
  'species' => "rat",
  'date_arrived' => "2016/5/23",
  'study_availability' => "healthy"
})
animal4.save

study1 = Study.new({
  'sd' => "none",
  'purpose' => "not assigned"
  })
study1.save

study2 = Study.new({
  'sd' => "Bob",
  'purpose' => "can cats do algebra?"
  })
study2.save

study3 = Study.new({
  'sd' => "Jeff",
  'purpose' => "can a monkey learn to code?"
  })
study3.save

study4 = Study.new({
  'sd' => "James",
  "purpose" => "what dress best accentuates a rats figure?"
  })
study4.save

assignment1 = Assign.new({
  'study_id' => study1.id,
  'animal_id' => animal3.id
  })
assignment1.save

assignment2 = Assign.new({
  'study_id' => study1.id,
  'animal_id' => animal1.id
  })
assignment2.save

assignment3 = Assign.new({
  'study_id' => study2.id,
  'animal_id' => animal2.id
  })
assignment3.save

binding.pry
nil
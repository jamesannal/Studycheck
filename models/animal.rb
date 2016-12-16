require_relative( '../db/sql_runner')

class Animal
  attr_reader( :id, :age, :breed, :date_arrived )


  def initialize(options)
    @id = nil || options['id'].to_i
    @age = options['age']
    @breed = options['breed']
    @date_arrived = options['date_arrived']
  end

  def save
   sql = "INSERT INTO animals (age, breed, date_arrived) VALUES (#{@age}, '#{@breed}', '#{@date_arrived}') RETURNING *" 
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end
end
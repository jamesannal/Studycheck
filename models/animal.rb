require_relative( '../db/sql_runner')

class Animal
  attr_reader( :id, :age, :species, :date_arrived, :health_status )


  def initialize(options)
    @id = nil || options['id'].to_i
    @age = options['age']
    @species = options['species']
    @date_arrived = options['date_arrived']
    @health_status = options['health_status']
  end

  def save
   sql = "INSERT INTO animals (age, species, date_arrived, health_status) VALUES (#{@age}, '#{@species}', '#{@date_arrived}', '#{@health_status}') RETURNING *" 
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end
end
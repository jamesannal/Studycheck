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

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id=#{id}"
    animal = SqlRunner.run( sql )
    result = Animal.new( animal.first )
    return result
  end

  def self.passable_health()
    sql = "SELECT * FROM animals WHERE health_status!='poor'"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end

  def self.poor_health()
    sql = "SELECT * FROM animals WHERE health_status='poor'"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end
end
require_relative('../db/sql_runner')

class Assign

  attr_reader( :id, :study_id, :animal_id )

  def initialize(options)
    @id = nil || options['id'].to_i
    @study_id = options['study_id']
    @animal_id = options['animal_id']
  end

  def save()
    sql = "INSERT INTO assigning ( study_id, animal_id) VALUES (#{@study_id},#{@animal_id}) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM assigning"
    results = SqlRunner.run(sql)
    return results.map {|assignment| Assign.new( assignment)}
  end

  def study()
    sql = "SELECT * FROM studies s
          INNER JOIN assigning a
          ON a.study_id = s.id
          WHERE s.id = #{@study_id}"
    results = SqlRunner.run( sql )
    return Study.new( results.first )
  end

  def animal()
    sql = "SELECT * FROM animals an
          INNER JOIN assigning a
          ON a.animal_id = an.id
          WHERE an.id = #{@animal_id}"
    results = SqlRunner.run(sql)
    return Animal.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM assigning"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM assigning where id = #{id}"
    SqlRunner.run(sql)
  end
end
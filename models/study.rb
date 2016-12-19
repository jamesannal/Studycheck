require_relative( '../db/sql_runner')

class Study
  attr_reader( :id )
  attr_accessor( :sd, :purpose )

  def initialize(options)
    @id = nil || options['id'].to_i
    @sd = options['sd']
    @purpose = options['purpose']
  end

  def save()
    sql = "INSERT INTO studies (sd, purpose) VALUES ( '#{@sd}', '#{@purpose}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM studies"
    results = SqlRunner.run(sql)
    return results.map { |study| Study.new( study)}
  end

  def self.find( id )
    sql = "SELECT * FROM studies WHERE id=#{id}"
    results = SqlRunner.run(sql)
    return Study.new( results.first)
  end

  def self.delete_all
    sql = "DELETE FROM studies"
    SqlRunner.run(sql)
  end

  def self.update( options )
    sql = "UPDATE studies SET 
    sd = '#{options['sd']}',
    purpose = '#{options['purpose']}'
    WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM studies WHERE id=#{id}"
    SqlRunner.run( sql )
  end

end
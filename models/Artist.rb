require_relative('../db/SqlRunner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    result = artists.map() {|artist| Artist.new(artist)}
    return result
  end

  def artist
    sql = "Select * FROM artists WHERE id = #{@id};"
    results = SqlRunner.run(sql)
    result = results.map {|artist| Artist.new(artist)}
    return result.first
  end

  def update()
    sql = "UPDATE artists SET name = '#{@name}' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)}
    return result
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

end
require_relative('../db/SqlRunner')

class Album

  attr_reader :id, :artist_id

  attr_accessor :title, :genre

  def initialize(options)

    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i if options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) returning *"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)
    }
    return result
  end

  def album()
    sql = "SELECT * FROM albums WHERE id = #{@id};"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)}
    return result.first
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{artist_id};"
    artists = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist)}
    return result.first
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{id};"
    SqlRunner.run(sql)
  end

end
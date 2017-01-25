require('pry-byebug')
require_relative('../models/Artist')
require_relative('../models/Album')

Album.delete_all()
Artist.delete_all()

led_zep = Artist.new({'name' => 'Led Zeppelin'})
del_amitri = Artist.new({'name' => 'Del Amitri'})
count_crow = Artist.new({'name' => 'Counting Crows'})

led_zep.save()
del_amitri.save()
count_crow.save()

led_zep_1 = Album.new({'title' => 'Physical Graffiti', 'genre' => 'Rock', 'artist_id' => led_zep.id})

led_zep_2 = Album.new({'title' => 'Led Zeppelin 4', 'genre' => 'Rock', 'artist_id' => led_zep.id})

del_amitri_1 = Album.new({'title' => 'Change Everything', 'genre' => 'Indie/Rock', 'artist_id' => del_amitri.id})

del_amitri_2 = Album.new({'title' => 'Twisted', 'genre' => 'Indie/Rock', 'artist_id' => del_amitri.id})

count_crow_1 = Album.new({'title' => 'August and Everything After', 'genre' => 'Rock/Blues', 'artist_id' => count_crow.id})

count_crow_2 = Album.new({'title' => 'Accross a wire', 'genre' => 'Rock/Live', 'artist_id' => count_crow.id})

led_zep_1.save()
led_zep_2.save()
del_amitri_1.save()
del_amitri_2.save()
count_crow_1.save()
count_crow_2.save()
binding.pry

nil
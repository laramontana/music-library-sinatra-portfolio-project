the_strokes = Artist.create(name: "The Strokes", user_id: 1)
gorillaz = Artist.create(name: "Gorillaz", user_id: 1)

Song.create(name: "Last Nite", artist_id: the_strokes.id)
Song.create(name: "12:51", artist_id: the_strokes.id)
Song.create(name: "Hard to Explain", artist_id: the_strokes.id)

Song.create(name: "DARE", artist_id: gorillaz.id)
Song.create(name: "Stylo", artist_id: gorillaz.id)
Song.create(name: "Andromeda", artist_id: gorillaz.id)

Song.create(name: "Matilda", artist_id: 1)

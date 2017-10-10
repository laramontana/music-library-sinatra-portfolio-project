the_strokes = Artist.create(name: "The Strokes", user_id: 1)
gorillaz = Artist.create(name: "Gorillaz", user_id: 1)

Song.create(name: "Last Nite", artist_id: the_strokes.id)
Song.create(name: "12:51", artist_id: the_strokes.id)
Song.create(name: "Hard to Explain", artist_id: the_strokes.id)

Song.create(name: "DARE", artist_id: gorillaz.id)
Song.create(name: "Stylo", artist_id: gorillaz.id)
Song.create(name: "Andromeda", artist_id: gorillaz.id)

Song.create(name: "Matilda", artist_id: 1)

dr = Artist.create(name: "Dune rats", user_id: 2)
killers = Artist.create(name: "The Killers", user_id: 2)
pond = Artist.create(name: "Pond", user_id: 2)

Song.create(name: "Scott Green", artist_id: dr.id)
Song.create(name: "Braindead", artist_id: dr.id)
Song.create(name: "6 Pack", artist_id: dr.id)

Song.create(name: "Mr. Brightside", artist_id: killers.id)
Song.create(name: "Human", artist_id: killers.id)
Song.create(name: "When we were young", artist_id: killers.id)

Song.create(name: "Paint me silver", artist_id: pond.id)
Song.create(name: "Zond", artist_id: pond.id)
Song.create(name: "Holding Out for You", artist_id: pond.id)

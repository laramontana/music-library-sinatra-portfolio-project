the_strokes = Artist.create(name: "The Strokes")
gorillaz = Artist.create(name: "Gorillaz")
dune_rates = Artist.create(name: "Dune rats")
killers = Artist.create(name: "The Killers")
pond = Artist.create(name: "Pond")
arcade_fire = Artist.create(name: "Arcade Fire")

Song.create(name: "Last Nite", artist_id: the_strokes.id, user_id: 1)
Song.create(name: "12:51", artist_id: the_strokes.id, user_id: 2)

Song.create(name: "DARE", artist_id: gorillaz.id, user_id: 1)
Song.create(name: "Stylo", artist_id: gorillaz.id, user_id: 2)

Song.create(name: "Scott Green", artist_id: dune_rates.id, user_id: 1)
Song.create(name: "Braindead", artist_id: dune_rates.id, user_id: 2)

Song.create(name: "Mr. Brightside", artist_id: killers.id, user_id: 1)
Song.create(name: "Human", artist_id: killers.id, user_id: 2)

Song.create(name: "Paint me silver", artist_id: pond.id, user_id: 1)
Song.create(name: "Holding Out for You", artist_id: pond.id, user_id: 2)

Song.create(name: "Reflektor", artist_id: arcade_fire.id, user_id: 1)
Song.create(name: "Wake up", artist_id: arcade_fire.id, user_id: 2)

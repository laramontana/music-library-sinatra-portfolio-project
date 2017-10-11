the_strokes = Artist.create(name: "The Strokes")
gorillaz = Artist.create(name: "Gorillaz")
dune_rates = Artist.create(name: "Dune rats")
killers = Artist.create(name: "The Killers")
pond = Artist.create(name: "Pond")
arcade_fire = Artist.create(name: "Arcade Fire")

alexa = User.create(username: "Alexa", password: 111111)
bob = User.create(username: "Bob", password: 222222)

Song.create(name: "Last Nite", artist: the_strokes, user: alexa)
Song.create(name: "12:51", artist: the_strokes, user: bob)

Song.create(name: "DARE", artist: gorillaz, user: alexa)
Song.create(name: "Stylo", artist: gorillaz, user: bob)

Song.create(name: "Scott Green", artist: dune_rates, user: alexa)
Song.create(name: "Braindead", artist: dune_rates, user: bob)

Song.create(name: "Mr. Brightside", artist: killers, user: alexa)
Song.create(name: "Human", artist: killers, user: bob)

Song.create(name: "Paint me silver", artist: pond, user: alexa)
Song.create(name: "Holding Out for You", artist: pond, user: bob)

Song.create(name: "Reflektor", artist: arcade_fire, user: alexa)
Song.create(name: "Wake up", artist: arcade_fire, user: bob)

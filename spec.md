# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (gem 'sinatra' is required in Gemfile)
- [x] Use ActiveRecord for storing information in a database (gem 'activerecord' is required in Gemfile)
- [x] Include more than one model class (User, Song, Artist)
- [x] Include at least one has_many relationship (User has_many Artists, Artists has_many Songs, User has_many Songs through: Artists)
- [x] Include user accounts (User has to be signed up and logged in to see any content of the app)
- [x] Ensure that users can't modify content created by other users (User can edit and delete only songs they created)
- [x] Include user input validations (User cannot submit the form with empty fields)
- [x] Display validation failures to user with error message (/index; /songs/index; songs/:slug; songs/:slug/edit; /songs/new; /artists/:slug/add_song)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

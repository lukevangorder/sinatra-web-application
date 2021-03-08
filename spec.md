# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
This app was built using Sinatra to navigate pathways found in application_controller.rb, which inherits from Sinatra::Base
- [x] Use ActiveRecord for storing information in a database
This project uses models which each inherit from ActiveRecord::Base[4.2] and migrations inheriting from ActiveRecord::Migration[4.2] to build its database
- [x] Include more than one model class (e.g. User, Post, Category)
This prject has the User class, and the Post and Message classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
User class has_many Posts and Messages
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
Posts and Messages both belong to a User
- [x] Include user accounts with unique login attribute (username or email)
User signs up with username and email and can log in with either
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Users can create, read, update and delete posts and can create and read messages
- [x] Ensure that users can't modify content created by other users
Users are not given the option to edit other user's posts
- [x] Include user input validations
Bad user input that does not meet criteria cannot be persisted to database
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Includes description, install instructions and license

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
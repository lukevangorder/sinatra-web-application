User.delete_all
Post.delete_all
Message.delete_all

User.create(:email => "dan@aol.com", :username => "DanTheMan", :password => "password") #1
User.create(:email => "randyemail@gmail.com", :username => "RandyJenkins", :password => "password") #2
User.create(:email => "raddude@yahoo.net", :username => "CoolGuy69", :password => "password") #3
User.create(:email => "blazeit@us.gov", :username => "Beotch420", :password => "password") #4
User.create(:email => "zazzie@gmail.com", :username => "Zazema44", :password => "password") #5
User.create(:email => "hatman@flatiron.edu", :username => "ManInHat", :password => "password") #6
User.create(:email => "fatcat@gmail.com", :username => "TheFatCat", :password => "password") #7

Post.create(:content => "Wow, this web application sure is neat and was probably made by a very cool dude",:posted_at => Time.now, :user_id => 2)
Post.create(:content => "Where is the delete account button?",:posted_at => Time.now, :user_id => 3)
Post.create(:content => "Poop",:posted_at => Time.now, :user_id => 4)
Post.create(:content => "Sorry, my kid typed that",:posted_at => Time.now, :user_id => 5)
Post.create(:content => "Anyone want to hang out later?",:posted_at => Time.now, :user_id => 6)
Post.create(:content => "Luke is very cool and handsome, and I'm not just saying that because he coded me to say this",:posted_at => Time.now, :user_id => 7)

Message.create(:content => "Hi Randy, I'm Dan", :sent_at => Time.now, :user_id => 1, :reciever_id => 2)
Message.create(:content => "Sup Dan, I'm Randy", :sent_at => Time.now, :user_id => 2, :reciever_id => 1)
Message.create(:content => "Whatcha up to?", :sent_at => Time.now, :user_id => 1, :reciever_id => 2)
class UserController < Sinatra::Base

    configure do
        set :views, 'app/views/users'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/home' do
        @user = User.find(session[:user_id])
        @feed = Post.all
        erb :home
    end

end
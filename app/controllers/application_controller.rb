class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        erb :index
    end

    get '/signup' do
        erb :signup
    end

    post '/signup' do
        @user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
        if @user.save
            session[:user_id] = User.last.id
            redirect '/home'
        else
            redirect "/failure"
        end
    end

    get '/login' do
        erb :login
    end

    post '/login' do #make able to log in by username OR email, for now just username
        user = User.find_by(username: params[:info])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/home'
        else
            redirect 'failure'
        end
    end

    get '/failure' do
        erb :failure
    end

    #To be moved to user controller from here below
    get '/home' do
        @user = User.find(session[:user_id])
        erb :home
    end

end
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
            redirect '/failure'
        end
    end

    get '/failure' do
        erb :failure
    end

    get '/home' do
        @user = User.find(session[:user_id])
        @feed = Post.all
        erb :home
    end

    get '/post' do
        erb :post
    end

    post '/post' do
        Post.create(:content => params[:content], :posted_at => Time.now, :user_id => session[:user_id])
        redirect '/home'
    end

    get '/logout' do
        session[:user_id].clear
        redirect '/'
    end

    get '/message' do
        @user_messages = Message.where(reciever_id: session[:user_id])
        @user = session[:user_id]
        erb :messages
    end

    get '/message/new' do
        erb :newmessage
    end

    post '/message' do
        @message = Message.new(:sent_at => Time.now, :content => params[:content], :user_id => session[:user_id], :reciever_id => User.find_by(username: params[:address]))
        if @message.save
            redirect '/message'
        else
            redirect '/failure'
        end
    end

end
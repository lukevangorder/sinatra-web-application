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
        if User.find_by(username: params[:username])
            redirect '/unique'
        else
            if @user.save
                session[:user_id] = User.last.id
                redirect '/home'
            else
                redirect "/failure"
            end
        end
    end

    get '/login' do
        erb :login
    end

    post '/login' do #make able to log in by username OR email, for now just username
        user = User.find_by(username: params[:info])
        if user == nil
            user = User.find_by(email: params[:info])
            binding.pry
        end
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
        session.clear
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

    get '/post/:id' do
        @post = Post.find(params[:id])
        erb :postmod
    end

    patch '/post/:id' do
        post = Post.find(params[:id])
        post.content = params[:changes]
        post.save
        redirect '/home'
    end

    delete '/post/:id' do
        Post.find(params[:id]).destroy
        redirect '/home'
    end

    get '/unique' do
        erb :username
    end

end
class PostController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/post' do
        erb :post
    end

    post '/post' do
        if params[:content] == ""
            redirect '/home'
        else
            Post.create(:content => params[:content], :posted_at => Time.now, :user_id => session[:user_id])
            redirect '/home'
        end
    end

    get '/post/:id' do
        @post = Post.find(params[:id])
        if session[:user_id] == @post.user_id
            erb :postmod
        else
            redirect :home
        end
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

end
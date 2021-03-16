class MessageController < Sinatra::Base

    configure do
        set :views, 'app/views/messages'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/message' do
        # @user_messages = Message.where(reciever_id: session[:user_id])
        
        @user = session[:user_id]
        @user_messages = User.find(@user).messages

        erb :messages
    end

    get '/message/new' do
        erb :newmessage
    end

    post '/message' do

        @message = Message.create(:sent_at => Time.now, :content => params[:content], :user_id => session[:user_id], :reciever_id => User.find_by(username: params[:address]).id)

        if @message.save
            redirect '/message'
        else
            redirect '/failure'
        end
    end

end
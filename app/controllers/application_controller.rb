class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
    end

    get '/' do
        erb :index
    end

    post '/signup' do
        user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
        if user.save
            redirect "/login"
        else
            redirect "/failure"
        end
    end

end
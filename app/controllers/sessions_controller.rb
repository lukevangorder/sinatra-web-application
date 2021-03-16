class SessionsController < ApplicationController

    def create
        session[:username] = params[:username]
        redirect_to '/home'
    end

end
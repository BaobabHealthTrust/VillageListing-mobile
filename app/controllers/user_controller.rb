class UserController < ApplicationController
  def login
    if request.post?
      server_address = '192.168.6.205:3001'
      uri = "http://#{server_address}/remote_login.json/"
      user = RestClient.post(uri,params)
      unless user.blank?
        session[:user] = JSON.parse(user)
        redirect_to '/' and return
      end
    end
  end

  def logout
    reset_session
    redirect_to '/login' and return
  end

end

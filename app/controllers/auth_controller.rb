class AuthController < ApplicationController
    protect_from_forgery prepend: true
    
    def create 
    user = User.find_by(username: params[:username][0])

    if(user && user.authenticate(params[:password][0]))
      payload = {user_id: user.id}
      token = encode(payload)
      new_hash = {}
      new_hash["user_data"] = {id: user.id, username: user.username}
      new_hash["token"] = token
      render json: new_hash
    else
      render json: {
        error_message: "Incorrect username or password"
      }
    end
    
  end
end
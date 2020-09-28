class UsersController < ApplicationController
   protect_from_forgery prepend: true
  #  skip_before_action :authorized, only: [:create]

    def index
      @users = User.all
      render json: {users: @users.as_json(
        include: {groups:{include: :books}})}
    end
  
    def show
      @user = User.find(params[:id])
      render json: {user: @user.as_json(
        :include => {:groups => {:include => {:group_books => {:include => :book}}}})}
    end

    # include: [:book, {posts: {include: :user}}])

    # (except: :password_digest,

    def profile
      token = request.headers["Authenticate"]
      user = User.find(decode(token)["user_id"])
      render json: user.to_json
      # {user: @user.as_json(
      #   include: {groups:{include: :books}})}
    end

    def create
      @user = User.create(username: params[:username], password: params[:password], avatar: params[:avatar])
      if @user.valid?
        @token = encode(user_id: @user.id)
      end
      render json: @user.to_json

    end


    # def update
    #   @user = User.find(params[:id])
    #   @user.assign_attributes()
    #   @user.save
    # end

    # def destroy
    #   @user = User.find(params[:id])
    #   @user.destroy
    # end

    # private
    # def user_params
    #   params.require(:user).permit([:user][:username], [:user][:password])
    # end
  
  end
  
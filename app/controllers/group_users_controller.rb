class GroupUsersController < ApplicationController
    protect_from_forgery prepend: true


    def index
        @group_users = GroupUser.all
        render json: @group_users.to_json
       end
     
    def show
        @group_user = GroupUser.find(params[:id])
        render json: @group_user.to_json
    end

    def create
        @group_user = GroupUser.create(user_id: params[:user][:user_id], group_id: params[:user][:group_id])
        render json: @group_user.to_json
    end

    # def update
    #     @user_group = UserGroup.find(params[:id])
    #     @user_group.assign_attributes()
    #     @user_group.save
    # end


end

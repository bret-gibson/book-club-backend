class GroupsController < ApplicationController
  protect_from_forgery prepend: true

    def index
       @groups = Group.all
        render json: @groups.to_json(include: [{group_books: {include: :book}}, :users])
      end
    
      def show
        @group = Group.find(params[:id])
        render json: @group.to_json(include: [{group_books: {include: :book}}, {users: {include: :posts}}])
      end

      def create
        @group = Group.create(
          name: params[:user][:name], 
          description: params[:user][:description], 
          image_url: params[:user][:image_url],
          public: params[:user][:public], 
          admin_user_id: params[:user][:admin_user_id])
        render json: @group.to_json(include: [{group_books: {include: :book}}, :users])
      end

      def update
        @group = Group.find(params[:id])
        @group.assign_attributes(
          name: params[:user][:name], 
          description: params[:user][:description], 
          public: params[:user][:public], 
          admin_user_id: params[:user][:admin_user_id])
        @group.save
      end

      def destroy
        @group = Group.find(params[:id])
        @group.destroy
      end
end
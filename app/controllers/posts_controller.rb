class PostsController < ApplicationController
    protect_from_forgery prepend: true

    def index
        @posts = Post.all
        render json: @posts.to_json
      end
    
      def show
        @post = Post.find(params[:id])
        render json: @post.to_json
      end
    
      def create
        @post = Post.create(
            user_id: params["user_id"],
            group_book_id: params["group_book_id"],
            content: params["content"],
            parent_id: params["parent_id"]
        )
        render json: @post.to_json
      end

      def update
        @post = Post.find(params[:id])
        @post.assign_attributes(content: params["content"])
        @post.save
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
      end
end

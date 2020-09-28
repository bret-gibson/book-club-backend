class GroupBooksController < ApplicationController
  protect_from_forgery prepend: true

    def index
       @group_books = GroupBook.all
        render json: @group_books.to_json(include: :book)
      end
    
      def show
        @group_book = GroupBook.find(params[:id])
        render json: @group_book.to_json(include: [:book, {posts: {include: :user}}])
      end

      def create
        @group_book = GroupBook.create(
          group_id: params[:group_id],
          book_id: params[:book_id],
          active: false,
          status: ""
      )
        render json: @group_book.to_json
      end

      def update
        @group_book = GroupBook.find(params[:id])
        @group_book.assign_attributes(
         active: params[:active],
         status: params[:status]
        )
        @group_book.save
      end

      def destroy
        @group_book = GroupBook.find(params[:id])
        @group_book.destroy
      end
end

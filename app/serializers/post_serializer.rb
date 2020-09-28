class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :group_book_id, :content, :parent_it
end

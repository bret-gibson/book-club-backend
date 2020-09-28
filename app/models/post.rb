class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :group_book
end

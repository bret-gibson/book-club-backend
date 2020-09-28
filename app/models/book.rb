class Book < ApplicationRecord
    has_many :group_books
    has_many :groups, through: :group_books

end

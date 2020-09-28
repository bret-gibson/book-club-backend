class Group < ApplicationRecord
    has_many :group_books
    has_many :books, through: :group_books
    has_many :group_users
    has_many :users, through: :group_users
end

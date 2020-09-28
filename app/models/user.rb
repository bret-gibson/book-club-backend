class User < ApplicationRecord
    has_many :posts
    has_many :group_users
    has_many :groups, through: :group_users
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end

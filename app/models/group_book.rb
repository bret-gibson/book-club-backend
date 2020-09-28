class GroupBook < ApplicationRecord
    belongs_to :group
    belongs_to :book
    has_many :posts
end

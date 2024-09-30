class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    # A user can like a specific post only once
    validates :user_id, uniqueness: { scope: :post_id }
end

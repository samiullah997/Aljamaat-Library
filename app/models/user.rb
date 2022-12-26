class User < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :posts, through: :categories, dependent: :destroy
end

class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }

  belongs_to :user
  has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates :desc, presence: true
  has_rich_text :desc

  belongs_to :user
  belongs_to :category
end

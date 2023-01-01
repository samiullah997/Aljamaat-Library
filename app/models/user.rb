class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :address, presence: true, length: { minimum: 3, maximum: 100 }
  validates :role, presence: true, length: { minimum: 3, maximum: 25 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :posts, through: :categories, dependent: :destroy
end

class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :name, presence: true

  enum gender: %i[male female other]

  has_many :teams, dependent: :delete_all

  has_one_attached :picture
end

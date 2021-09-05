class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
 
  validates :name,presence: true

  enum gender: [:male, :female, :other]       
end

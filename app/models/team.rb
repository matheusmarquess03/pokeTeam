class Team < ApplicationRecord
  belongs_to :trainer

  validates :name, presence: true
end

class Member < ApplicationRecord
  belongs_to :team
  validates :name, :email, :role, presence: true
end

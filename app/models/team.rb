class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  validates :name, presence: true
  validates :leader_phone, presence: true

  accepts_nested_attributes_for :members, allow_destroy: true
  end
  
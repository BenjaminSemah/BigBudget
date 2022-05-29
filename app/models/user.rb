class User < ApplicationRecord
  validates :name, presence: true

  has_many :entities
  has_many :groups
end

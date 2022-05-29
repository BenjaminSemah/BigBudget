# rubocop:disable Layout/EndOfLine
class User < ApplicationRecord
  validates :name, presence: true

  has_many :entities
  has_many :groups
end
# rubocop:enable Layout/EndOfLine

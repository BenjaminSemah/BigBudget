# rubocop:disable Layout/EndOfLine
class Entity < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :groups
end
# rubocop:enable Layout/EndOfLine

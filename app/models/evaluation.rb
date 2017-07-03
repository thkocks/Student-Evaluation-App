
class Evaluation < ApplicationRecord
  belongs_to :student

  validates :date, presence: true
  validates :color, presence: true

  include Randomable

end

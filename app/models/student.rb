class Student < ApplicationRecord
  belongs_to :batch
  has_many :evaluations, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo, presence: true

  default_scope { order(first_name: :asc) }

  include Randomable

  def name
    "#{first_name} #{last_name}"
  end

  def percentages
  colors = []
    evaluations.each do |evaluation|
      colors << evaluation.color
  end

    if !colors.empty?
      {
        green: (colors.count(1) * 100) / colors.size ,
        yellow: (colors.count(2) * 100) / colors.size,
        red: (colors.count(3) * 100) / colors.size
      }
    else
      {}
    end
  end
end

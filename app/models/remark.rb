class Remark < ApplicationRecord
  belongs_to :user
  belongs_to :day

   validates :notice, presence: true
end

class Batch < ApplicationRecord
  has_many :students, dependent: :destroy

  validates :number, presence: true, uniqueness: true
  validates :start_date, presence: true, uniqueness: true
  validates :end_date, presence: true, uniqueness: true

  scope :order_by_id, -> { order(:id) }

  # def pick_color
  #   pick = rand(1..3)
  #     if
  # end
  #
  # def random_student hash
  #   total_weight = hash.inject(0) { |sum,(weight, v)| sum+weight }
  #   wunning_weight = 0
  #   n = rand*total_weight
  #   has.each do |weight, v|
  #     return v if n > running_weight && n <= running_weight+weightreturn_weight += weight
  #   end
  # end
  #
  # def get_student
  #   students.each do |student|
  #     student.evaluations.each do do |evaluation|
  #
  #
  #     end
  #   end
  # end

  def get_student
    students_array = []
    students.each do |student|
			student.evaluations.each do |evaluation|
        random = rand(100)
          if (random <= 17)
            students_array += [student.name] if evaluation.color == 1
          elsif (random <= 67)
            students_array += [student.name] if evaluation.color == 1
          else
            students_array += [student.name] if evaluation.color == 1
          end
        end
      end
    students_array.sample
  end


  # def get_student
	# 	students_array = []
	# 	students.each do |student|
	# 		student.evaluations.each do |evaluation|
	# 			students_array += [student.name] if evaluation.color == 1
	# 			students_array += [student.name] * 2 if evaluation.color == 2
	# 			students_array += [student.name] * 3 if evaluation.color == 3
	# 		end
	# 	end
	# 	students_array.sample
	# end

  def percentages
  colors = []
  students.each do |student|
    student.evaluations.each do |evaluation|
      colors << evaluation.color
    end
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


# Pick a random student based on:
#
# - Generate a random number to determine color first
# - Then select a random student with that color:
#  - Use the database to pick a only one random student
# - Write unit tests (model only) that prove the above algorithm works!
# + bonus: select students with less questions more that those with more questions

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




  def percentages
    students_collection = []
    students.each do |student|
			student.evaluations.each do |evaluation|
        random = rand(100)
          if (random <= 17)
            students_collection += [student.name] if evaluation.color == 1
          elsif (random <= 67)
            students_collection += [student.name] if evaluation.color == 1
          else
            students_collection += [student.name] if evaluation.color == 1
          end
        end
      end
    students_collection.sample
  end
  #
  # def get_student
  #   students_collection = []
  #   students.each do |student|
	# 		student.evaluations.each do |evaluation|
  #       random = rand(100)
  #         if (random <= 17)
  #           students_collection += [student.name] if evaluation.color == 1
  #         elsif (random <= 67)
  #           students_collection += [student.name] if evaluation.color == 3
  #         else
  #           students_collection += [student.name] if evaluation.color == 2
  #         end
  #       end
  #     end
  #   students_collection.sample
  # end
  #
  # def get_random_student
  #   rndm_stundents = []
  #     students.each do |student|
  #       student.evaluations.each do |evaluation|
  #       rndm_stundents << [student.name]
  #     end
  #     rndm_students.sample
  # end

  def randomfind
    students.order("RANDOM()").limit(1)
  end

  def percentages
    colors = []
    students.each do |student|
      student.evaluations.each do |evaluation|
        colors << evaluation.color
      end
    end

      if !colors.empty?
        {
        green: colors.count(1) * 100 / colors.size,
        yellow: colors.count(2) * 100 / colors.size,
        red: colors.count(3) * 100 / colors.size
      }
      else
        {}
      end
  end
end



def pick_color
  # color_picked = []
  picked_students = []
  pick = rand(1..3)
  if (pick == 1)
    # color_picked = [1]
    students.each do |student|
      student.evaluations.each do |evaluation|
        if (evaluation.color == 1)
          picked_students = [student.name]
        else
          []
        end
      end
    end
  elsif (pick == 2)
    # color_picked = [2]
    students.each do |student|
      student.evaluations.each do |evaluation|
        if (evaluation.color == 1)
          picked_students << [student.name]
        else
          []
        end
      end
    end
  elsif (pick == 3)
    # color_picked = [3]
    students.each do |student|
      student.evaluations.each do |evaluation|
        if (evaluation.color == 1)
          picked_students += [student.name]
        else
          []
        end
      end
    end
    picked_students.sample(1)
  else
    []
  end
end
end

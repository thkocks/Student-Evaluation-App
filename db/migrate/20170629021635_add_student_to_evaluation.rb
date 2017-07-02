class AddStudentToEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_reference :evaluations, :student, foreign_key: true
  end
end

class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.datetime :date
      t.integer :color
      t.string :remark

      t.timestamps
    end
  end
end

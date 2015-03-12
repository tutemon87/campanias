class AddOptionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :integer , default: 1
    add_column :questions, :is_required, :boolean
    add_column :questions, :max_options, :integer
    add_column :questions, :min_options, :integer
  end
end

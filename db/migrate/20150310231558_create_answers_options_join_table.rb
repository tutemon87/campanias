class CreateAnswersOptionsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :answers_options, :id => false do |t|
      t.integer :answer_id
      t.integer :option_id
    end

    add_index :answers_options, [:answer_id,:option_id]
  end

  def self.down
    drop_table :answers_options
  end
end

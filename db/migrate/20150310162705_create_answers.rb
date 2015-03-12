class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :question, index: true
      t.references :survey_result, index:true
      t.references :option, index: true
      t.timestamps
    end
  end
end

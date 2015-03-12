class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey_result
  has_and_belongs_to_many :options
end

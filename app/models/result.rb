class Result < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  self.inheritance_column = :type
  scope :simples, -> { where(type: 'SimpleResult') } 
  scope :surveys, -> { where(type: 'SurveyResult') } 
 
  
  def self.types
     %w(SimpleResult SurveyResult)
  end
end

class SurveyResult < Result
  belongs_to :survey 
  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true
  def self.model_name
    Result.model_name
  end
end

class SimpleResult < Result
  def self.model_name
    Result.model_name
  end
end


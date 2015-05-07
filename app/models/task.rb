class Task < ActiveRecord::Base
  belongs_to :user
  has_many :results
  enum targeted_to: [ :single, :general]
  scope :meetings, -> { where(type: 'MeetingTask')} 
  scope :surveys, ->  { where(type: 'SurveyTask') } 
  scope :socials, ->  { where(type: 'SocialTask') }
  scope :simples, ->  { where(type: 'SimpleTask') }

  def self.types
     %w(SimpleTask MeetingTask SocialTask SurveyTask)
  end
  
end

class SimpleTask < Task
  def self.model_name
    Task.model_name
  end
end

class SocialTask < Task
  enum action: [ :facebook, :twitter]
  def self.model_name
    Task.model_name
  end
end


class SurveyTask < Task
  belongs_to :survey
  def self.model_name
    Task.model_name
  end
end

class MeetingTask < Task
  def self.model_name
    Task.model_name
  end
end

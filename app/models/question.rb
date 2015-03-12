class Question < ActiveRecord::Base
  self.inheritance_column = nil
  enum type: [ :multiple, :boolean, :text]
  
  belongs_to :survey
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end

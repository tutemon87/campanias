class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks
  after_initialize :defaults

  def defaults
    self.id ||= 0
    self.name = ''
    self.email = ''
    self.password = ''
    self.avatar = ''
  end

end

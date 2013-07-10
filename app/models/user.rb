class User < ActiveRecord::Base
  attr_accessible :username, :password

  validates :username, :uniqueness => { :scope => :password }

end

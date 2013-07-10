class Cat < ActiveRecord::Base

  attr_accessible :age, :birth_date, :color, :name, :sex

  validates :age, :presence => :true


end

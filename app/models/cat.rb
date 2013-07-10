class Cat < ActiveRecord::Base

  attr_accessible :age, :birth_date, :color, :name, :sex

  validates :age, :presence => :true

  has_many :cat_rental_requests, :dependent => :destroy

end

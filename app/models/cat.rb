class Cat < ActiveRecord::Base

  attr_accessible :age, :birth_date, :color, :name, :sex, :user_id

  validates :age, :presence => :true

  has_many :cat_rental_requests, :dependent => :destroy

end

class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :begin_date, :end_date, :status
  validate :overlap?

  validates :begin_date, :end_date, :presence => :true

  belongs_to :cat

  before_save :default_values
  def default_values
    self.status ||= 'undecided'
  end

  def overlap?
    possible_conflicts = CatRentalRequest.where(
      "cat_rental_requests.id != ? AND cat_rental_requests.cat_id = ?",
      self.id,
      self.cat_id
    )

    conflict = possible_conflicts.any? do |cat|
      self.begin_date.between?(cat.begin_date, cat.end_date) &&
      self.end_date.between?(cat.begin_date, cat.end_date)
    end
    if conflict
      self.errors[:base] << "Dates overlap"
    end
  end

  def approve
    self.status = 'approved'
    self.save
  end

  def deny
    self.status = 'denied'
    self.save
  end


end

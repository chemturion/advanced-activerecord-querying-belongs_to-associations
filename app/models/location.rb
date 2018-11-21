class Location < ActiveRecord::Base
  belongs_to :region
  has_many :people

  def self.in_region(region)
    all.joins(:region).merge(Region.where(name: region))
  end
end

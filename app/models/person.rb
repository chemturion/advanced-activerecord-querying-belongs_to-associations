class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.in_region(region)
    all.joins(:location)
       .merge(Location.where(region: Region.find_by(name: region)))
  end

  def self.alphabetically_by_region_and_location
    all.joins(location: [:region])
       .merge(Region.order(:name))
       .merge(Location.order(:name))
       .order(:name)
  end
end

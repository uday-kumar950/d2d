class ServiceTrip < ApplicationRecord
  belongs_to :vehicle  
  has_many :vehicle_locations
end

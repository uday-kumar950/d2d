class VehicleLocation < ApplicationRecord
  belongs_to :service_trip
  belongs_to :vehicle

  #validates_uniqueness_of :service_trip_id, scope: [:vehicle_id,:lat,:lng]
end

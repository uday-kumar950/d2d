class AllygatorShuttle 
  attr_accessor :data, :params
  def initialize(params, raw_data)
    self.params = params.dup
    self.data = raw_data
  end

  def process
    service_trip = ServiceTrip.find_or_create_by(vehicle_id: params[:id],travel_date: Date.today,running_status: true)
  	location = VehicleLocation.new
  	location.lat = data[:lat]
  	location.lng = data[:lng]
  	location.at = data[:at]
  	location.vehicle_id = params[:id]
    location.service_trip_id = service_trip.id
  	location.save
    puts location.errors.to_a
  end

end
class LiveTrackController < ApplicationController

	before_action :get_vehicle,only: [:get_vehicle_feeds,:get_current_location]

	def index
		service_trips = ServiceTrip.where(running_status: true)
		@vehicles = Vehicle.where(id: service_trips.pluck(:vehicle_id))
		@locations  = VehicleLocation.find_by_sql(["select v1.* from vehicle_locations v1 LEFT JOIN vehicle_locations v2
		  	ON (v1.service_trip_id = v2.service_trip_id and v1.vehicle_id = v2.vehicle_id and v1.id < v2.id)
			WHERE v2.id IS NULL and v1.service_trip_id in (?) and v1.vehicle_id in (?)", service_trips.map(&:id), service_trips.map(&:vehicle_id)]).map{|v| [v.lat,v.lng,v.vehicle.uuid]}
	end

	def get_vehicle_feeds		
		service_trip = ServiceTrip.where(vehicle_id: @vehicle.id,running_status: true).last
		locations = service_trip.vehicle_locations.pluck(:lat,:lng,:at)
		render json: locations
	end

	def get_current_location
		service_trip = ServiceTrip.where(vehicle_id: @vehicle.id,running_status: true).last
		location = service_trip.vehicle_locations.last
		render json: location.present? ? [location.lat,location.lng,location.at,location.vehicle.uuid] : []
	end

	private

	def get_vehicle
		@vehicle = Vehicle.find_by_id(params[:id])
	end
	
end

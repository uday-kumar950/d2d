class VehiclesController < ApplicationController
   
    
  before_action :get_raw_data,only: [:new,:locations]

  before_action :get_vehicle,only: [:delete,:locations]

  D2D_LAT_LNG = [52.53,13.403]
  
  def new
  	vehicle = Vehicle.find_or_initialize_by(uuid: @raw_data[:id])
  	vehicle.regd_status = true
  	if vehicle.save
  		data = {code: 204}
  	else
		  data = {code: 500,msg: "Record not saved"}
    end
  	render json: data
  end

  def locations
    distance = calc_distance_in_kms([@raw_data["lat"],@raw_data["lng"]])
    if distance > 3.5
      data = {code: 404,msg: "Invalid!! Distance is more than 3.5 km from D2D"} 
    elsif @vehicle.present? && @vehicle.regd_status
  	   BaseFeedJob.perform_async(params,@raw_data)
       data = {code: 204} 
    elsif @vehicle.present? && !@vehicle.regd_status
       data = {code: 404,msg: "Unresgisterd vehicle"} 
    else
       data = {code: 404,msg: "No record found"}
    end
  	render json: data
  end

  def delete
  	if @vehicle.present?
  		@vehicle.update_attribute(:regd_status,false)
		  data = {code: 204}  		
  	else
		  data = {code: 404,msg: "No record found"}
  	end
  	render json: data
  end

  private

  def get_vehicle
    @vehicle = Vehicle.find_by_id(params[:id])
  end

  def get_raw_data
  	@raw_data = JSON.parse(request.raw_post).with_indifferent_access if request.raw_post.present?
  end

  def calc_distance_in_kms(destination)
    Geocoder::Calculations.distance_between(D2D_LAT_LNG, destination)
  end
end

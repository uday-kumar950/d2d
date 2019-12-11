class CreateVehicleLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_locations do |t|
      t.references :service_trip, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.decimal :lat, precision: 15, scale: 10, default: 0.0
      t.decimal :lng, precision: 15, scale: 10, default: 0.0
      t.datetime :at

      t.timestamps
    end
    add_index "vehicle_locations", ["vehicle_id","service_trip_id"], :name => "vehicle_locations_vehicle_service_trip"
  end
end

class CreateServiceTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :service_trips do |t|
      t.references :vehicle, foreign_key: true
      t.date :travel_date
      t.boolean :running_status,default: true

      t.timestamps
    end
    add_index "service_trips", ["vehicle_id","travel_date"], :name => "service_trips_vehicle_travel_date"
  end
end

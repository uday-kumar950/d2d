class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :uuid
      t.boolean :regd_status,default: true

      t.timestamps
    end
  end
end

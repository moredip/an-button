class CreateDeviceHeartbeats < ActiveRecord::Migration[5.1]
  def change
    create_table :device_heartbeats do |t|
      t.references :device, foreign_key: true
      t.datetime "created_at"
    end
  end
end

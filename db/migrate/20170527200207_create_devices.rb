class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :uid
      t.string :description
      t.timestamps
    end
  end
end

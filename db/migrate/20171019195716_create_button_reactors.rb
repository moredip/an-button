class CreateButtonReactors < ActiveRecord::Migration[5.1]
  def change
    create_table :button_reactors do |t|
      t.references :device, foreign_key: true
      t.timestamps
      t.string :reaction_strategy
      t.string :reaction_param
    end
  end
end

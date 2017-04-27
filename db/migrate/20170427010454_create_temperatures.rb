class CreateTemperatures < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|
      t.string :place
      t.float :temperature
      t.float :humidity
      t.float :pressure

      t.timestamps
    end
  end
end

class CreateLines < ActiveRecord::Migration[7.0]
  def change
    create_table :lines do |t|
      t.string :name
      t.bigint :end_station_id

      t.timestamps
    end
  end
end

class CreateDepartureTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :departure_times do |t|
      t.references :station
      t.references :line
      t.references :day_of_week
      t.integer :time_of_day


      t.timestamps

      #add_index :departure_times, [:station_id, :line_id, :day_of_week_id], unique: true
    end
  end
end

class Finder

  def find_lines(startstation, targetstation, timeslot, day_of_week)
    lines = Line.includes(:departure_times).where(end_station: targetstation).where(departure_times: {station: startstation}).where(departure_times: {day_of_week: day_of_week}).where(departure_times: {time_of_day: timeslot..}).pluck(:name, :time_of_day)
    lines = lines.map{|item| "#{startstation.name}, #{item[0]} nach #{targetstation.name} um #{(item[1]/100 == 0) ? "0" : "" }#{item[1]/100}:#{(item[1]%100 < 10) ? "0" : "" }#{item[1]%100}"}
    if lines.empty?
      find_lines(startstation, targetstation, 0, day_of_week.next_day)
  end

  def find_stations_with_departures(timeslot, day_of_week)
    stations = Station.includes(:lines, :departure_times).where(departure_times: {day_of_week: day_of_week}).where(departure_times: {time_of_day: timeslot}).pluck(:name)
  end




end


#[["U35", 825], ["U35", 925], ["U35", 1000]]
#.map{|item| item[0]}

#=> ["U35", "U35", "U35"]


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u35_list=[
  "Hbf",
  "Oskar-Hoffmann-Straße",
  "Waldring",
  "Wasserstraße",
  "Brenscheder Straße",
  "Markstraße",
  "Gesundheitscampus",
  "Ruhr-Universitaet",
  "Lennershof",
  "Hustadt"
]

l308_list=[
  "Hbf",
  "Bermuda-Dreieck",
  "Schauspielhaus",
  "Bergmannsheil",
  "Friederika Straße",
  "Kohlenstraße",
  "Knoopstraße",
  "Weitmar Mitte"
]

week_days=[
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
]


def create_week_days(liste)
  liste.each do |w|
    DayOfWeek.create(day: w)
  end
end


def create_stations(liste)
  liste.each do |s|
    Station.create(name: s)
  end
end


def create_departure_times(line, station_list, day_of_week, time_of_day)
  #line in Line, station_list is list of strings (names)
  #day_of_week in DayOfWeek, time_of_day is integer hhmm
  create_stations(station_list)
  t=time_of_day
  station_list=Station.names_in(station_list)
  station_list.each do |s|
    if (t%100)>= 60
      t+=40
    end
    DepartureTime.create(line: line, station: s, day_of_week: day_of_week, time_of_day: t)
    t+=5

  end
end


create_week_days(week_days)
create_stations(u35_list)
create_stations(l308_list)

l1 = Line.create(name: "U35", end_station: Station.find_by(name: "Hustadt"))
l2 = Line.create(name: "308", end_station: Station.find_by(name: "Weitmar Mitte"))

create_departure_times(l1, u35_list, DayOfWeek.find(1), 800)
#create_departure_times(l1, u35_list, DayOfWeek.find(1), 800)
create_departure_times(l1, u35_list, DayOfWeek.find(1), 900)
create_departure_times(l1, u35_list, DayOfWeek.find(2), 800)
create_departure_times(l1, u35_list, DayOfWeek.find(3), 800)


create_departure_times(l2, l308_list, DayOfWeek.find(1), 900)
create_departure_times(l2, l308_list, DayOfWeek.find(5), 1300)
create_departure_times(l2, l308_list, DayOfWeek.find(5), 1440)
create_departure_times(l2, l308_list, DayOfWeek.find(7), 1500)

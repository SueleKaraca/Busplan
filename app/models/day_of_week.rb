class DayOfWeek < ApplicationRecord
  has_many :departure_times

  def next_day
    s=self.id
    if s==7
      s=1
    else
      s+=1
    end
    return DayOfWeek.find(s)
  end
end

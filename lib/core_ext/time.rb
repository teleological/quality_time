
require 'date'
# Time#to_date defined in date library extension

class Time

  # Returns a Date object denoting the chronological Julian day corresponding
  # to the Time value's Gregorian date. Date objects returned by this method
  # use the Gregorian calendar or proleptic Gregorian calendar for any value.
  def to_gregorian_date
    to_date_with_start(Date::GREGORIAN)
  end

  # Returns a Date object denoting the chronological Julian day corresponding
  # to the Time value's Gregorian date. Date objects returned by this method
  # use the Julian calendar for any value.
  def to_julian_date
    to_date_with_start(Date::JULIAN)
  end

  private

  def to_date_with_start(start)
    d = to_date
    d.start == start ? d : d.new_start(start)
  end

end


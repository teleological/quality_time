
require 'date'

class Date

  # Returns a local Time object denoting the start (in local time) of the
  # chronological Julian day represented by the Date. Note that Time objects
  # always use the Gregorian calendar to calculate civil coordinates such as
  # month, day and year. This method is intended to replace the standard
  # Date#to_time method, which produces invalid Time objects for Dates which
  # use the Julian calendar.
  def to_local_time
    Time.local(*gregorian_civil_coordinates)
  end

  # Returns a UTC Time object denoting the start (in UTC) of the
  # chronological Julian day represented by the Date.  Note that Time objects
  # always use the Gregorian calendar to calculate civil coordinates such as
  # month, day and year.
  def to_utc_time
    Time.utc(*gregorian_civil_coordinates)
  end

  private

  def gregorian_civil_coordinates
    d = gregorian? ? self : gregorian
    [ d.year, d.month, d.day ]
  end

end


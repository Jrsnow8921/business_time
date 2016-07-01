# Add workday and weekday concepts to the Date class
class Date
  include BusinessTime::TimeExtensions

  def business_days_until(to_date, inclusive = false)
    business_dates_until(to_date, inclusive).size
  end

  def business_dates_until(to_date, inclusive = false)
    if inclusive
      (self..to_date).select(&:workday?).strftime('%m/%d/%Y')
    else
      (self...to_date..select(&:workday?).strftime('%m/%d/%Y')
    end
  end
end

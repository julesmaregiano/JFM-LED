module ApplicationHelper


  def date_in_futur(date)
    (Date.current <=> date) < 1
  end

  def months
    @months = %w(janvier février mars avril mai juin juillet août septembre octobre novembre décembre)
  end

  def week_days
    @week_days = %w(lundi mardi mercredi jeudi vendredi samedi dimanche)
  end

  def date_with_hour(date, hour)
    DateTime.parse(date.to_s + " 0"+ hour + ":00:00 +0000")
  end

  def date_in_futur(date)
    (Date.current <=> date) < 1
  end

  def weekend?(day)
    day.sunday? || day.saturday?
  end

end

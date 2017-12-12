module ApplicationHelper

  def date_in_futur(date)
    (Date.today <=> date) < 1
  end

end

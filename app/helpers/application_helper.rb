module ApplicationHelper


  def date_in_futur(date)
    (Date.today <=> date) < 1
  end

  def role_to(user, destination)
    if user.manager?
      link_to manager_destination_path(destination)
    elsif user.pro?
      link_to pro_destination_path(destination)
    elsif user.particulier?
      link_to particulier_destination_path(destination)
    elsif user.technician
      link_to technician(destination)
    end
  end

  def role_2(destination)
    if current_user.manager?
      manager_destination_path(destination)
    elsif current_user.pro?
      pro_destination_path(destination)
    end

  end

end

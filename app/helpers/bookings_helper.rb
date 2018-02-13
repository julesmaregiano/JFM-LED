module BookingsHelper

  def for_my_branch(user)
    self.map do |b| b if b.availabilities.first.user.branch == user.branch end.compact
  end

end

class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    return "#{object.user.firstname} #{object.user.lastname}"
  end

  def created
    return "#{object.created_at.strftime("%d-%m-%y")}"
  end

end

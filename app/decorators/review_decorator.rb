class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    return "#{object.user.firstname} #{object.user.lastname}"
  end

end

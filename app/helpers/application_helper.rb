module ApplicationHelper

  # CHECK USER IMAGE ---------------------------------------
  def check_user_image(user)
    unless user.image.present?
      user.image = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQPNRo9hZ3RmFOmIc3YfR_aqLwJyQv05UTO6Q&usqp=CAU"
      return
    end
  end

end

class PostMailer < ActionMailer::Base
  default from: "bigcolors@akaruilabs.com"

  def notify_user(email)
  	@to= email
    mail(to: @to, subject: "some posts are created")
  end

  def notify_user_on_update(email)
    @to= email
    mail(to: @to, subject: "your post is updated")
  end

  def notify_user_on_comment(email)
    @to= email
    mail(to: @to, subject: "someone commented on your post")
  end
end

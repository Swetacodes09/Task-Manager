class UserMailer < ApplicationMailer
  def reminder_email(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'Task Deadline Reminder')
  end
end

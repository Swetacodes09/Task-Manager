class ReminderJob < ApplicationJob
  queue_as :default

  def perform(task)
    return if task.done?

    UserMailer.reminder_email(task.user, task).deliver_now
  end
end

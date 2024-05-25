class Task < ApplicationRecord
  belongs_to :user

  enum status: { backlog: 0, in_progress: 1, done: 2 }

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }

  scope :not_done, -> { where.not(status: :done) }

  after_commit :schedule_reminders, on: [:create, :update]

  private

  def schedule_reminders
    TaskReminderJob.set(wait_until: deadline - 1.day).perform_later(self.id) if deadline > 1.day.from_now
    TaskReminderJob.set(wait_until: deadline - 1.hour).perform_later(self.id) if deadline > 1.hour.from_now
  end
end

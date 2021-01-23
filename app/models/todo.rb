class Todo < ActiveRecord::Base

  validates :todo_text, presence: true
  validates :todo_text, length: {minimum: 2}
  validates :due_date, presence:true
  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text} | #{due_date.to_s(:long)}"
  end

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today
    all.where(due_date: Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end

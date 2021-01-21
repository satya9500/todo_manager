class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text} | #{due_date.to_s(:long)}"
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
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

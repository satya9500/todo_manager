class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.all.map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Todo status of #{id} is updated to #{completed}"
  end
end

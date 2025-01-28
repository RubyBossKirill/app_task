class Task::Update < ActiveInteraction::Base
  object :tasks, class: Task
  string :title, :description, :status
  integer :id

  def execute
    errors.merge!(task.errors) unless task.update(inputs.except(:task).compact)

    task
  end
end

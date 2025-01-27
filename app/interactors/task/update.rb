class Task::Update < ActiveInteraction::Base
  object :task, class: Task
  string :name

  def execute
    errors.merge!(task.errors) unless task.update(inputs.except(:task).compact)

    task
  end
end

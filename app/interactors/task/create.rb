class Task::Create < ActiveInteraction::Base # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment,Style/ClassAndModuleChildren
  string :title, :description, :status
  def execute
    task = Task.new(inputs.to_h.compact)
    return errors.merge!(task.errors) unless task.save

    task
  end
end

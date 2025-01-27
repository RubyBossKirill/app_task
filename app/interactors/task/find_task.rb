class Task::FindTask < ActiveInteraction::Base # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment,Style/ClassAndModuleChildren
  string :id
  def execute
    task = Task.find_by(id:)
    return errors.add(:id, 'Task not found') unless task.save

    task
  end
end

class TaskBlueprint < Blueprinter::Base
  identifier :id

  view :base do
    fields :task_id, :title, :description, :status
  end

  view :extend do
    include_view :base
    fields :create_at, :updated_at
  end
end

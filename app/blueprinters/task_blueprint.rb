class TaskBlueprint < Blueprinter::Base
  identifier :id

  view :base do
    fields :title, :description, :status
  end

  view :extend do
    include_view :base
    fields :create_at, :updated_at
  end
end

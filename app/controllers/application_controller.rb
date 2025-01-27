class ApplicationController < ActionController::API
  def render_resource_errors(resource, status: :unprocessable_entity)
    result = resource.errors.attribute_names.map do |attr|
      { key: attr, messages: resource.errors.full_messages_for(attr) }
    end
    render_errors(errors: result, status:)
  end

  def render_errors(errors: [], status: :unprocessable_entity)
    render json: { success: false, errors: }, status:
  end
end

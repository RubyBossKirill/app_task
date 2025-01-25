class TaskController < ApplicationController
  def show
  end

  def create
    render json: { 'success' => true,
                   'result' => TaskBlueprint.render(@task, view: :base) },
           status: :ok
  end

  def index
  end

  def update
  end

  def destroy
  end
end

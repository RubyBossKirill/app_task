class TaskController < ApplicationController
  def show
    render json: { 'success' => true,
                   'result' => TaskBlueprint.render(@task, view: :base) },
           status: :ok
  end

  def create
  end

  def index
  end

  def update
  end

  def destroy
  end
end

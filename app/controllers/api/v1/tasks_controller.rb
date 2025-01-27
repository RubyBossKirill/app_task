class Api::V1::TasksController < ApplicationController
  before_action :find_task, only: %i[show destroy update]

  def show
    render json: { 'success' => true,
                   'result' => TaskBlueprint.render_as_hash(@task, view: :base) },
           status: :ok
  end

  def create
    outcome = Task::Create.run(params)
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': TaskBlueprint.render_as_hash(outcome.result, view: :base) },
           status: :created
  end

  def index
    outcome = Task::Index.run
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': TaskBlueprint.render_as_hash(outcome.result, view: :base) },
           status: :ok
  end

  def update
    outcome = Task::Update.run(params.merge!(task: @task))
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': TaskBlueprint.render_as_hash(outcome.result, view: :base) },
           status: :ok
  end

  def destroy
    @task.destroy
    render json: {
      status: {
        message: "Task #{params[:id]} was successfully destroy."
      }
    }, status: :ok
  end

  private

  def find_task
    outcome = Task::FindTask.run(params)
    render_resource_errors(outcome) if outcome.errors.present?

    @task = outcome.result
  end
end

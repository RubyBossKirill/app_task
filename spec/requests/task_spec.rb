# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Tasks', type: :request do # rubocop:disable Metrics/BlockLength
  let!(:task) { create(:task) }
  let!(:params) do
    {
      'title' => 'New Task',
      'description' => 'New Description',
      'status' => 'in_progress'
    }
  end

  describe 'GET /api/v1/tasks' do
    it 'returns http success' do
      create_list(:task, 3)

      get '/api/v1/tasks'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    it 'returns http success' do
      create_list(:task, 3)

      get "/api/v1/tasks/#{task.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/tasks' do
    it 'creates a new task' do
      post '/api/v1/tasks',
           params: params
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /api/v1/tasks/:id' do
    it 'update the task' do
      put "/api/v1/tasks/#{task.id}",
          params: {
            'title' => 'Update title',
            'description' => 'Update descrip',
            'status' => 'completed'
          }
      expect(response).to have_http_status(:ok)

      updated_task = Task.find(task.id)
      expect(updated_task.title).to eq('Update title')
      expect(updated_task.description).to eq('Update descrip')
      expect(updated_task.status).to eq('completed')
    end
  end
end

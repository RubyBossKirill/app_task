require 'rails_helper'

RSpec.describe 'API::V1::Tasks', type: :request do
  let!(:task) { create(:task, title: 'Test Task', description: 'Test Description', status: 'pending') }

  describe 'GET /api/v1/tasks' do
    it 'returns http success' do
      get '/api/v1/tasks'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    it 'returns http success' do
      get "/api/v1/tasks/#{task.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/tasks' do
    it 'creates a new task' do
      post '/api/v1/tasks',
           params: { task: { title: 'New Task', description: 'New Description', status: 'in_progress' } }
      expect(response).to have_http_status(:created)
    end
  end
end

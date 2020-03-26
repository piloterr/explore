require 'rails_helper'

describe Api::V1::TasksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/tasks').to route_to('api/v1/tasks#index', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/v1/tasks').to route_to('api/v1/tasks#create', format: :json)
    end

    it 'routes to #update' do
      expect(put: '/api/v1/tasks/:id').to be_routable
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/tasks/:id').to be_routable
    end
  end
end
